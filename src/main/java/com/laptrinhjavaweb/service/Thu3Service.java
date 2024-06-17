package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.model.response.HoaDonResponse;
import com.laptrinhjavaweb.model.response.TrangThaiGiaoHangResponse;

import java.util.List;

public interface Thu3Service {

    List<TrangThaiGiaoHangResponse> dsTrangThaiDangGiao(Long idhd);

    List<HoaDonResponse> dsHoaDonDangGiao();

    String themTrangThaiGiaoHang(Long idhd,String tenTrangThai);
    void themTrangThaiGiaoHang(Long idhd, String tenTrangThai, String trangThaiHoaDon);

    Boolean checkHuyDonTrongNgay(Long idkh);
}
