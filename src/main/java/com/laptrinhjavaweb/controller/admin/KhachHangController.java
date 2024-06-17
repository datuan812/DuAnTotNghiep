package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/khach-hang")
public class KhachHangController {

    @GetMapping
    public String khachhang() {
        return "admin/khachhang/khach-hang";
    }

    @GetMapping("/create")
    public String createKH() {
        return "admin/khachhang/khach-hang-create";
    }

    @GetMapping("/edit/{ma}")
    public String updateKH() {
        return "admin/khachhang/khach-hang-edit";
    }
}
