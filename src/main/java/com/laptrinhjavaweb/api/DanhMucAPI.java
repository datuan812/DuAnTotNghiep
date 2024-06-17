package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.response.DanhMucResponse;
import com.laptrinhjavaweb.resquest.DanhMucRequest;
import com.laptrinhjavaweb.service.IDanhMucService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/danh-muc")
public class DanhMucAPI {

    @Autowired
    private IDanhMucService danhMucService;

    @PostMapping
    public ResponseEntity<?> create(@RequestBody DanhMucRequest request){
        DanhMucResponse result = danhMucService.create(request);
        if(result == null){
            throw new ClientError("Tên danh mục này đã tồn tại. Xin kiểm tra lại!");
        }
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @DeleteMapping("/{slug}")
    public ResponseEntity<?> delete(@PathVariable(name = "slug") String slug){
        danhMucService.delete(slug);
        return new ResponseEntity<>("Xóa thành công", HttpStatus.OK);
    }

    @GetMapping("/search")
    public ResponseEntity<?> searchs(
            @RequestParam(name = "q") String param,
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit){
        Map<String, Object> results = danhMucService.pagingOrSearchOrFindAll(page, limit, param);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<?> pagination(@RequestParam(name = "page", defaultValue = "1") Integer page,
                                        @RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit
    ){
        Map<String, Object> results = danhMucService.pagingOrSearchOrFindAll(page, limit, null);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

}
