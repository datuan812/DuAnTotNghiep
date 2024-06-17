package com.laptrinhjavaweb.resquest;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GioHangChiTietRequest {

    private Long id;

    private Long idGioHang;

    private Long idSanPham;

    private Long idBienThe;

    private Integer soLuong;

    private String trangThai = "ACTIVE";
}
