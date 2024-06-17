package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.AnhSanPhamResponse;
import com.laptrinhjavaweb.resquest.AnhSanPhamRequest;

public interface IAnhSanPhamService {

    AnhSanPhamResponse save(AnhSanPhamRequest request);
}
