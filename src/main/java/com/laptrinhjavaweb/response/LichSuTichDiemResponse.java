package com.laptrinhjavaweb.response;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class LichSuTichDiemResponse {

    private Long id;

    private String tenKhachHang;

    private String soDienThoai;

    private String maHoaDon;

    private Integer soDiemDung;
;
    private Integer soDiemTichDuoc;

    private Date ngayTao;

    private Integer soDiemHoan;
}
