package com.laptrinhjavaweb.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ThongKeKhuyenMaiResponse {
    private Integer soLuongSuDung;
    private Double soTienThuDuoc;
    private Double soTienGiam;
}
