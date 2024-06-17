package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.entity.ThongTinMuaHangEntity;
import com.laptrinhjavaweb.model.request.DiaChiGiaoHangRequest;
import com.laptrinhjavaweb.model.response.ThongTinMuaHangResponse;

import java.util.List;

public interface ThongTinMuaHangService {
    ThongTinMuaHangEntity findById(Long idttmh);
    ThongTinMuaHangResponse findThongTinMuaHangDefault(Long idkh);

    List<ThongTinMuaHangResponse> dsThongTinMuaHang(Long idkh);

    String themDiaChiGiaoHang(Long idkh,DiaChiGiaoHangRequest diaChiGiaoHangRequest);
    String suaDiaChiGiaoHang(Long idttgh,DiaChiGiaoHangRequest diaChiGiaoHangRequest);

    ThongTinMuaHangResponse findThongTinMuaHangById(Long idThongTinMuaHang);
}
