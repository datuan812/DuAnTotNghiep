package com.laptrinhjavaweb.resquest;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HoaDonChiTietRequest{

    private String maHoaDon;

    private Long idSanPham;

    private Long idBienThe;

    private Long idKhuyenMai;

    private Double gia;

    private Integer soLuong;

    private Double thanhTien;

    private Double soTienGiam;

    private String trangThai = "ACTIVE";

    private String tenBienThe;
}
