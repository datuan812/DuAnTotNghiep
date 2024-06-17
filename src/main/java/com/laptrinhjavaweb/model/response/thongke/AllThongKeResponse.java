package com.laptrinhjavaweb.model.response.thongke;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class AllThongKeResponse {

    private DoanhThuBanHangResponse doanhThuBanHang;

    private List<TopResponse> dsKhachHangMuaNhieuNhat;
    private List<TopResponse> dsSanPhamBanChayNhat;
}
