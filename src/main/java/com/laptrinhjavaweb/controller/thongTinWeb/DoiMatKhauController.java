package com.laptrinhjavaweb.controller.thongTinWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class DoiMatKhauController {

    @GetMapping("/doi-mat-khau")
    public String changePass() {
        return "thongtinWeb/doi-mat-khau";
    }
}
