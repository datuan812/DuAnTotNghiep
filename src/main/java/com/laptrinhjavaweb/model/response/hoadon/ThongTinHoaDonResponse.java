package com.laptrinhjavaweb.model.response.hoadon;

import com.laptrinhjavaweb.entity.HoaDonChiTietEntity;
import com.laptrinhjavaweb.entity.HoaDonEntity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

@Projection(types = {HoaDonEntity.class})
public interface ThongTinHoaDonResponse {
    @Value("#{target.id}")
    Long getId();
    @Value("#{target.ma}")
    String getMa();
    @Value("#{target.diaChi}")
    String getDiaChi();
    @Value("#{target.sodienthoai}")
    String getSoDienThoai();
    @Value("#{target.tenNguoiNhan}")
    String getNguoiNhan();
    @Value("#{target.ngayDuKienGiaoHang}")
    String getNgayDuKienNhanHang();

    @Value("#{target.tienShip}")
    Double getTienShip();

    @Value("#{target.trangThai}")
    String getTrangThaiHoaDon();


}
