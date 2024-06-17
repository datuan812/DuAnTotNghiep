package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.exception.EntityNotFoundException;
import com.laptrinhjavaweb.response.ChiTieuResponse;
import com.laptrinhjavaweb.service.IChiTieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/chi-tieu")
public class ChiTieuAPI {
    @Autowired
    private IChiTieuService chiTieuService;

    @GetMapping("/{idVi}")
    public ResponseEntity<?> findByKhachHang(@PathVariable("idVi") Long idVi){
        List<ChiTieuResponse> results = chiTieuService.findByIdVi(idVi);
        if(results == null){
            throw new EntityNotFoundException("Không tồn tại slug này!");
        }
        return new ResponseEntity<>(results, HttpStatus.OK);
    }
}
