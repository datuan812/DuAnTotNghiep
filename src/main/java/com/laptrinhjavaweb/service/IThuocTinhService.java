package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.response.FilterResponse;
import com.laptrinhjavaweb.response.ThuocTinhResponse;
import com.laptrinhjavaweb.resquest.ThuocTinhRequest;

public interface IThuocTinhService {

	List<FilterResponse> filter();

	ThuocTinhResponse save(ThuocTinhRequest request);
}
