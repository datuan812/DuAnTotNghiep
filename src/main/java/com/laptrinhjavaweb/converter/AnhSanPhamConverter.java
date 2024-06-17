package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.SanPhamEntity;
import com.laptrinhjavaweb.repository.SanPhamRepository;
import com.laptrinhjavaweb.resquest.AnhSanPhamRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.entity.AnhSanPhamEntity;
import com.laptrinhjavaweb.response.AnhSanPhamResponse;

@Component
public class AnhSanPhamConverter {

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private SanPhamRepository sanPhamRepository;

	public AnhSanPhamResponse convertToResponse(AnhSanPhamEntity entity) {
		AnhSanPhamResponse response = modelMapper.map(entity, AnhSanPhamResponse.class);
		return response;
	}

	public AnhSanPhamEntity convertToEntity(AnhSanPhamRequest request){
		AnhSanPhamEntity entity = modelMapper.map(request, AnhSanPhamEntity.class);
		SanPhamEntity sanPhamEntity = sanPhamRepository.findById(request.getIdSanPham()).get();
		entity.setSanPham(sanPhamEntity);
		return entity;
	}
}
