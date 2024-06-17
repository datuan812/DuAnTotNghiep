package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.HoaDonChiTietEntity;
import com.laptrinhjavaweb.model.response.HoaDonChiTietResponse;
import com.laptrinhjavaweb.model.response.hoadon.HDCTResponse;
import com.laptrinhjavaweb.repository.custom.HoaDonChiTietCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTietEntity, Long>, HoaDonChiTietCustom {
    @Query("select hdct from HoaDonChiTietEntity hdct where hdct.hoaDon.id=:idhd ")
    List<HoaDonChiTietResponse> dsHoaDonChiTietByIdHoaDon(@Param("idhd") Long idhd);

    @Query("select hdct from HoaDonChiTietEntity hdct where hdct.hoaDon.id=:idhd ")
    List<HoaDonChiTietEntity> findByHoaDon(@Param("idhd") Long idhd);

    @Query("select hdct from HoaDonChiTietEntity hdct where hdct.hoaDon.trangThai = 'CHUANBIDATHANG' and hdct.hoaDon.khachHang.id=:idkh")
    List<HoaDonChiTietResponse> getHoaDonMoiTaoByIdkh(@Param("idkh") Long idkh);

    HoaDonChiTietEntity findByHoaDon_maAndSanPham_idAndBienThe_id(String maHoaDon, Long idSanPham, Long idKhuyeMai);

    @Query("select hdct from HoaDonChiTietEntity hdct where hdct.hoaDon.ma=:mahd")
    List<HDCTResponse> dsHoaDonChiTietResponse(@Param("mahd") String maHoaDon);

    @Modifying
    @Query("DELETE FROM HoaDonChiTietEntity hdct WHERE hdct.id = :id")
    void deleteHoaDonCT(@Param("id") Long id);

    List<HoaDonChiTietEntity> findAllByHoaDon_ma(String ma);

    List<HoaDonChiTietEntity> findAllByBienThe_IdIn(List<Long> idsBienThe);
}
