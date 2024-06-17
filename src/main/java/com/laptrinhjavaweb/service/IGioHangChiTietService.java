package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.GioHangChiTietResponse;
import com.laptrinhjavaweb.response.TotalCartResponse;
import com.laptrinhjavaweb.resquest.GioHangChiTietRequest;

import java.util.List;

public interface IGioHangChiTietService {

    void save (GioHangChiTietRequest gioHangChiTietRequest);

    TotalCartResponse findAllByGioHangChiTiet(List<Long> ids, String maKhachHang);

    void checkQuantity(List<Long> ids, String maKhachHang);

    GioHangChiTietResponse updated(GioHangChiTietRequest gioHangChiTietRequest);

    void delete(Long id);
}
