package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.ViDienTuEntity;
import com.laptrinhjavaweb.response.KhacHangResponse;
import com.laptrinhjavaweb.response.ViDienTuResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ViDienTuConvert {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private KhachHangConverter khachHangConverter;

    public ViDienTuResponse convertToResponse(ViDienTuEntity entity) {
        ViDienTuResponse response = modelMapper.map(entity, ViDienTuResponse.class);
        KhacHangResponse khacHangResponse = khachHangConverter.convertToResponse(entity.getKhachHang());
        response.setKhachHang(khacHangResponse);
        return response;
    }
}
