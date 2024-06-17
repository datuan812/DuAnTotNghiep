package com.laptrinhjavaweb.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TotalCartResponse {

    private Double tongTienHang;

    private Double tietKiem;

    private Double tongSoTien;
}
