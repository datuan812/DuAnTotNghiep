package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.KhacHangResponse;
import com.laptrinhjavaweb.response.TimKiemSanPhamResponse;
import com.laptrinhjavaweb.resquest.KhachHangRequest;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface IKhachHangService {

    void sendPassRandom(String recipient, String password);

    KhacHangResponse findBySoDienThoaiOrEmailAndTrangThai(String sodienThoai, String email, String trangThai);

    Map<String, Object> pagingOrSearchOrFindAll(Integer pageCurrent, Integer limit, String param );

    KhacHangResponse update(String ma, KhachHangRequest khachHangRequest);

    KhacHangResponse insert(KhachHangRequest khachHangRequest);

    void delete(String ma);

    KhacHangResponse getDetail(String ma);

    List<KhacHangResponse> findAllAndTrangThai(String ma, String ten, String email, String soDienThoai,  String gioiTinh, String moTa, String trangThai);

    void importFromExcel(MultipartFile file);

    List<TimKiemSanPhamResponse> histosies(String ma);

    KhacHangResponse register(KhachHangRequest khachHangRequest);

    KhacHangResponse changePassword(KhachHangRequest khachHangRequest);
}
