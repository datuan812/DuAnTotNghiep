package com.laptrinhjavaweb.api.thu3;

import com.laptrinhjavaweb.model.response.HoaDonResponse;
import com.laptrinhjavaweb.model.response.TrangThaiGiaoHangResponse;
import com.laptrinhjavaweb.service.Thu3Service;
import com.laptrinhjavaweb.utils.ResponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/thu3")
public class ApiThu3Controller {
    @Autowired
    Thu3Service thu3Service;

    @GetMapping("")
    public List<HoaDonResponse> dsHoaDonDangGiao(){
        return thu3Service.dsHoaDonDangGiao();
    }
    @GetMapping("/dstrangthai/{magiaohang}")
    public List<TrangThaiGiaoHangResponse> dsTrangThaiGiaoHang(@PathVariable(name = "magiaohang") Long idhd){

        return thu3Service.dsTrangThaiDangGiao(idhd);
    }
    @GetMapping("/themtrangthai/{magiaohang}")
    public void themTrangThaiGiaoHang(@PathVariable(name = "magiaohang")Long idhd,
                                                @RequestParam("tentrangthai") String tenTrangThai){
        thu3Service.themTrangThaiGiaoHang(idhd,tenTrangThai,"Đang giao hàng");
    }

    @GetMapping("/checkhuydon/{idkh}")
    public Boolean checkHuyDonTrongNgay(@PathVariable("idkh")Long idkh){
        return thu3Service.checkHuyDonTrongNgay(idkh);
    }
}
