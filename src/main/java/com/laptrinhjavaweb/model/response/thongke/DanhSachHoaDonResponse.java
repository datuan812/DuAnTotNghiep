package com.laptrinhjavaweb.model.response.thongke;

import com.laptrinhjavaweb.entity.HoaDonEntity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

import java.util.Date;

@Projection(types = {HoaDonEntity.class})
public interface DanhSachHoaDonResponse {
    @Value("#{target.id}")
    Long getId();

    @Value("#{target.ma}")
    String getMa();

    @Value("#{target.ngayDat}")
    Date getNgayDat();
    @Value("#{target.ngayThanhToan}")
    Date getNgayThanhToan();
    @Value("#{target.khachHang.ma}")
    String getMaKhachHang();
    @Value("#{target.khachHang.ten}")
    String getTenNguoiDat();
    @Value("#{target.tongTienHang}")
    Double getTongTienHang();
    @Value("#{target.tienKhachTra}")
    Double getTienKhachTra();
    @Value("#{target.phuongThucThanhToan}")
    String getPhuongThucThanhToan();

    @Value("#{target.trangThai}")
    String getTrangThai();
}
