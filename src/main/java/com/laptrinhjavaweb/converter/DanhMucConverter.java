package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.DanhMucEntity;
import com.laptrinhjavaweb.response.DanhMucResponse;
import com.laptrinhjavaweb.resquest.DanhMucRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DanhMucConverter {

	@Autowired
	private ModelMapper modelMapper;
	
	public DanhMucResponse convertToResponse(DanhMucEntity entity) {
		DanhMucResponse response = modelMapper.map(entity, DanhMucResponse.class);
		return response;
	}

	public DanhMucEntity convertToEntity(DanhMucRequest request){
		DanhMucEntity entity = modelMapper.map(request, DanhMucEntity.class);
		return entity;
	}
}
