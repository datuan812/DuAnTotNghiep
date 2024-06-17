package com.laptrinhjavaweb.controller.thongTinWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/thong-tin-tich-diem")
public class TichDiemController {

    @GetMapping
    public String tichdiem() {
        return "thongtinWeb/thong-tin-tich-diem";
    }
}
