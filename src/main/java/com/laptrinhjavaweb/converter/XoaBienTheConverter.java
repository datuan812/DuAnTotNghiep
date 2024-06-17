package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.XoaBienTheEntity;
import com.laptrinhjavaweb.response.XoaBienTheResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class XoaBienTheConverter {

    @Autowired
    private ModelMapper modelMapper;

    public XoaBienTheResponse convertToResponse(XoaBienTheEntity xoaBienTheEntity) {
        XoaBienTheResponse response = modelMapper.map(xoaBienTheEntity, XoaBienTheResponse.class);

        response.setThanhTien(response.getGiaMua() * response.getSoLuong());
        return response;
    }
}
