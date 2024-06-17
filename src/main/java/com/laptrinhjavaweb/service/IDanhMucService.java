package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.DanhMucResponse;
import com.laptrinhjavaweb.resquest.DanhMucRequest;

import java.util.List;
import java.util.Map;

public interface IDanhMucService {

    List<DanhMucResponse> findAllByTrangThai();

    Map<String, Object> pagingOrSearchOrFindAll(Integer pageCurrent, Integer limit, String param );

    DanhMucResponse create(DanhMucRequest danhMucRequest);

    void delete(String slug);

}
