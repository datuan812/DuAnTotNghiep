package com.laptrinhjavaweb.response;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ChiTieuResponse {

    private Double soTien;

    private Integer loaiChiTieu;

    private ViDienTuResponse viDienTu;

    private Date ngayTao;
}
