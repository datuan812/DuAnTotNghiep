package com.laptrinhjavaweb.repository.custom;

import java.util.List;
import java.util.Map;

import com.laptrinhjavaweb.entity.SanPhamEntity;

public interface SanPhamRepositoryCustom {
	
	List<SanPhamEntity> seachs(String param, Map<String, Object> filters);

	List<SanPhamEntity> filters(Map<String, Object> params);

	List<SanPhamEntity> categories(String slug, Map<String, Object> fliters);

	List<SanPhamEntity> random(
			Integer sanPhamBanChay, Integer sanPhamMoi, Integer sanPhamNhieuLuotXem, Integer sanPhamNoiBat, Integer sanPhamPhoBien,
			Integer limit);

	List<SanPhamEntity> same(String slug);

	//void removeMultipleTable (Long idSanPham);
}
