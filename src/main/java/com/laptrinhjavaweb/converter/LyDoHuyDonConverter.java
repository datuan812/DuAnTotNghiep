package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.LyDoHuyDonEntity;
import com.laptrinhjavaweb.response.LyDoHuyDonReponse;
import com.laptrinhjavaweb.resquest.LyDoHuyDonResquest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LyDoHuyDonConverter {

    @Autowired
    private ModelMapper modelMapper;

    public LyDoHuyDonReponse convertToResponse(LyDoHuyDonEntity entity){
        LyDoHuyDonReponse response = modelMapper.map(entity, LyDoHuyDonReponse.class);
        return response;
    }

    public LyDoHuyDonEntity convertToEntity(LyDoHuyDonResquest request){
        LyDoHuyDonEntity entity = modelMapper.map(request, LyDoHuyDonEntity.class);
        return entity;
    }

}
