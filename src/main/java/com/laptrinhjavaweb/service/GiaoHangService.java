package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.entity.HoaDonEntity;
import com.laptrinhjavaweb.model.request.ThongTinDatHangRequest;
import com.laptrinhjavaweb.model.response.HoaDonChiTietResponse;

import java.util.List;

public interface GiaoHangService {

    ThongTinDatHangRequest getThongTinDatHang(Long idttdathang,Long idkh);

    List<HoaDonChiTietResponse> dsHoaDonChiTiet(Long idkh);

    HoaDonEntity thanhToan(Long idkh, Long idttgh, String pttt,Double phiShip,String moTa,Double tongTien);

    ThongTinDatHangRequest datHangGiaoHangNhanh(Long idhd);
}
