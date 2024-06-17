package com.laptrinhjavaweb.model.response.thongke;

import java.math.BigDecimal;
import java.util.Date;

public interface ThongKeHoaDonResponse {

    Date getNgay();
    Long getTongHoaDonBanDuoc();
    BigDecimal getTongTienHang();
    Long getSoLuong();
    Long getSoLuongKhuyenMai();
}
