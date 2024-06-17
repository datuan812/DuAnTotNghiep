package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/thuong-hieu")
public class ThuongHieuController {

    @GetMapping
    public String thuonghieu() {
        return "admin/thuonghieu/thuong-hieu";
    }
}
