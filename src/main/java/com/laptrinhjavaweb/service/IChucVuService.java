package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.ChucVuResponse;
import com.laptrinhjavaweb.resquest.ChucVuRequest;

import java.util.List;

public interface IChucVuService {

    ChucVuResponse findByMa(String ma);

    ChucVuResponse save(ChucVuRequest chucVuRequest);

    List<ChucVuResponse> getDSChucVu();
}
