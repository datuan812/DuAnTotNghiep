package com.laptrinhjavaweb.model.response.hoadon;

import com.laptrinhjavaweb.model.response.TrangThaiGiaoHangResponse;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AllThongTinHoaDon {

    private ThongTinHoaDonResponse hoaDon;

    private List<HDCTResponse> dsHoaDonChiTiet;

    private List<TrangThaiGiaoHangResponse> trangThaiGiaoHang;
    private TongTienResponse tongTien;
}
