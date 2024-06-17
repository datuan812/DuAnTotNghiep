package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.HoaDonEntity;
import com.laptrinhjavaweb.entity.TrangThaiGiaoHangEntity;
import com.laptrinhjavaweb.model.response.TrangThaiGiaoHangResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TrangThaiGiaoHangRepository extends JpaRepository<TrangThaiGiaoHangEntity,Long> {

    @Query("select ttgh from TrangThaiGiaoHangEntity ttgh where ttgh.hoaDon.id=:magiaohang and ttgh.hoaDon.trangThai='DANGGIAOHANG' order by ttgh.ngayTao desc ")
    List<TrangThaiGiaoHangResponse> getTrangThaiDonHangByMaGiaoHang(@Param("magiaohang") Long maGiaoHang);
    @Query("select ttgh from TrangThaiGiaoHangEntity ttgh where ttgh.hoaDon.ma=:mahd order by ttgh.ngayTao desc,ttgh.ngaySua desc ")
    List<TrangThaiGiaoHangResponse> getTrangThaiDonHangByMaHD(@Param("mahd") String maGiaoHang);

    @Modifying
    @Query("DELETE FROM TrangThaiGiaoHangEntity tt WHERE tt.hoaDon = :hoadon ")
    void deleteByHoaDonId(@Param("hoadon") HoaDonEntity hoaDonEntity);

    @Query(value = "select count(1) from trangthaigiaohang ttgh join hoadon hd\n" +
            "on hd.id = ttgh.magiaohang\n" +
            "join khachhang kh on kh.id = hd.idkhachhang\n" +
            " where trangthaihoadon = 'Huỷ đơn' and\n" +
            " date(ttgh.ngaytao) =  CURDATE() and hd.idkhachhang = :idkh and kh.ma = ttgh.nguoitao",nativeQuery = true)
    Long checkSoLanHuyDonTrongNgay(@Param("idkh") Long idkh);
}
