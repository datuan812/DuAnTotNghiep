package com.laptrinhjavaweb.resquest;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NhanVienRequest {

    private String ten;

    private String canCuocCongDan;

    private String gioiTinh;

    private String diaChi;

    private String matKhau;

    private Date ngaySinh;

    private Date ngayCap;

    private String anh;

    private String base64;

    private String email;

    private String maChucVu;

    private String soDienThoai;

    public String getBase64() {
        if(base64 != null){
            return base64.split(",")[1];
        }
        return base64;
    }

    private String trangThai = "ACTIVE";
}
