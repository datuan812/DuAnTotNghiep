package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.entity.SanPhamEntity;
import com.laptrinhjavaweb.response.SanPhamResponse;
import com.laptrinhjavaweb.resquest.SanPhamRequest;

import java.util.List;
import java.util.Map;

public interface ISanPhamService {

	Map<String, Object> pagingOrSearchOrFindAllOrFilterOrCategories(Integer pageCurrent, Integer limit, String param, Map<String, Object> fliters, String slug);

	Map<String, Object> discountProduct(Integer pageCurrent, Integer limit);

	SanPhamResponse findBySlug(String slug);

	SanPhamEntity findEntityBySlug(String slug);

	SanPhamResponse save(SanPhamRequest sanPhamRequest);

	List<SanPhamResponse> random(
			Integer sanPhamBanChay, Integer sanPhamMoi, Integer sanPhamNhieuLuotXem, Integer sanPhamNoiBat, Integer sanPhamPhoBien,
			Integer limit);

	List<SanPhamResponse> same(String slug);

	void delete(String slug);

	void updateTrangThai(String slug, String trangThai);

	Map<String, Object> findÁll(Integer pageCurrent, Integer limit);

	List<SanPhamResponse> findAll();

	SanPhamResponse update (SanPhamRequest sanPhamRequest);

	void updateProductStatus(Long id);
}
