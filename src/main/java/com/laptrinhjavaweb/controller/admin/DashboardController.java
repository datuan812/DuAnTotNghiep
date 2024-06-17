package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class DashboardController {

    @GetMapping("/dashboards")
    public String dashboard() {
        return "admin/dashboard";
    }

    @GetMapping("/setting/profile")
    public String profile() {
        return "admin/setting/profile";
    }

    @GetMapping("/setting/tich-diem")
    public String tichdiem() {
        return "admin/setting/tich-diem";
    }

    @GetMapping("/403")
    public String admin403(){
        return "admin/403";
    }

    @GetMapping("/lich-su-tich-diem")
    public String lstd() {
        return "admin/setting/lich-su-tich-diem";
    }

    @GetMapping("/slider")
    public String slider() {
        return "admin/setting/slider";
    }


    @GetMapping("/hoa-don/printf/{ma}")
    public String xuathoadon(@PathVariable("ma") String ma) {
        return "admin/xuat-hoa-don";
    }

    @GetMapping("/tra-hang")
    public String trahang(){
            return "admin/tra-hang";

    }
}


