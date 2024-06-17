package com.laptrinhjavaweb.resquest;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CaLamRequest{

    private Double soTienDauCa;

    private Double soTienCuoiCa;

    private String maNhanVien;

    private String ghiChu;

    private Double tienChenhLech;

    private Double tienMatBanGiao;

    private String trangThai = "ACTIVE";
}
