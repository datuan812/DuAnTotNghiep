package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.entity.HoaDonEntity;
import com.laptrinhjavaweb.entity.KhachHangEntity;

import java.util.List;

public interface HoaDonRepositoryCustom {

    List<HoaDonEntity> findAllByCurrentDateAndMaNhanVien(String ngay, String maNhanVien);

    List<HoaDonEntity> searchs(String param, String trangThai);
}
