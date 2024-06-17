package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.DanhMucResponse;
import com.laptrinhjavaweb.response.ThuongHieuResponse;
import com.laptrinhjavaweb.resquest.DanhMucRequest;
import com.laptrinhjavaweb.resquest.ThuongHieuRequest;

import java.util.List;
import java.util.Map;

public interface IThuongHieuService {

    List<ThuongHieuResponse> findAllByTrangThai();

    Map<String, Object> pagingOrSearchOrFindAll(Integer pageCurrent, Integer limit, String param );

    ThuongHieuResponse create(ThuongHieuRequest thuongHieuRequest);

    void delete(String slug);
}
