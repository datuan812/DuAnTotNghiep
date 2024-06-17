package com.laptrinhjavaweb.model.response;

import com.laptrinhjavaweb.entity.GiaTriThuocTinhBienTheEntity;
import com.laptrinhjavaweb.entity.GioHangChiTietEntity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

import java.math.BigDecimal;
import java.util.List;

@Projection(types = {GioHangChiTietEntity.class})
public interface GioHangResponse {
    @Value("#{target.id}")
    Long getIdGhct();

    @Value("#{target.gioHang.khachHang.id}")
    Long getIdKhachHang();
    @Value("#{target.gioHang.id}")
    Long getIdGioHang();

    @Value("#{target.bienThe.id}")
    Long getIdBienThe();

    @Value("#{target.soLuong}")
    Integer getSoLuong();

    @Value("#{target.giaTien}")
    BigDecimal getGiaTien();

    @Value("#{target.giaTienKm}")
    BigDecimal getGiaTienKm();


    @Value("#{target.bienThe.sanPham.danhMuc.ten}")
    String getTenDanhMuc();
    @Value("#{target.bienThe.ten}")
    String getTenBienThe();

    @Value("#{target.bienThe.soLuong}")
    Integer getSoLuongBienThe();

    @Value("#{target.tongTien}")
    BigDecimal getTongTien();
    @Value("#{target.bienThe.sanPham.ten}")
    String getTenSanPham();

    @Value("#{target.bienThe.sanPham.slug}")
    String getSlugSanPham();

    @Value("#{target.hinhAnh}")
    String getImage();

}
