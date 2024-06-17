package com.laptrinhjavaweb.api.hoadon;

import com.laptrinhjavaweb.model.request.ThayDoiSoLuongGioHangRequest;
import com.laptrinhjavaweb.model.response.GioHangResponse;
import com.laptrinhjavaweb.response.BienTheResponse;
import com.laptrinhjavaweb.service.GiaoHangService;
import com.laptrinhjavaweb.service.GioHangService;
import com.laptrinhjavaweb.service.IBienTheService;
import com.laptrinhjavaweb.utils.ResponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/user/giohang")
public class ApiGioHangController {
    @Autowired
    GioHangService gioHangService;

    @Autowired
    IBienTheService bienTheService;

    @Autowired
    GiaoHangService giaoHangService;
    @GetMapping("/{id}")
    public List<GioHangResponse> dsGioHangChiTietByKhachHang(@PathVariable(name = "id")Long idkh){
        return gioHangService.dsGioHangChiTietByIdKh(idkh);
    }
    @GetMapping("/dsghtheosp/{id}")
    public List<List<GioHangResponse>> dsGioHangChiTietTheoSanPham(@PathVariable(name = "id")Long idkh){
        return gioHangService.dsGioHangTheoSpByIdkh(idkh);
    }

    @GetMapping("/tongsptronggio")
    public Long tongBienTheTrongGioHang(@RequestParam(name = "id",required = false,defaultValue = "-1")Long idkh){
        if (idkh==-1){
            return 0L;
        }
        return  gioHangService.tongSoSanPhamTrongGioHang(idkh);
    }

    @PostMapping("/thaydoisoluong")
    public ResponseObject totalGioHangByKhachHang(@RequestBody ThayDoiSoLuongGioHangRequest request){
        return gioHangService.thayDoiSoLuong(request);
    }
    @PostMapping("/dathang/{idkh}")
    public String datHang(@PathVariable(name = "idkh") Long idkh
            ,@RequestBody Map<String, Object> requestBody){
        List<Long> dsghct = (List<Long>) requestBody.get("dsghct");
        return gioHangService.datHang(idkh,dsghct);
    }

    @GetMapping("/addcart")
    public String themSanPhamVaoGio(
            @RequestParam("data") String params,
            @RequestParam("idkh") Long idkh,
            @RequestParam("quantity") Integer quantity

    ) {
       List<Long> ds = convertStringToLongList(params);
        BienTheResponse bienThe = bienTheService.findByIdGiaTriThuocTinh(ds);
        return gioHangService.themVaoGioHang(idkh,bienThe.getId(),quantity);
    }
    @GetMapping("/updateCart")
    public GioHangResponse updateGioHangChiTiet(
            @RequestParam("data") String params,
            @RequestParam("idghct") Long idghct

    ) {
       List<Long> ds = convertStringToLongList(params);
        BienTheResponse bienThe = bienTheService.findByIdGiaTriThuocTinh(ds);
        return gioHangService.updateGioHangChiTiet(idghct,bienThe.getId());
    }
    public static List<Long> convertStringToLongList(String params) {
        List<Long> ds = new ArrayList<>();
        for (String number : params.split(",")) {
            ds.add(Long.parseLong(number)); // Chuyển đổi từ chuỗi sang số nguyên và thêm vào danh sách
        }
        return ds;
    }
//
    @GetMapping("/tongtienghct")
    public ResponseObject totalGioHangByKhachHang(
                                                  @RequestParam("dsghct")String dsghctStr
                                                  ){
        List<Long> dsghct = convertStringToLongList(dsghctStr);
        return new ResponseObject(gioHangService.tongTienTheoGioHangChiTiet(dsghct));
    }

    @DeleteMapping("/{idghct}")
    public String deleteGiohangChiTiet(
            @PathVariable(name = "idghct")Long idghct
    ){
        return gioHangService.xoaGioHangChiTiet(idghct);
    }
    @GetMapping("/checklanmua")
    public Boolean checkSoLanMua(@RequestParam(name = "idkh")Long idkh){
        return gioHangService.checkSoLanMua(idkh);
    }

}
