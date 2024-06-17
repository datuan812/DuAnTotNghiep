package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.entity.CaLamEntity;

public interface CaLamRepositoryCustom {

    CaLamEntity findByCurrentDateAndMaNhanVien(String ngay, String maNhanVien);
}
