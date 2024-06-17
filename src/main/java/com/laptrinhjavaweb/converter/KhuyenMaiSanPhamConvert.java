package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.KhuyenMaiSanPhamEntity;
import com.laptrinhjavaweb.response.KhuyenMaiSanPhamResponse;
import com.laptrinhjavaweb.response.SanPhamResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class KhuyenMaiSanPhamConvert {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private SanPhamConverter sanPhamConverter;

    public KhuyenMaiSanPhamResponse convertToResponse(KhuyenMaiSanPhamEntity entity) {
        KhuyenMaiSanPhamResponse response =modelMapper.map(entity,KhuyenMaiSanPhamResponse.class);
        SanPhamResponse spResponse = sanPhamConverter.convertToResponse(entity.getSanPham());
        response.setSanPhamResponse(spResponse);
        return response;
    }
}
