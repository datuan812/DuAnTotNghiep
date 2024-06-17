package com.laptrinhjavaweb.resquest;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
public class KhuyenMaiRequest{

    private String ma;

    private String ten;

    private String loai;

    private Date ngayBatDau;

    private Date ngayKetThuc;

    private Integer giaTri;

    private Integer soLuong;

    private String moTa;

    List<String> listSanPham;

    private String trangThai = "ACTIVE";
}
