package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.QuyDoiDiemEntity;
import com.laptrinhjavaweb.response.QuyDoiDiemResponse;
import com.laptrinhjavaweb.resquest.QuyDoiDiemRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class QuyDoiDiemConverter {

    @Autowired
    private ModelMapper modelMapper;

    public QuyDoiDiemResponse convertToResponse(QuyDoiDiemEntity entity){
        QuyDoiDiemResponse response = modelMapper.map(entity, QuyDoiDiemResponse.class);
        return response;
    }

    public QuyDoiDiemEntity convertToEntity(QuyDoiDiemRequest request){
        QuyDoiDiemEntity entity = modelMapper.map(request, QuyDoiDiemEntity.class);
        return entity;
    }
}
