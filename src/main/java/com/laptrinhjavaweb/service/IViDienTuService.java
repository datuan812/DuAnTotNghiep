package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.ViDienTuResponse;
import com.laptrinhjavaweb.resquest.ViDienTuRequest;

public interface IViDienTuService {

    ViDienTuResponse findByIdKhachHang(Long idkh);

    void congTien(Double soTien, Long idvidientu);

    void saveDoiDiem(ViDienTuRequest request);
}
