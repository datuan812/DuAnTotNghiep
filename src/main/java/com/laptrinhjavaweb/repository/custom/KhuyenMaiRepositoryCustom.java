package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.entity.KhuyenMaiEntity;

import java.util.List;
import java.util.Map;

public interface KhuyenMaiRepositoryCustom {
    List<KhuyenMaiEntity> seachs(String param);

    List<Long> filters(Map<String, Object> params);
}
