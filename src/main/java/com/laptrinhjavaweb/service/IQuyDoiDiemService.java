package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.QuyDoiDiemResponse;
import com.laptrinhjavaweb.resquest.QuyDoiDiemRequest;

import java.util.List;

public interface IQuyDoiDiemService {

    List<QuyDoiDiemResponse> getAll();

    List<QuyDoiDiemResponse> saveOrUpdate(List<QuyDoiDiemRequest> requests);
}
