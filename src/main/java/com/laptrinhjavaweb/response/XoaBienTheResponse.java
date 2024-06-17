package com.laptrinhjavaweb.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class XoaBienTheResponse {

    private Long id;

    private String ten;

    private String anh;

    private String giaTriBienThe;

    private Integer soLuong;

    private Double giaGoc;

    private Double giaMua;

    private String maKhachHang;

    private String maHoaDon;

    private Double thanhTien;
}
