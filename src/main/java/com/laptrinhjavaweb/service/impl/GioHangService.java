package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.GioHangConverter;
import com.laptrinhjavaweb.entity.GioHangChiTietEntity;
import com.laptrinhjavaweb.entity.GioHangEntity;
import com.laptrinhjavaweb.repository.GioHangChiTietRepository;
import com.laptrinhjavaweb.repository.GioHangRepository;
import com.laptrinhjavaweb.response.GioHangResponse;
import com.laptrinhjavaweb.resquest.GioHangRequest;
import com.laptrinhjavaweb.service.IGioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GioHangService implements IGioHangService {

    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private GioHangConverter gioHangConverter;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Override
    public Long save(GioHangRequest gioHangRequest) {
        GioHangEntity gioHangEntity = gioHangRepository.findByKhachHang_ma(gioHangRequest.getMaKhachHang());
        if(gioHangEntity == null){
            gioHangEntity = gioHangConverter.convertToEntity(gioHangRequest);
            gioHangRepository.save(gioHangEntity);
        }
        return gioHangEntity.getId();
    }

    @Override
    public GioHangResponse findByMaKhachHang(String maKhachHang, String trangThai) {
        GioHangEntity gioHangEntity = gioHangRepository.findByKhachHang_ma(maKhachHang);
        if(gioHangEntity == null){
            return null;
        }
        List<GioHangChiTietEntity> list = gioHangChiTietRepository.findAllByGioHang_Id(gioHangEntity.getId(), trangThai);
        gioHangEntity.setGioHangChiTietEntities(list);
        return gioHangConverter.convertToResponse(gioHangEntity);
    }
}
