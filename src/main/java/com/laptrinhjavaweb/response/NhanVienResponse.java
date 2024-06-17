package com.laptrinhjavaweb.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NhanVienResponse {

    private Long id;

    private String ten;

    private String ma;

    private String matKhau;

    private String soDienThoai;

    private String anh;

    private String email;

    private ChucVuResponse chucVu;

    private String diaChi;

    private Date ngaySinh;

    private Date ngayCap;

    private String canCuocCongDan;

    private String gioiTinh;

    private String trangThai;
}
