package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.entity.GioHangEntity;
import com.laptrinhjavaweb.repository.KhachHangRepository;
import com.laptrinhjavaweb.response.GioHangChiTietResponse;
import com.laptrinhjavaweb.response.GioHangResponse;
import com.laptrinhjavaweb.resquest.GioHangRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class GioHangConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private GioHangChiTietConveter gioHangChiTietConveter;

    public GioHangEntity convertToEntity(GioHangRequest request) {
        GioHangEntity entity = modelMapper.map(request, GioHangEntity.class);
        entity.setKhachHang(khachHangRepository.findByMa(request.getMaKhachHang()));
        return entity;
    }

    public GioHangResponse convertToResponse(GioHangEntity entity) {
        GioHangResponse response = modelMapper.map(entity, GioHangResponse.class);
        List<GioHangChiTietResponse> listGioHangChiTiet = entity.getGioHangChiTietEntities().stream()
                .map( item -> gioHangChiTietConveter.convertToResponse(item))
                .collect(Collectors.toList());
        response.setGioHang(listGioHangChiTiet);
        return response;
    }
}
