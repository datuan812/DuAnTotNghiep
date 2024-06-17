package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.response.LichSuTichDiemResponse;
import com.laptrinhjavaweb.resquest.LichSuTichDiemRequest;
import com.laptrinhjavaweb.service.ILichSuTichDiemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/lich-su-tich-diem")
public class LichSuTichDiemAPI {

    @Autowired
    private ILichSuTichDiemService lichSuTichDiemService;

    @PostMapping
    public void save(@RequestBody LichSuTichDiemRequest request){
        lichSuTichDiemService.save(request);
    }

    @GetMapping
    public ResponseEntity<?> getDSLSTD(){
        List<LichSuTichDiemResponse> result = lichSuTichDiemService.findAll();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/search")
    public ResponseEntity<?> searchs(@RequestParam(name = "sdtKhachHang") String sdtKhachHang ){
        List<LichSuTichDiemResponse> result = lichSuTichDiemService.findAllByIdKhachHang(sdtKhachHang);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/{ma}")
    public ResponseEntity<?> getDanhSachLSTDOnl(@PathVariable(name = "ma") String ma){
        List<LichSuTichDiemResponse> result = lichSuTichDiemService.findAllByMaKH(ma);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
