package com.laptrinhjavaweb.resquest;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GioHangRequest {

    private String maKhachHang;

    private String trangThai = "ACTIVE";
}
