package com.laptrinhjavaweb.response;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class CaLamResponse {

    private Long id;

    private Date ngayTao;

    private Date ngaySua;

    private Double soTienCuoiCa;

    private Double soTienDauCa;

    private String maNhanVien;

    private Integer tongHoaDon;

    private Double tongTienMat;

    private Double tongTienChuyenKhoan;

    private Double tongTienTrongCa;

    private String ghiChu;

    private Double tienChenhLech;

    private Double tienMatBanGiao;
}
