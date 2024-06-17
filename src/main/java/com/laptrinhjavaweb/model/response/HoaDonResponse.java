package com.laptrinhjavaweb.model.response;

import com.laptrinhjavaweb.entity.HoaDonEntity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.rest.core.config.Projection;

import java.util.Date;

@Projection(types = {HoaDonEntity.class})
public interface HoaDonResponse {

    @Value("#{target.id}")
    Long getId();

    @Value("#{target.ma}")
    String getMa();

    @Value("#{target.maGiaoHang}")
    String getMaGiaoHang();

//    @Value("#{target.nhanVien.id}")
//    Long getNhanVienId();

    @Value("#{target.tenNguoiNhan}")
    String getTenNguoiNhan();
    @Value("#{target.ngayDat}")
    Date getThoiGianDat();
    @Value("#{target.tongTienHang}")
    Double getTongTienHang();
    @Value("#{target.tongTien}")
    Double getTongTien();

    @Value("#{target.tienKhachTra}")
    Double getTienKhachTra();
    @Value("#{target.phuongThucThanhToan}")
    String getPhuongThucThanhToan();
    @Value("#{target.tienShip}")
    String getTienShip();

    @Value("#{target.trangThai}")
    String getTrangThai();
    @Value("#{target.diaChi}")
    String getDiaChi();

    @Value("#{target.sodienthoai}")
    String getSoDienThoai();


}
