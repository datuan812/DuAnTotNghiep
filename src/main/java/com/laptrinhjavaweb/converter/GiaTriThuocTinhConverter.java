package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.SanPhamEntity;
import com.laptrinhjavaweb.entity.ThuocTinhEntity;
import com.laptrinhjavaweb.repository.SanPhamRepository;
import com.laptrinhjavaweb.repository.ThuocTinhRepository;
import com.laptrinhjavaweb.resquest.GiaTriThuocTinhRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.entity.GiaTriThuocTinhEntity;
import com.laptrinhjavaweb.response.GiaTriThuocTinhResponse;

@Component
public class GiaTriThuocTinhConverter {

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private SanPhamRepository sanPhamRepository;

	@Autowired
	private ThuocTinhRepository thuocTinhRepository;
	
	public GiaTriThuocTinhResponse convertToResponse(GiaTriThuocTinhEntity entity) {
		GiaTriThuocTinhResponse response = modelMapper.map(entity, GiaTriThuocTinhResponse.class);
		return response;
	}

	public GiaTriThuocTinhEntity convertToEntity(GiaTriThuocTinhRequest request){
		modelMapper.getConfiguration().setAmbiguityIgnored(true);
		GiaTriThuocTinhEntity entity = modelMapper.map(request, GiaTriThuocTinhEntity.class);
		SanPhamEntity sanPhamEntity = sanPhamRepository.findById(request.getIdSanPham()).get();
		ThuocTinhEntity thuocTinhEntity = thuocTinhRepository.findById(request.getIdThuocTinh()).get();
		entity.setSanPham(sanPhamEntity);
		entity.setThuocTinh(thuocTinhEntity);
		return entity;
	}
}
