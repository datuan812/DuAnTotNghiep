package com.laptrinhjavaweb.support.supportgiaohang;

import com.laptrinhjavaweb.model.response.HoaDonChiTietResponse;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class SanPhamGhnApi {

    private String name;
 //   private String code;
    private int quantity;
    private long price;
//    private int length;
//    private int width;
    private int weight = 200;
//    private int height;
//    private Category category;
    public SanPhamGhnApi(HoaDonChiTietResponse hoaDonChiTietResponse){
        name = hoaDonChiTietResponse.getTenSanPham();
        quantity = hoaDonChiTietResponse.getSoLuong();
        price = hoaDonChiTietResponse.getGiaTien().longValue();
    }
}
