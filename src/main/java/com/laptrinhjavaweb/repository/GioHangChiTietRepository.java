package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.GioHangChiTietEntity;
import com.laptrinhjavaweb.model.response.GioHangResponse;
import com.laptrinhjavaweb.model.response.hoadon.TongTienResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GioHangChiTietRepository extends JpaRepository<GioHangChiTietEntity,Long> {

    @Query("select distinct ghct.bienThe.sanPham.id from GioHangChiTietEntity ghct" +
            " where ghct.gioHang.khachHang.id=:idkh and " +
            "ghct.trangThai not in ('DELETE','PENDING','DAHETHANG')")
    List<Long> dsspCuaGioHang(@Param("idkh")Long idkh);

    @Query("SELECT g FROM GioHangChiTietEntity g WHERE g.gioHang.id = :idGioHang AND g.trangThai = :trangThai order by g.ngayTao desc ")
    List<GioHangChiTietEntity> findAllByGioHang_Id(@Param("idGioHang") Long idGioHang, @Param("trangThai") String trangThai);

    @Query("select ghct from GioHangChiTietEntity ghct" +
            " where ghct.gioHang.khachHang.id=:idkh and ghct.bienThe.sanPham.id=:idsp and ghct.trangThai " +
            "not in ('DELETE','PENDING','DAHETHANG') order by ghct.ngayTao desc,ghct.ngaySua desc ")
    List<GioHangResponse> dsGhctCuaSanPham(@Param("idkh")Long idkh,@Param("idsp")Long idsp);

    @Query("select ghct from GioHangChiTietEntity ghct" +
            " where ghct.gioHang.khachHang.id=:idkh and ghct.trangThai not in ('DELETE','PENDING','DAHETHANG')")
    List<GioHangResponse> dsGioHangChiTietByIdKh(@Param("idkh")Long idkh);

    GioHangChiTietEntity findGioHangChiTietEntitiesByBienThe_IdAndGioHang_KhachHang_IdAndTrangThai(Long bienTheId,Long khachHangId,String trangThai);

    @Query(value = "SELECT SUM(giagoc) as giagoc, SUM(giagiam) as giagiam," +
            " sum(thucte) as thucte FROM vw_giohangchitiet_summary WHERE id IN (:lstghct)", nativeQuery = true)
    TongTienResponse tongTienTheoGioHangChiTiet(@Param("lstghct") List<Long> lstghct);

    @Query(value = "SELECT * FROM giohangchitiet WHERE id IN (:dsghct)",nativeQuery = true)
    List<GioHangChiTietEntity> dsGioHangChiTiet(@Param("dsghct") List<Long> dsghct);

    @Query(value = "update giohangchitiet ghct \n" +
            "join giohang gh on ghct.idgiohang = gh.id \n" +
            "set ghct.trangthai = 'ACTIVE' \n" +
            "where ghct.trangthai = 'PENDING' AND idkhachhang =:idkh",nativeQuery = true)
    @Modifying
    Integer layLaiDsGioHangChiTiet(@Param("idkh")Long idkh);

    @Query(value ="select ghct from GioHangChiTietEntity ghct where ghct.id =:idghct")
    GioHangResponse getGioHangChiTietResponse(@Param("idghct")Long idghct);

    @Modifying
    @Query(value ="call sp_update_price_hdct (:idhd,:idkh)",nativeQuery = true)
    int configHoaDonChiTietKhiDatHang(@Param("idhd")Long idhd,@Param("idkh")Long idkh);

    @Modifying
    @Query(value ="call sp_deletechuanbidathang(:idsp)",nativeQuery = true)
    int configHoaDonChuanBiDat(@Param("idsp")Long idsp);

    GioHangChiTietEntity findByGioHang_idAndBienThe_idAndTrangThai(Long idGioHang, Long idBienThe, String trangThai);

    List<GioHangChiTietEntity> findAllByIdInAndGioHang_KhachHang_Ma(List<Long> ids, String maKhachHang);

    List<GioHangChiTietEntity> findAllByBienThe_IdInAndTrangThai (List<Long> idsBienThe, String trangThai);

    @Modifying
    @Query("delete from GioHangChiTietEntity g WHERE g.bienThe.id in ?1")
    void updateVariant (List<Long> idsBienThe);

    @Modifying
    @Query("update GioHangChiTietEntity g set g.trangThai = :trangThai WHERE g.sanPham.id = :idSanPham")
    void updateInActive (@Param("trangThai") String trangThai, @Param("idSanPham") Long idSanPham);
}
