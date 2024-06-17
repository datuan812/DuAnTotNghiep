package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.response.GioHangResponse;
import com.laptrinhjavaweb.resquest.GioHangRequest;
import com.laptrinhjavaweb.service.IGioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/gio-hang")
public class GioHangAPI {

    @Autowired
    private IGioHangService gioHangService;

    @PostMapping
    public ResponseEntity<?> created(@RequestBody GioHangRequest gioHangRequest) {
        Long result = gioHangService.save(gioHangRequest);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/{ma}/{trangThai}")
    public ResponseEntity<?> findAll(@PathVariable String ma, @PathVariable String trangThai) {
        GioHangResponse result = gioHangService.findByMaKhachHang(ma, trangThai);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
