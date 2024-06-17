package com.laptrinhjavaweb.controller.thongTinWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vi-dien-tu")
public class ViDienTuController {

    @GetMapping
    public String vidientu() {
        return "thongtinWeb/vi-dien-tu";
    }

    @GetMapping("/nap-tien")
    public String naptien() {
        return "thongtinWeb/nap-tien";
    }

    @GetMapping("/doi-diem")
    public String doiDiem() {
        return "thongtinWeb/doi-diem";
    }
}
