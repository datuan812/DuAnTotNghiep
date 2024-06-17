package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.LichSuTichDiemResponse;
import com.laptrinhjavaweb.resquest.LichSuTichDiemRequest;

import java.util.List;

public interface ILichSuTichDiemService {

    void save(LichSuTichDiemRequest request);

   List<LichSuTichDiemResponse> findAll();

   List<LichSuTichDiemResponse> findAllByIdKhachHang(String sdtKhachHang);

   List<LichSuTichDiemResponse> findAllByMaKH(String ma);
}
