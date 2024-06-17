package com.laptrinhjavaweb.controller.thongTinWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/web")
public class ThongTinWebController {

    @GetMapping("/all")
    public String all() {
        return "thongtinWeb/all";
    }

    @GetMapping("/account")
    public String account() {
        return "thongtinWeb/account";
    }

    @GetMapping("/cho-xac-nhan")
    public String choxacnhan() {
        return "thongtinWeb/cho-xac-nhan";
    }

    @GetMapping("/hoan-thanh")
    public String hoanthanh() {
        return "thongtinWeb/hoan-thanh";
    }

    @GetMapping("/cho-giao-hang")
    public String chogiaohang() {
        return "thongtinWeb/cho-giao-hang";
    }

    @GetMapping("/dang-giao")
    public String danggiao() {
        return "thongtinWeb/dang-giao";
    }

    @GetMapping("/da-huy")
    public String dahuy() {
        return "thongtinWeb/da-huy";
    }

    @GetMapping("/thong-tin-don-hang")
    public String thongtindonhang() {
        return "thongtinWeb/chi-tiet-don-hang";
    }
}