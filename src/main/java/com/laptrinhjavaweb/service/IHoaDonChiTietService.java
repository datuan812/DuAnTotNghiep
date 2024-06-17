package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.HoaDonChiTietResponse;
import com.laptrinhjavaweb.resquest.HoaDonChiTietRequest;

public interface IHoaDonChiTietService {

    void save(HoaDonChiTietRequest hoaDonChiTietRequest);

    void update(Long id, Integer soLuong);

    HoaDonChiTietResponse findById(Long id);

    void delete(Long id);
}
