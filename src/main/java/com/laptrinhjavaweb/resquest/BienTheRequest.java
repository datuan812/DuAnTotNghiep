package com.laptrinhjavaweb.resquest;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BienTheRequest{

    private Long id;

    private String ten;

    private Double gia;

    private Integer soLuong;

    private String base64;

    private String hinhAnh;

    private Long idSanPham;

    public String getBase64() {
        if(base64 == null || base64.contains("http://localhost:8080/repository/")){
            return null;
        }
        if(base64 != null){
            return base64.split(",")[1];
        }
        return base64;
    }

    private String trangThai = "ACTIVE";
}
