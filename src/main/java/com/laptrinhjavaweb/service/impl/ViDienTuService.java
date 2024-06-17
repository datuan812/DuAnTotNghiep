package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.ViDienTuConvert;
import com.laptrinhjavaweb.entity.ChiTieuEntity;
import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.entity.ViDienTuEntity;
import com.laptrinhjavaweb.repository.ChiTieuRepository;
import com.laptrinhjavaweb.repository.KhachHangRepository;
import com.laptrinhjavaweb.repository.ViDienTuRepository;
import com.laptrinhjavaweb.response.ViDienTuResponse;
import com.laptrinhjavaweb.resquest.ViDienTuRequest;
import com.laptrinhjavaweb.service.IViDienTuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class ViDienTuService implements IViDienTuService {

    @Autowired
    private ViDienTuRepository viDienTuRepository;

    @Autowired
    ChiTieuRepository chiTieuRepository;
    @Autowired
    private ViDienTuConvert viDienTuConvert;
    @Autowired
    private KhachHangRepository khachHangRepository;

    @Override
    public ViDienTuResponse findByIdKhachHang(Long idkh) {
        ViDienTuEntity entity = viDienTuRepository.findByKhachHang(idkh);
        if(entity == null){
            ViDienTuEntity viDienTu = new ViDienTuEntity();
            KhachHangEntity khachHangEntity = khachHangRepository.findById(idkh).orElse(null);
            viDienTu.setKhachHang(khachHangEntity);
            viDienTu.setSoTien(0.0);
            viDienTu.setTrangThai("ACTIVE");
            entity = viDienTuRepository.save(viDienTu);
        }
            ViDienTuResponse response = viDienTuConvert.convertToResponse(entity);
            return response;
    }

    @Override
    @Transactional
    public void congTien(Double soTien, Long idvidientu) {
        ViDienTuEntity entity = viDienTuRepository.findById(idvidientu).orElse(null);
        Double soDUMoi = entity.getSoTien() + soTien;
        entity.setSoTien(soDUMoi);
        viDienTuRepository.save(entity);
        ChiTieuEntity chiTieuEntity = new ChiTieuEntity();
        chiTieuEntity.setLoaiChiTieu(1);
        chiTieuEntity.setViDienTu(entity);
        chiTieuEntity.setSoTien(soTien);
        chiTieuRepository.save(chiTieuEntity);
    }

    @Override
    @Transactional
    public void saveDoiDiem(ViDienTuRequest request) {
        ViDienTuEntity entity = viDienTuRepository.findByKhachHang_ma(request.getMaKhachHang());
        Double soDUMoi = entity.getSoTien() + request.getSoTien();
        entity.setSoTien(soDUMoi);
        viDienTuRepository.save(entity);
        ChiTieuEntity chiTieuEntity = new ChiTieuEntity();
        chiTieuEntity.setLoaiChiTieu(3);
        chiTieuEntity.setViDienTu(entity);
        chiTieuEntity.setSoTien(request.getSoTien());
        chiTieuRepository.save(chiTieuEntity);
    }

}
