package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.entity.BienTheEntity;
import com.laptrinhjavaweb.response.BienTheResponse;
import com.laptrinhjavaweb.resquest.BienTheRequest;

public interface IBienTheService {

	BienTheResponse findByIdGiaTriThuocTinh(List<Long> giaTriThuocTinhIds);

	BienTheResponse save(BienTheRequest request);
}
