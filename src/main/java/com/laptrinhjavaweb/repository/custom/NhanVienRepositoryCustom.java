package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.entity.NhanVienEntity;

import java.util.List;

public interface NhanVienRepositoryCustom {

	List<NhanVienEntity> searchs(String param, String ma);
}
