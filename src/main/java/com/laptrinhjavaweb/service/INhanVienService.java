package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.entity.NhanVienEntity;
import com.laptrinhjavaweb.response.NhanVienResponse;
import com.laptrinhjavaweb.response.SendMailResponse;
import com.laptrinhjavaweb.resquest.NhanVienRequest;

import java.util.Map;

public interface INhanVienService {

    NhanVienResponse findByMaAndTrangThai(String ma, String trangThai);

    Map<String, Object> pagingOrSearchOrFindAll(Integer pageCurrent, Integer limit, String role, String param );

    NhanVienResponse save(NhanVienRequest nhanVienRequest);

    NhanVienResponse update(String ma, NhanVienRequest nhanVienRequest);

    NhanVienResponse getDetail(String ma);

    void delete(String ma);

    NhanVienResponse moCa(String ma);

    NhanVienResponse dongCa(String ma);
}
