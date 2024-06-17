package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.entity.DanhMucEntity;

import java.util.List;

public interface DanhMucRepositoryCustom {

    List<DanhMucEntity> searchs(String param);
}
