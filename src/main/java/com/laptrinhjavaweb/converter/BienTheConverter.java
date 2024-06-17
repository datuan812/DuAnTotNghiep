package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.entity.KhuyenMaiSanPhamEntity;
import com.laptrinhjavaweb.entity.SanPhamEntity;
import com.laptrinhjavaweb.repository.KhuyenMaiSanPhamRepository;
import com.laptrinhjavaweb.repository.SanPhamRepository;
import com.laptrinhjavaweb.response.KhuyenMaiHienThiResponse;
import com.laptrinhjavaweb.resquest.BienTheRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.entity.BienTheEntity;
import com.laptrinhjavaweb.response.BienTheResponse;

@Component
public class BienTheConverter {

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private SanPhamRepository sanPhamRepository;

	@Autowired
	private KhuyenMaiSanPhamRepository khuyenMaiSanPhamRepository;

	@Autowired
	private KhuyenMaiConvert khuyenMaiConvert;
	
	public BienTheResponse convertToResponse(BienTheEntity entity) {
		BienTheResponse response = modelMapper.map(entity, BienTheResponse.class);
		KhuyenMaiSanPhamEntity khuyenMaiSanPhamEntity = khuyenMaiSanPhamRepository.findBySanPham_idAndTrangThaiOrSanPham_idAndTrangThai(entity.getSanPham().getId(), SystemConstant.ACTICE, entity.getSanPham().getId(), SystemConstant.UPCOMING);
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
		return response;
	}

	public BienTheEntity convertToEntity(BienTheRequest request){
		BienTheEntity entity = modelMapper.map(request, BienTheEntity.class);
		SanPhamEntity sanPhamEntity = sanPhamRepository.findById(request.getIdSanPham()).get();
		entity.setSanPham(sanPhamEntity);
		return entity;
	}
}
