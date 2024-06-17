package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.entity.KhuyenMaiEntity;
import com.laptrinhjavaweb.response.KhuyenMaiResponse;
import com.laptrinhjavaweb.resquest.KhuyenMaiRequest;

import java.util.List;
import java.util.Map;

public interface IKhuyenMaiService {
    List<KhuyenMaiResponse> getAll();
    KhuyenMaiResponse save(KhuyenMaiRequest request);
    String delete(String ma);
    KhuyenMaiResponse update(KhuyenMaiRequest request, String ma);
    KhuyenMaiResponse findById(Long id);
    KhuyenMaiResponse findByMa(String ma);
    void updateDS();
    KhuyenMaiEntity updateStatus(KhuyenMaiEntity khuyenMaiEntity);
    void updateStatusByMa(String ma);
    Map<String, Object> pagingOrSearchOrFindAllOrFilterOrCategories(Integer pageCurrent, Integer limit, String param, Map<String, Object> params, String slug);

    Map<String, Object> searchByProduct(Integer pageCurrent, Integer limit, String param);

    String undelete(String ma);

    void updateTrangThai(Long id, String trangThai);

    void updateEXPIRED(String ma);
}
