package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.response.HoaDonChiTietResponse;
import com.laptrinhjavaweb.resquest.HoaDonChiTietRequest;
import com.laptrinhjavaweb.service.IHoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/hoa-don-chi-tiet")
public class HoaDonChiTietAPI {

    @Autowired
    private IHoaDonChiTietService hoaDonChiTietService;

    @PostMapping
    public void created(@RequestBody HoaDonChiTietRequest hoaDonChiTietRequest){
        hoaDonChiTietService.save(hoaDonChiTietRequest);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") Long id){
        HoaDonChiTietResponse results = hoaDonChiTietService.findById(id);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public void update(@PathVariable("id") Long id, @RequestBody Integer soLuong){
        hoaDonChiTietService.update(id, soLuong);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Long id){
        hoaDonChiTietService.delete(id);
    }
}
