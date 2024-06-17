package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.ChiTieuResponse;

import java.util.List;

public interface IChiTieuService {
    List<ChiTieuResponse> findByIdVi(Long idVi);

}
