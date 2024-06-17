package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.resquest.TichDiemRequest;
import com.laptrinhjavaweb.service.impl.TichDiemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/tich-diem")
public class TichDiemAPI {
    @Autowired
    private TichDiemService tichDiemService;

    @PostMapping
    public void save(@RequestBody TichDiemRequest request){
        tichDiemService.update(request);
    }

    @GetMapping("/{ma}")
    public Integer soDiem(@PathVariable(name = "ma") String ma){
        return tichDiemService.soDiemFindByKhachHang(ma);
    }
}
