package com.laptrinhjavaweb.model.response;

import com.laptrinhjavaweb.entity.TrangThaiGiaoHangEntity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

@Projection(types = {TrangThaiGiaoHangEntity.class})
public interface TrangThaiGiaoHangResponse {
    @Value("#{target.id}")
    Long getId();

    @Value("#{target.tenTrangThai}")
    String getTenTrangThai();
  @Value("#{target.trangThaiHoaDon}")
    String getMaVanHang();

    @Value("#{target.hoaDon.maGiaoHang}")
    String getMaGiaoHang();

    @Value("#{target.hoaDon.tenNguoiNhan}")
    String getTenNguoiNhan();
    @Value("#{target.hoaDon.sodienthoai}")
    String getSdtNguoiNhan();

    @Value("#{target.hoaDon.diaChi}")
    String getDiaChiNguoiNhan();
    @Value("#{target.hoaDon.tongTien}")
    String getSoTienThuHo();

    @Value("#{target.ngayTao}")
    String getNgayTao();
}
