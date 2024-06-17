package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.ChucVuEntity;
import com.laptrinhjavaweb.response.ChucVuResponse;
import com.laptrinhjavaweb.resquest.ChucVuRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChucVuConverter {

    @Autowired
    private ModelMapper modelMapper;

    public ChucVuResponse convertToResponse(ChucVuEntity entity){
        ChucVuResponse response = modelMapper.map(entity, ChucVuResponse.class);
        return response;
    }

    public ChucVuEntity convertToEntity(ChucVuRequest request){
        ChucVuEntity entity = modelMapper.map(request, ChucVuEntity.class);
        return entity;
    }
}
