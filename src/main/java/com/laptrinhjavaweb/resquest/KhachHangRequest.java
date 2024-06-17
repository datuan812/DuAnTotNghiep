package com.laptrinhjavaweb.resquest;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class KhachHangRequest{

    private String ma;

    private String soDienThoai;

    private String email;

    private String ten;

    private String gioiTinh;

    private String matKhau;

    private String matKhauMoi;

    private Date ngaySinh;

    private String moTa;

    private String xacNhanMatKhau;

    private String trangThai = "ACTIVE";

    private String recipient;

    private String message;

    private String subject;
}
