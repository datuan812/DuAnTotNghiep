package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/san-pham")
public class SanPhamController {

    @GetMapping
    public String sanpham() {
        return "admin/sanpham/san-pham";
    }

    @GetMapping("/create")
    public String createSP() {
        return "admin/sanpham/san-pham-create";
    }

    @GetMapping("/edit/{slug}")
    public String updateSP() {
        return "admin/sanpham/san-pham-edit";
    }

}
