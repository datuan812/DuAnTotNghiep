package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.response.GioHangChiTietResponse;
import com.laptrinhjavaweb.response.TotalCartResponse;
import com.laptrinhjavaweb.resquest.GioHangChiTietRequest;
import com.laptrinhjavaweb.service.IGioHangChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/gio-hang-chi-tiet")

public class GioHangChiTietAPI {

    @Autowired
    private IGioHangChiTietService gioHangChiTietService;

    @PostMapping
    public void save(@RequestBody GioHangChiTietRequest gioHangChiTietRequest){
        gioHangChiTietService.save(gioHangChiTietRequest);
    }

    @PostMapping("/checked/{ma}")
    public ResponseEntity<?> totalCart(@PathVariable("ma") String ma, @RequestBody List<Long> ids){
        TotalCartResponse result = gioHangChiTietService.findAllByGioHangChiTiet(ids, ma);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<?> updated(@RequestBody GioHangChiTietRequest gioHangChiTietRequest){
        GioHangChiTietResponse result = gioHangChiTietService.updated(gioHangChiTietRequest);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @DeleteMapping
    public void delete(@RequestBody Long id){
        gioHangChiTietService.delete(id);
    }

    @PostMapping("/checked-quantity/{ma}")
    public void checkQuantity(@PathVariable("ma") String ma, @RequestBody List<Long> ids){
        gioHangChiTietService.checkQuantity(ids, ma);
    }
}
