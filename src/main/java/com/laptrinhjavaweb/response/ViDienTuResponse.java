package com.laptrinhjavaweb.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ViDienTuResponse {

    private Long id;

    private KhacHangResponse khachHang;

    private Double soTien;
}
