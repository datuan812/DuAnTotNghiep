package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.model.response.HoaDonChiTietResponse;

import java.util.List;

public interface HoaDonChiTietService {

    List<HoaDonChiTietResponse> getHoaDonChiTiet(Long idhd);
}
