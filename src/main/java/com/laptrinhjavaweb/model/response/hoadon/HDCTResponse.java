package com.laptrinhjavaweb.model.response.hoadon;

import com.laptrinhjavaweb.entity.HoaDonChiTietEntity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

import java.math.BigDecimal;

@Projection(types = {HoaDonChiTietEntity.class})
public interface HDCTResponse {
    @Value("#{target.id}")
    Long getIdHdct();


    @Value("#{target.sanPham.ten}")
    String getTenSanPham();

    @Value("#{target.sanPham.slug}")
    String getSlugSP();

    @Value("#{target.hinhAnh}")
    String getImage();

//    @Value("#{target.bienThe.id}")
//    Long getIdBienThe();
//    @Value("#{target.bienThe.ma}")
//    String getMaBienThe();
    @Value("#{target.tenBienThe}")
    String getTenBienThe();


    @Value("#{target.soLuong}")
    Integer getSoLuong();

    @Value("#{target.giaTien}")
    BigDecimal getGiaTien();

    @Value("#{target.giaTienKm}")
    BigDecimal getGiaTienKm();


    @Value("#{target.sanPham.danhMuc.ten}")
    String getTenDanhMuc();

    @Value("#{target.hoaDon.trangThai}")
    String getTrangThaiHoaDon();

    @Value("#{target.tongTien}")
    Double getTongTienHdct();
//    @Value("#{target.hoaDon.tongTienHang}")
//    Double getTongTienSanPham();

//    @Value("#{target.hoaDon.tongTien}")
//    Double getTongTien();


}
