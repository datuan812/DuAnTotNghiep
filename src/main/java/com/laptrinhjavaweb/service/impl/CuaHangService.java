package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.response.CuaHangResponse;
import com.laptrinhjavaweb.service.ICuaHangService;
import org.springframework.stereotype.Service;

import java.util.EnumMap;

@Service
public class CuaHangService implements ICuaHangService {

    @Override
    public EnumMap<CuaHangResponse, Object> findAllInformation() {
        EnumMap<CuaHangResponse, Object> results = new EnumMap<CuaHangResponse, Object>(CuaHangResponse.class);
        for (CuaHangResponse cuaHangResponse : CuaHangResponse.values()) {
            results.put(cuaHangResponse, cuaHangResponse.getValue());
        }
        return results;
    }
}
