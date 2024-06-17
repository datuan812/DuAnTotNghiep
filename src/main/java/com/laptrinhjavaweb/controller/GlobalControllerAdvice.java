package com.laptrinhjavaweb.controller;

import com.laptrinhjavaweb.response.CuaHangResponse;
import com.laptrinhjavaweb.response.DanhMucResponse;
import com.laptrinhjavaweb.response.FilterResponse;
import com.laptrinhjavaweb.response.ThuongHieuResponse;
import com.laptrinhjavaweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.EnumMap;
import java.util.List;

@ControllerAdvice
public class GlobalControllerAdvice {

    @Autowired
    private IThuocTinhService thuocTinhService;

    @Autowired
    private IDanhMucService danhMucService;

    @Autowired
    private IThuongHieuService thuongHieuService;

    @Autowired
    private ICuaHangService cuaHangService;

    @Autowired
    private IKhuyenMaiService khuyenMaiService;

    @ModelAttribute
    public void filterResponse(Model model){
        List<FilterResponse> results = thuocTinhService.filter();
        model.addAttribute("filterProduct", results);
    }

    @ModelAttribute
    public void danhMucResponse(Model model){
        List<DanhMucResponse> results = danhMucService.findAllByTrangThai();
        model.addAttribute("categoriesProduct", results);
    }

    @ModelAttribute
    public void thuongHieuResponse(Model model){
        List<ThuongHieuResponse> results = thuongHieuService.findAllByTrangThai();
        model.addAttribute("brandsProduct", results);
    }

    @ModelAttribute
    public void cuaHangResponse(Model model){
        EnumMap<CuaHangResponse, Object> results = cuaHangService.findAllInformation();
        model.addAttribute("storeInformation", results);
    }
    @ModelAttribute
    public void updateKM(){
        khuyenMaiService.updateDS();
    }
}
