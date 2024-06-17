package com.laptrinhjavaweb.resquest;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LichSuTichDiemRequest {

    private String maHoaDon;

    private String maKhachHang;

    private Integer soDiemDung;

    private Integer soDiemTichDuoc;

    private Integer soDiemHoan;

    private String trangThai = "CONGDIEM";
}
