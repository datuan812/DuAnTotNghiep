package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.response.NhanVienResponse;
import com.laptrinhjavaweb.resquest.NhanVienRequest;
import com.laptrinhjavaweb.service.INhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/nhan-vien")
public class NhanVienAPI {

    @Autowired
    private INhanVienService nhanVienService;

    @PostMapping
    public ResponseEntity<?> created(@RequestBody NhanVienRequest request){
        NhanVienResponse result = nhanVienService.save(request);
        if(result == null){
            throw new ClientError("Số điện thoại hoặc email hoặc căn cước công dân đã tồn tại");
        }
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @GetMapping("/search")
    public ResponseEntity<?> searchs(
            @RequestParam(name = "q") String param,
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "limit", required = false, defaultValue = "3") Integer limit){
        Map<String, Object> results = nhanVienService.pagingOrSearchOrFindAll(page, limit, null, param);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<?> pagination(@RequestParam(name = "page", defaultValue = "1") Integer page,
                                        @RequestParam(name = "limit", required = false, defaultValue = "3") Integer limit,
                                        @RequestParam(name = "role", required = false) String role
    ){
        Map<String, Object> results = nhanVienService.pagingOrSearchOrFindAll(page, limit, role, null);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @GetMapping("/{ma}")
    public ResponseEntity<?> findByMa(@PathVariable String ma) {
        NhanVienResponse result = nhanVienService.getDetail(ma);
        if (result == null) {
            return new ResponseEntity<>("Nhân viên không tồn tại", HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PutMapping("/{ma}")
    public ResponseEntity<?> update(@PathVariable String ma, @RequestBody NhanVienRequest nhanVienRequest) {
        NhanVienResponse result = nhanVienService.update(ma, nhanVienRequest);
        if (result != null) {
            return ResponseEntity.ok(result);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy nhân viên với mã " + ma);
        }
    }

    @DeleteMapping("/{ma}")
    public ResponseEntity<?> delete(@PathVariable(name = "ma") String ma){
        nhanVienService.delete(ma);
        return new ResponseEntity<>("Xóa thành công", HttpStatus.OK);
    }
}
