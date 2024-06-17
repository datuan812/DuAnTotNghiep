package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.response.KhuyenMaiResponse;
import com.laptrinhjavaweb.resquest.KhuyenMaiRequest;
import com.laptrinhjavaweb.service.IKhuyenMaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/khuyen-mai")
public class KhuyenMaiAPI {
    @Autowired
    private IKhuyenMaiService khuyenMaiService;
    @GetMapping
    public ResponseEntity<?> findAll(){
        List<KhuyenMaiResponse> results = khuyenMaiService.getAll();
        return new ResponseEntity<>(results, HttpStatus.OK);
    }
    @GetMapping("/detail/{ma}")
    public ResponseEntity<?> findByMa(@PathVariable String ma){
        KhuyenMaiResponse results = khuyenMaiService.findByMa(ma);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }
    @DeleteMapping("/delete/{ma}")
    public ResponseEntity<?> delete(@PathVariable(name = "ma") String ma){
        String results = khuyenMaiService.delete(ma);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }
    @DeleteMapping("/undelete/{ma}")
    public ResponseEntity<?> undelete(@PathVariable(name = "ma") String ma){
        String results = khuyenMaiService.undelete(ma);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }
    @PostMapping("/create")
    public ResponseEntity<?> create(@RequestBody KhuyenMaiRequest km){
        KhuyenMaiResponse results = khuyenMaiService.save(km);
        return new ResponseEntity<>(results, HttpStatus.CREATED);
    }
    @PutMapping("/update/{ma}")
    public ResponseEntity<?> update(@RequestBody KhuyenMaiRequest km, @PathVariable("ma") String ma){
        KhuyenMaiResponse results = khuyenMaiService.update(km, ma);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }
    @GetMapping("/search")
    public ResponseEntity<?> search(
            @RequestParam(name = "q") String param,
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit){
        Map<String, Object> results = khuyenMaiService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit, param, null, null);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }
    @GetMapping("/pagination")
    public ResponseEntity<?> pagination(
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit
    ){
        Map<String, Object> results = khuyenMaiService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit,null, null, null);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @PostMapping("/update-status/{id}")
    public void updatedTrangThai(@PathVariable("id") Long id, @RequestBody String trangThai){
        khuyenMaiService.updateTrangThai(id, trangThai);
    }

    @PostMapping("/update-expired/{ma}")
    public void updatedEXPIRED(@PathVariable("ma") String ma){
        khuyenMaiService.updateEXPIRED(ma);
    }


    @GetMapping("/search-product")
    public ResponseEntity<?> searchByProduct(
            @RequestParam(name = "q") String param,
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit){
        Map<String, Object> results = khuyenMaiService.searchByProduct(page, limit, param);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }
}
