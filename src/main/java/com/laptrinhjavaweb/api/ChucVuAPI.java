package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.response.ChucVuResponse;
import com.laptrinhjavaweb.response.NhanVienResponse;
import com.laptrinhjavaweb.resquest.ChucVuRequest;
import com.laptrinhjavaweb.resquest.NhanVienRequest;
import com.laptrinhjavaweb.service.IChucVuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/chuc-vu")
public class ChucVuAPI {

    @Autowired
    private IChucVuService chucVuService;

    @PostMapping
    public ResponseEntity<?> created(@RequestBody ChucVuRequest request){
        ChucVuResponse result = chucVuService.save(request);
        if(result == null){
            throw new ClientError("Tên đã tồn tại");
        }
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<?> getDSChucVu(){
        List<ChucVuResponse> result = chucVuService.getDSChucVu();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
