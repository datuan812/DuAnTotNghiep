package com.laptrinhjavaweb.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ThayDoiSoLuongGioHangRequest {

    private Long idGhct;

    private Integer soLuong;

    private Double tongTien;
}
