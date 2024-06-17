package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.ThuongHieuEntity;
import com.laptrinhjavaweb.response.ThuongHieuResponse;
import com.laptrinhjavaweb.resquest.ThuongHieuRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ThuongHieuConverter {

	@Autowired
	private ModelMapper modelMapper;
	
	public ThuongHieuResponse convertToResponse(ThuongHieuEntity entity) {
		ThuongHieuResponse response = modelMapper.map(entity, ThuongHieuResponse.class);
		return response;
	}

	public ThuongHieuEntity convertToEntity(ThuongHieuRequest request){
		ThuongHieuEntity entity = modelMapper.map(request, ThuongHieuEntity.class);
		return entity;
	}
}
