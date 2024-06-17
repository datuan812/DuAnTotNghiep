package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.response.DanhMucResponse;
import com.laptrinhjavaweb.response.ThuongHieuResponse;
import com.laptrinhjavaweb.resquest.DanhMucRequest;
import com.laptrinhjavaweb.resquest.ThuongHieuRequest;
import com.laptrinhjavaweb.service.IThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/thuong-hieu")
public class ThuongHieuAPI {

    @Autowired
    private IThuongHieuService thuongHieuService;

    @PostMapping
    public ResponseEntity<?> create(@RequestBody ThuongHieuRequest request){
        ThuongHieuResponse result = thuongHieuService.create(request);
        if(result == null){
            throw new ClientError("Tên thương hiệu này đã tồn tại. Xin kiểm tra lại!");
        }
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @DeleteMapping("/{slug}")
    public ResponseEntity<?> delete(@PathVariable(name = "slug") String slug){
        thuongHieuService.delete(slug);
        return new ResponseEntity<>("Xóa thành công", HttpStatus.OK);
    }

    @GetMapping("/search")
    public ResponseEntity<?> searchs(
            @RequestParam(name = "q") String param,
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit){
        Map<String, Object> results = thuongHieuService.pagingOrSearchOrFindAll(page, limit, param);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<?> pagination(@RequestParam(name = "page", defaultValue = "1") Integer page,
                                        @RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit
    ){
        Map<String, Object> results = thuongHieuService.pagingOrSearchOrFindAll(page, limit, null);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }
}
