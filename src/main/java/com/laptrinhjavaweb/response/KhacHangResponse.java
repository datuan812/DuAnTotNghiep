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
public class KhacHangResponse {

    private Long id;

    private String ma;

    private String ten;

    private String matKhau;

    private String soDienThoai;

    private String email;

    private String gioiTinh;

    private Date ngaySinh;

    private String moTa;

    private String trangThai;

}
