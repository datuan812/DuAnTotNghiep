package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.SliderEntity;
import com.laptrinhjavaweb.response.SliderResponse;
import com.laptrinhjavaweb.resquest.SliderRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SliderConverter {

    @Autowired
    private ModelMapper modelMapper;

    public SliderResponse convertToResponse(SliderEntity entity){
        SliderResponse response = modelMapper.map(entity, SliderResponse.class);
        return response;
    }

    public SliderEntity convertToEntity(SliderRequest request){
        SliderEntity entity = modelMapper.map(request, SliderEntity.class);
        return entity;
    }
}
