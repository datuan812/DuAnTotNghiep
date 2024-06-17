package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.CuaHangResponse;

import java.util.EnumMap;

public interface ICuaHangService {

    EnumMap<CuaHangResponse, Object> findAllInformation();
}
