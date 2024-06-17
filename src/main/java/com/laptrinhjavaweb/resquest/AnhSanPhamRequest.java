package com.laptrinhjavaweb.resquest;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AnhSanPhamRequest {

    private String hinhAnh;

    private String base64;

    private Long idSanPham;

    public String getBase64() {
        if(base64 != null){
            return base64.split(",")[1];
        }
        return base64;
    }

    private String trangThai = "ACTIVE";
}
