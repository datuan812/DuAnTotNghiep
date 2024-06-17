package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.ChiTieuEntity;
import com.laptrinhjavaweb.entity.ViDienTuEntity;
import com.laptrinhjavaweb.response.ChiTieuResponse;
import com.laptrinhjavaweb.response.ViDienTuResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChiTieuConvert {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private ViDienTuConvert viDienTuConvert;

    public ChiTieuResponse convertToResponse(ChiTieuEntity entity) {
        ChiTieuResponse response = modelMapper.map(entity, ChiTieuResponse.class);
        ViDienTuResponse viDienTuResponse = viDienTuConvert.convertToResponse(entity.getViDienTu());
        response.setViDienTu(viDienTuResponse);
        return response;
    }
}
