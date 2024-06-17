package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.entity.*;
import com.laptrinhjavaweb.repository.DanhMucRepository;
import com.laptrinhjavaweb.repository.HoaDonRepository;
import com.laptrinhjavaweb.repository.KhuyenMaiSanPhamRepository;
import com.laptrinhjavaweb.repository.ThuongHieuRepository;
import com.laptrinhjavaweb.response.*;
import com.laptrinhjavaweb.resquest.SanPhamRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class SanPhamConverter {

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private AnhSanPhamConverter anhSanPhamConverter;
	
	@Autowired
	private ThuocTinhConverter thuocTinhConverter;

	@Autowired
	private BienTheConverter bienTheConverter;
	
	@Autowired
	private DanhMucConverter danhMucConverter;
	
	@Autowired
	private ThuongHieuConverter thuongHieuConverter;

	@Autowired
	private DanhMucRepository danhMucRepository;

	@Autowired
	private ThuongHieuRepository thuongHieuRepository;

	@Autowired
	private KhuyenMaiSanPhamRepository khuyenMaiSanPhamRepository;

	@Autowired
	private KhuyenMaiConvert khuyenMaiConvert;

	@Autowired
	private HoaDonRepository hoaDonRepository;

	public SanPhamResponse convertToResponse(SanPhamEntity entity) {
		SanPhamResponse response = modelMapper.map(entity, SanPhamResponse.class);
		response.setDanhMuc(danhMucConverter.convertToResponse(entity.getDanhMuc()));
		response.setThuongHieu(thuongHieuConverter.convertToResponse(entity.getThuongHieu()));
		List<AnhSanPhamResponse> anhSanPhamResponses = entity.getAnhSanPhamEntities().stream().map(
				item -> anhSanPhamConverter.convertToResponse(item)).collect(Collectors.toList());
		List<ThuocTinhResponse> thuocTinhResponses = entity.getThuocTinhEntities().stream().map(
				item -> thuocTinhConverter.convertToResponse(item)).collect(Collectors.toList());
		List<BienTheResponse> bienTheResponses = entity.getBienTheEntities().stream().map(
				item -> bienTheConverter.convertToResponse(item)).collect(Collectors.toList());
		Integer quantity = bienTheResponses.stream().mapToInt(i -> i.getSoLuong()).sum();
		KhuyenMaiSanPhamEntity khuyenMaiSanPhamEntity = khuyenMaiSanPhamRepository.findBySanPham_idAndTrangThaiOrSanPham_idAndTrangThai(entity.getId(), SystemConstant.ACTICE, entity.getId(), SystemConstant.UPCOMING);
		if(khuyenMaiSanPhamEntity != null && khuyenMaiSanPhamEntity.getTrangThai().equals(SystemConstant.ACTICE)){
			KhuyenMaiHienThiResponse khuyenMaiHienThiResponse = khuyenMaiConvert.convertToHienThiResponse(khuyenMaiSanPhamEntity.getKhuyenMai());
			Double giaBan = null;
			Double giaTri = Double.parseDouble(khuyenMaiHienThiResponse.getGiaTri());
			if(khuyenMaiHienThiResponse.getLoai().equals("1")){
				giaBan = entity.getGia() * ((100 - giaTri) / 100);
			}else{
				giaBan = entity.getGia() - giaTri;
			}
			response.setGiaBan(giaBan);
			response.setKhuyenMaiHienThiResponse(khuyenMaiHienThiResponse);
		}else{
			response.setGiaBan(entity.getGia());
		}

		List<Long> idsBienThe = entity.getBienTheEntities().stream().map(
				item -> item.getId()
		).collect(Collectors.toList());
		response.setSoLuong(quantity);
		response.setThuocTinh(thuocTinhResponses);
		response.setBienThe(bienTheResponses);
		response.setAnh(anhSanPhamResponses);
		return response;
	}

	public SanPhamEntity convertToEntity(SanPhamRequest request){
		SanPhamEntity entity = modelMapper.map(request, SanPhamEntity.class);
		DanhMucEntity danhMucEntity = danhMucRepository.findBySlug(request.getDanhMucSlug());
		ThuongHieuEntity thuongHieuEntity = thuongHieuRepository.findBySlug(request.getThuongHieuSlug());
		entity.setDanhMuc(danhMucEntity);
		entity.setThuongHieu(thuongHieuEntity);
		return entity;
	}
}
