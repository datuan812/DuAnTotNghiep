package com.laptrinhjavaweb.model.response;

import com.laptrinhjavaweb.entity.HoaDonChiTietEntity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

import java.math.BigDecimal;

@Projection(types = {HoaDonChiTietEntity.class})
public interface HoaDonChiTietResponse {
    @Value("#{target.id}")
    Long getIdHdct();

    @Value("#{target.hoaDon.ma}")
    String getMaHoaDon();

    @Value("#{target.sanPham.ten}")
    String getTenSanPham();

    @Value("#{target.sanPham.slug}")
    String getSlugSP();

//    @Value("#{target.hinhAnh}")
    @Value("#{target.anhbienthe}")
    String getImage();

//    @Value("#{target.bienThe.id}")
//    Long getIdBienThe();
//    @Value("#{target.bienThe.ma}")
//    String getMaBienThe();
    @Value("#{target.tenBienThe}")
    String getTenBienThe();

    @Value("#{target.hoaDon.khachHang.id}")
    Long getIdKhachHang();
    @Value("#{target.hoaDon.id}")
    Long getIdHoaDon();


    @Value("#{target.soLuong}")
    Integer getSoLuong();

    @Value("#{target.giaTien}")
    BigDecimal getGiaTien();

    @Value("#{target.giaTienKm}")
    BigDecimal getGiaTienKm();


    @Value("#{target.sanPham.danhMuc.ten}")
    String getTenDanhMuc();

    @Value("#{target.hoaDon.id}")
    Long getIdhd();

    @Value("#{target.hoaDon.khachHang.ma}")
    String getMaKhachHang();
    @Value("#{target.hoaDon.sodienthoai}")
    String getSoDienThoai();
    @Value("#{target.hoaDon.tenNguoiNhan}")
    String getTenNguoiNhan();
    @Value("#{target.hoaDon.diaChi}")
    String getDiaChiNguoiNhan();

    @Value("#{target.hoaDon.trangThai}")
    String getTrangThaiHoaDon();

    @Value("#{target.tongTien}")
    Double getTongTienHdct();
    @Value("#{target.hoaDon.tongTienHang}")
    Double getTongTienSanPham();

    @Value("#{target.hoaDon.tienShip}")
    Double getTienShip();
    @Value("#{target.hoaDon.tongTien}")
    Double getTongTien();

    @Value("#{target.hoaDon.moTa}")
    String getMoTa();


}
