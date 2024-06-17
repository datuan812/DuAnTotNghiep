package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.entity.TichDiemEntity;
import com.laptrinhjavaweb.repository.KhachHangRepository;
import com.laptrinhjavaweb.response.TichDiemResponse;
import com.laptrinhjavaweb.resquest.TichDiemRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TichDiemConverter {

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private ModelMapper modelMapper;

    public TichDiemResponse convertToResponse(TichDiemEntity entity) {
        TichDiemResponse response = modelMapper.map(entity, TichDiemResponse.class);
        return response;
    }

    public TichDiemEntity convertToEntity(TichDiemRequest request){
        TichDiemEntity entity = modelMapper.map(request, TichDiemEntity.class);
        KhachHangEntity khachHangEntity = khachHangRepository.findByMa(request.getMaKhachHang());
        entity.setKhachHang(khachHangEntity);
        entity.setSoDiem(request.getSoDiemTichDuoc());
        return entity;
    }
}
