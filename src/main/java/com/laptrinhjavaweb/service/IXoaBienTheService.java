package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.XoaBienTheResponse;

import java.util.List;

public interface IXoaBienTheService {

    List<XoaBienTheResponse> findAllByMaKhachHang (String maKhachHang);

    List<XoaBienTheResponse> findAllByMaHoaDon (String maHoaDon);

    void deleteBienThe(Long id);
}
