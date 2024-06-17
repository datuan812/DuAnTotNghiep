package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.TimKiemSanPhamEntity;
import com.laptrinhjavaweb.response.TimKiemSanPhamResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TimKiemSanPhamConverter {

    @Autowired
    private ModelMapper modelMapper;

    public TimKiemSanPhamResponse convertToResponse (TimKiemSanPhamEntity entity){
        TimKiemSanPhamResponse response = modelMapper.map(entity, TimKiemSanPhamResponse.class);
        response.setIdKhachHang(entity.getKhachHang().getId());
        return response;
    }
}
