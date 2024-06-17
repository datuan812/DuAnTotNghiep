package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/giao-dich")
public class HoaDonController {

    @GetMapping("/hoa-don")
    public String hoadon(){
        return "admin/giaodich/hoa-don";
    }

    @GetMapping("/hoa-don-off")
    public String hoadonoff(){
        return "admin/giaodich/hoa-don-off";
    }

    @GetMapping("/hoa-don-off/create/{ma}")
    public String themhoadon(@PathVariable("ma") String ma){
        return "admin/giaodich/hoa-don-create";
    }

    @GetMapping("/detail/{ma}")
    public String detailhoadon(){
        return "admin/giaodich/hoa-don-detail";
    }

    @GetMapping("/hoa-don-huy/{ma}")
    public String detailhoadonhuy(){
        return "admin/giaodich/hoa-don-detail-huy";
    }

}
