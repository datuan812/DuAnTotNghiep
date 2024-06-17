package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.exception.EntityNotFoundException;
import com.laptrinhjavaweb.response.ViDienTuResponse;
import com.laptrinhjavaweb.resquest.ViDienTuRequest;
import com.laptrinhjavaweb.service.IViDienTuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/vi-dien-tu")
public class ViDienTuAPI {
    @Autowired
    private IViDienTuService viDienTuService;

    @GetMapping("/{idkh}")
    public ResponseEntity<?> findByKhachHang(@PathVariable("idkh") Long idkh){
        ViDienTuResponse results = viDienTuService.findByIdKhachHang(idkh);
        if(results == null){
            throw new EntityNotFoundException("Không tìm thấy khách hàng!");
        }
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @PostMapping
    public void save(@RequestBody ViDienTuRequest request){
        viDienTuService.saveDoiDiem(request);
    }
}
