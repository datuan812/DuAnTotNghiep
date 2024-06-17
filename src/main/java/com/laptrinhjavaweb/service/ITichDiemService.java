package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.TichDiemResponse;
import com.laptrinhjavaweb.resquest.TichDiemRequest;

public interface ITichDiemService {

    void update(TichDiemRequest request);

    Integer soDiemFindByKhachHang(String ma);
}
