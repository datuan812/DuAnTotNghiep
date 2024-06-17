package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.entity.ThuongHieuEntity;

import java.util.List;

public interface ThuongHieuRepositoryCustom {

    List<ThuongHieuEntity> searchs(String param);
}
