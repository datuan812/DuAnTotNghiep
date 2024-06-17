package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.LichSuTichDiemConverter;
import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.entity.LichSuTichDiemEntity;
import com.laptrinhjavaweb.repository.KhachHangRepository;
import com.laptrinhjavaweb.repository.LichSuTichDiemRepository;
import com.laptrinhjavaweb.response.LichSuTichDiemResponse;
import com.laptrinhjavaweb.resquest.LichSuTichDiemRequest;
import com.laptrinhjavaweb.service.ILichSuTichDiemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class LichSuTichDiemService implements ILichSuTichDiemService {

    @Autowired
    private LichSuTichDiemConverter lichSuTichDiemConverter;

    @Autowired
    private LichSuTichDiemRepository lichSuTichDiemRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Override
    public void save(LichSuTichDiemRequest request) {
        LichSuTichDiemEntity entity = lichSuTichDiemConverter.convertToEntity(request);
        lichSuTichDiemRepository.save(entity);
    }

    @Override
    public List<LichSuTichDiemResponse> findAll() {
        List<LichSuTichDiemEntity> entity = lichSuTichDiemRepository.findAllByOrderByNgayTaoDesc();

        List<LichSuTichDiemResponse> result = entity.stream().map(
                item ->
                        lichSuTichDiemConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return result;
    }

    @Override
    public List<LichSuTichDiemResponse> findAllByIdKhachHang(String sdtKhachHang) {
        KhachHangEntity kh = khachHangRepository.findBySoDienThoai(sdtKhachHang);
        List<LichSuTichDiemEntity> entity = lichSuTichDiemRepository.findAllByKhachHang_idOrderByNgayTaoDesc(kh.getId());

        List<LichSuTichDiemResponse> result = entity.stream().map(
                item ->
                        lichSuTichDiemConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return result;
    }

    @Override
    public List<LichSuTichDiemResponse> findAllByMaKH(String ma) {
        KhachHangEntity kh = khachHangRepository.findByMa(ma);
        List<LichSuTichDiemEntity> entity = lichSuTichDiemRepository.findAllByKhachHang_idOrderByNgayTaoDesc(kh.getId());
        List<LichSuTichDiemResponse> result = entity.stream().map(
                item ->
                        lichSuTichDiemConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return result;
    }


}
