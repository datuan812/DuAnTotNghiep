package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.entity.KhuyenMaiSanPhamEntity;

import java.util.List;

public interface KhuyenMaiSanPhamRepositoryCustom {
    List<KhuyenMaiSanPhamEntity> seachs(String param);

    List<KhuyenMaiSanPhamEntity> allActivate();
}
