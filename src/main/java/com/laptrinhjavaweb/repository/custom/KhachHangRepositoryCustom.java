package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.entity.KhachHangEntity;

import java.util.List;

public interface KhachHangRepositoryCustom {

    List<KhachHangEntity> searchs(String param);
}
