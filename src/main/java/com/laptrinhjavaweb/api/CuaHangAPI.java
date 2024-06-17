package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.response.CuaHangResponse;
import com.laptrinhjavaweb.service.ICuaHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.EnumMap;

@RestController
@RequestMapping("/api/cua-hang/thong-tin")
public class CuaHangAPI {

    @Autowired
    private ICuaHangService cuaHangService;

    @GetMapping
    public ResponseEntity<?> findAll(){
        EnumMap<CuaHangResponse, Object> results = cuaHangService.findAllInformation();
        return new ResponseEntity<>(results, HttpStatus.OK);
    }
}
