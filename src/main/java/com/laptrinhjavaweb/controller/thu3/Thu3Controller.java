package com.laptrinhjavaweb.controller.thu3;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/thu3")
public class Thu3Controller {

    @GetMapping
    public String index(){
        return "/thu3/index";
    }
}
