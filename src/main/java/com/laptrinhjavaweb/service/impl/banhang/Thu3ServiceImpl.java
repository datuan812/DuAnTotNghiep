package com.laptrinhjavaweb.service.impl.banhang;

import com.laptrinhjavaweb.entity.TrangThaiGiaoHangEntity;
import com.laptrinhjavaweb.model.response.HoaDonResponse;
import com.laptrinhjavaweb.model.response.TrangThaiGiaoHangResponse;
import com.laptrinhjavaweb.repository.HoaDonRepository;
import com.laptrinhjavaweb.repository.TrangThaiGiaoHangRepository;
import com.laptrinhjavaweb.service.Thu3Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Thu3ServiceImpl implements Thu3Service {
    @Autowired
    private TrangThaiGiaoHangRepository trangThaiGiaoHangRepository;

    @Autowired
    private HoaDonRepository hoaDonRepository;
    @Override
    public List<TrangThaiGiaoHangResponse> dsTrangThaiDangGiao(Long maGiaoHang) {
        return trangThaiGiaoHangRepository.getTrangThaiDonHangByMaGiaoHang(maGiaoHang);
    }

    @Override
    public List<HoaDonResponse> dsHoaDonDangGiao() {
        return hoaDonRepository.dsHoaDonDangGiao();
    }

    @Override
    public String themTrangThaiGiaoHang(Long idhd, String tenTrangThai) {
        TrangThaiGiaoHangEntity trangThaiGiaoHangEntity = new TrangThaiGiaoHangEntity();
        trangThaiGiaoHangEntity.setTenTrangThai(tenTrangThai);
        trangThaiGiaoHangEntity.setHoaDon(hoaDonRepository.findById(idhd).orElse(null));
        trangThaiGiaoHangRepository.save(trangThaiGiaoHangEntity);
        return "Thành công";
    }

    @Override
    public void themTrangThaiGiaoHang(Long idhd, String tenTrangThai, String trangThaiHoaDon) {
        TrangThaiGiaoHangEntity trangThaiGiaoHangEntity = new TrangThaiGiaoHangEntity();
        trangThaiGiaoHangEntity.setTenTrangThai(tenTrangThai);
        trangThaiGiaoHangEntity.setTrangThaiHoaDon(trangThaiHoaDon);
        trangThaiGiaoHangEntity.setHoaDon(hoaDonRepository.findById(idhd).orElse(null));
        trangThaiGiaoHangRepository.save(trangThaiGiaoHangEntity);
    }

    @Override
    public Boolean checkHuyDonTrongNgay(Long idkh) {
        Long check = trangThaiGiaoHangRepository.checkSoLanHuyDonTrongNgay(idkh);
        System.out.println("check:"+check);
        return check>=3;
    }

}
