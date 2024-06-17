package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.response.SanPhamResponse;
import com.laptrinhjavaweb.service.IKhuyenMaiService;
import com.laptrinhjavaweb.service.ISanPhamService;
import com.laptrinhjavaweb.utils.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class HomePageController {

    @Autowired
    private ISanPhamService sanPhamService;

    @Autowired
    private IKhuyenMaiService khuyenMaiService;

    public HomePageController(IKhuyenMaiService khuyenMaiService) {
        this.khuyenMaiService = khuyenMaiService;
        khuyenMaiService.updateDS();
    }

    @GetMapping("/trang-chu")
    public ModelAndView homePage(){
        khuyenMaiService.updateDS();
        ModelAndView mav = new ModelAndView("web/homepage");
        mav.addObject("productOutstanding", sanPhamService.random(null,null, null, 1, null, 6));
        mav.addObject("productPopular", sanPhamService.random(null,null, null, null, 1, 6));
        mav.addObject("productNew", sanPhamService.random(null,1, null, null, null, 6));
        return mav;
    }

    @GetMapping("/danh-muc/{slug}")
    public ModelAndView danhMuc(
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "limit", required = false, defaultValue = "9") Integer limit,
            @PathVariable(name = "slug") String slug,
            @RequestParam Map<String, Object> filters
    ){
        MapUtils.deleteKeyFromMap(filters);
        ModelAndView mav = new ModelAndView("web/category");
        Map<String, Object> results = sanPhamService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit, null, filters, slug);
        mav.addObject("mapProduct", results);
        mav.addObject("attributeChecked", filters);
        return mav;
    }

    @GetMapping("/danh-sach-san-pham")
    public ModelAndView shop(
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "limit", required = false, defaultValue = "9") Integer limit,
            @RequestParam Map<String, Object> filters
    ){
        khuyenMaiService.updateDS();
        MapUtils.deleteKeyFromMap(filters);
        ModelAndView mav = new ModelAndView("web/shop");
        Map<String, Object> results = new HashMap<>();
        if(filters == null || filters.isEmpty()){
            results = sanPhamService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit, null, null, null);
        }else{
            results = sanPhamService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit, null, filters, null);
            mav.addObject("attributeChecked", filters);
        }
        mav.addObject("mapProduct", results);
        return mav;
    }

    @GetMapping("/search")
    public ModelAndView search(
            @RequestParam(name = "q") String param,
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "limit", required = false, defaultValue = "9") Integer limit,
            @RequestParam Map<String, Object> filters
    ){
        MapUtils.deleteKeyFromMap(filters);
        ModelAndView mav = new ModelAndView("web/search");
        Map<String, Object> results = sanPhamService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit, param, filters, null);
        mav.addObject("mapProduct", results);
        mav.addObject("attributeChecked", filters);
        return mav;
    }

    @GetMapping("/san-pham/{slug}")
    public ModelAndView detail(@PathVariable("slug") String slug){
        ModelAndView mav = new ModelAndView("web/detail");
        SanPhamResponse result = sanPhamService.findBySlug(slug);
        if (result.getKhuyenMaiHienThiResponse() != null){
            khuyenMaiService.updateStatusByMa(result.getKhuyenMaiHienThiResponse().getMa());
        }
        mav.addObject("product", result);
        mav.addObject("sameProduct", sanPhamService.same(slug));
        return mav;
    }

    @GetMapping("/checkout")
    public String checkout(){
        return "web/checkout";
    }

    @GetMapping("/cart")
    public String cart(){
        return "web/cart";
    }

    @GetMapping("/contact")
    public String contact(){
        return "web/contact";
    }

    @GetMapping("/faqs")
    public String faqs(){
        return "web/faqs";
    }

    @GetMapping("/shop_us")
    public String shop_us(){
        return "web/shop_us";
    }

    @GetMapping("/403")
    public String web403(){
        return "web/403";
    }

    @GetMapping("/test")
    public String test(){
        return  "web/test";
    }
}

