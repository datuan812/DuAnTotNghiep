package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/nhan-vien")
public class NhanVienController {

    @GetMapping
    public String nhanvien() {
        return "admin/nhanvien/nhan-vien";
    }

    @GetMapping("/create")
    public String createNV() {
        return "admin/nhanvien/nhan-vien-create";
    }

    @GetMapping("/edit/{ma}")
    public String updateNV() {
        return "admin/nhanvien/nhan-vien-edit";
    }

    @GetMapping("/detail/{ma}")
    public String detailNV() {
        return "admin/nhanvien/nhan-vien-detail";
    }
}
