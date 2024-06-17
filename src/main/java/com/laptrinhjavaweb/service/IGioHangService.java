package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.GioHangResponse;
import com.laptrinhjavaweb.resquest.GioHangRequest;

public interface IGioHangService {

    Long save(GioHangRequest gioHangRequest);

    GioHangResponse findByMaKhachHang (String maKhachHang, String trangThai);
}
