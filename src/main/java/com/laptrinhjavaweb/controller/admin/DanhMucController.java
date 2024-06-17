package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/danh-muc")
public class DanhMucController {

    @GetMapping
    public String danhmuc() {
        return "admin/danhmuc/danh-muc";
    }

}
