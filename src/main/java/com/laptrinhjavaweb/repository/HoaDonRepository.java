package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.HoaDonChiTietEntity;
import com.laptrinhjavaweb.entity.HoaDonEntity;
import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.model.response.HoaDonResponse;
import com.laptrinhjavaweb.model.response.hoadon.ThongTinHoaDonResponse;
import com.laptrinhjavaweb.model.response.hoadon.TongTienResponse;
import com.laptrinhjavaweb.model.response.thongke.DanhSachHoaDonResponse;
import com.laptrinhjavaweb.model.response.thongke.DoanhThuBanHangResponse;
import com.laptrinhjavaweb.model.response.thongke.ThongKeHoaDonResponse;
import com.laptrinhjavaweb.model.response.thongke.TopResponse;
import com.laptrinhjavaweb.repository.custom.HoaDonRepositoryCustom;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public interface HoaDonRepository extends JpaRepository<HoaDonEntity,Long>, HoaDonRepositoryCustom {

    @Modifying
    @Transactional
    @Query(value = " update bienthe bt\n" +
            "\t join hoadonchitiet hdct on bt.id = hdct.idbienthe \n" +
            "\t set bt.soluong = (bt.soluong+hdct.soluong)\n" +
            "\twhere idhoadon = :idhd",nativeQuery = true)
    void updateLaiSoLuongKhiHuyDon(@Param("idhd")Long idhd);

    @Query(value = "select count(hd) from HoaDonEntity hd where hd.khachHang.id=:idkh" +
            " and Date(hd.ngayDat)=Date(CURRENT_DATE) and hd.trangThai<>'CHUANBIDATHANG'")
    Integer soLanMua(@Param("idkh")Long idkh);
    @Query("select hd from HoaDonEntity hd where hd.ma=:mahd")
    ThongTinHoaDonResponse getHoaDonResponse(@Param("mahd")String idhd);

    @Query(value = "select * from vw_thongkedshoadon",nativeQuery = true)
    List<ThongKeHoaDonResponse> thongKeDsHoaDon();
    HoaDonEntity findByMa(String maHoaDon);

    @Query(value = "select hd from HoaDonEntity hd where hd.trangThai <> 'CHUANBIDATHANG' and hd.loai='Online' order by hd.ngayDat desc ")
    List<DanhSachHoaDonResponse> dsHoaDon();
    @Query(value = "select hd from HoaDonEntity hd where hd.trangThai <> 'CHUANBIDATHANG' and date(hd.ngayDat) >= date(:startdate) and date(hd.ngayDat) <= date(:enddate) " +
            " and (:trangthai ='' or hd.trangThai=:trangthai) and (:pttt='' or hd.phuongThucThanhToan=:pttt) and hd.loai = 'Online' " +
            " order by hd.ngayDat desc")
    List<DanhSachHoaDonResponse> dsHoaDon(
            @Param("pttt") String pttt,
            @Param("trangthai") String trangThai,
            @Param("startdate") Date startDate,
            @Param("enddate") Date endDate
    );

    @Query(value = "select * from vw_hoadonchitiet_summary where idhoadon =:idhd", nativeQuery = true)
    TongTienResponse tongTienByHoaDon(@Param("idhd")Long idhd);
    @Query("select hd from HoaDonEntity hd where hd.trangThai ='CHUANBIDATHANG' and hd.khachHang.id=:idkh ")
    HoaDonEntity findHoaDonMoiDat(@Param("idkh") Long idkh);

    @Query("select hd from HoaDonEntity hd where hd.trangThai not in('HUYDON','DANHANHANG','CHUANBIDATHANG') and hd.loai='Online' order by hd.ngayDat desc")
    List<HoaDonResponse> dsHoaDonOnline();
    @Query("select hd from HoaDonEntity hd where " +
            "(:trangthai = '' or hd.trangThai = :trangthai) " +
            "and hd.loai = 'Online' " +
            "and (:ten = '' " +
            "or hd.ma = :ten " +
            "or hd.khachHang.ma = :ten " +
            "or hd.khachHang.ten = :ten " +
            "or hd.tenNguoiNhan = :ten " +
            "or hd.sodienthoai = :ten " +
            "or hd.phuongThucThanhToan = :ten) " +
            "and hd.trangThai not in ('HUYDON', 'DANHANHANG', 'CHUANBIDATHANG') " +
            "order by hd.ngayDat desc")
    List<HoaDonResponse> dsHoaDonOnline(@Param("trangthai") String trangThai, @Param("ten") String ten);

    List<HoaDonResponse> findAllByKhachHang_IdAndTrangThaiAndLoai(Long idkh,String trangThai,String loai);

    List<HoaDonResponse> findAllByKhachHang_IdAndTrangThaiNotInAndLoaiOrderByNgayDat(Long idkh,List<String> trangThais,String loai);

    List<HoaDonResponse> findAllByTrangThaiNotContainsAndLoai(String trangThai,String loai);

    @Query("select hd from HoaDonEntity hd where hd.loai='Online' and hd.trangThai in ('DANGGIAOHANG','DANHANHANG','HUYDON')" +
            " order by hd.ngayGiaoHang")
    List<HoaDonResponse> dsHoaDonDangGiao();

    HoaDonEntity findByMaGiaoHang(String maGiaoHang);
    @Modifying
    @Query("update HoaDonEntity hd set hd.trangThai=:trangthai where hd.maGiaoHang=:magiaohang")
    @Transactional
    void thayDoiTrangThaiGiaoHangTheoMaGiaoHang(@Param("magiaohang")String maGiaoHang,@Param("trangthai")String trangThai);
    @Query(value = "select * from vw_thongkedssp",nativeQuery = true)
    List<TopResponse> thongKeDsSanPhamTheoThoiGian();

    @Query("SELECT COUNT(hd.id) as tong, hd.khachHang.ma as ma, hd.khachHang.ten as ten, hd.khachHang.soDienThoai as thongTin" +
            " FROM HoaDonEntity hd " +
            " WHERE DATE(hd.ngayDat) = CURDATE() AND hd.trangThai NOT IN ('HUYDON') and (hd.phuongThucThanhToan in ('VIDIENTU','CHUYENKHOAN') or hd.trangThai = 'DANHANHANG')" +
            " GROUP BY hd.khachHang.ma, ten, hd.khachHang.soDienThoai " +
            " ORDER BY tong DESC")
    List<TopResponse> dsKhachHangMuaNhieuNhatTheoNgay();

    @Query("SELECT COUNT(hd.id) as tong, hd.khachHang.ma as ma, hd.khachHang.ten as ten, hd.khachHang.soDienThoai as thongTin" +
            " FROM HoaDonEntity hd " +
            " WHERE YEARWEEK(hd.ngayDat) = YEARWEEK(CURDATE()) AND YEAR(hd.ngayDat) = YEAR(CURDATE()) AND hd.trangThai NOT IN ('HUYDON') and (hd.phuongThucThanhToan in ('VIDIENTU','CHUYENKHOAN') or hd.trangThai = 'DANHANHANG')" +
            " GROUP BY hd.khachHang.ma, ten, hd.khachHang.soDienThoai " +
            " ORDER BY tong DESC")
    List<TopResponse> dsKhachHangMuaNhieuNhatTheoTuan();

    @Query("SELECT COUNT(hd.id) as tong, hd.khachHang.ma as ma, hd.khachHang.ten as ten, hd.khachHang.soDienThoai as thongTin" +
            " FROM HoaDonEntity hd " +
            " WHERE YEAR(hd.ngayDat) = YEAR(CURDATE()) AND MONTH(hd.ngayDat) = MONTH(CURDATE()) AND hd.trangThai NOT IN ('HUYDON')" +
            " and (hd.phuongThucThanhToan in ('VIDIENTU','CHUYENKHOAN') or hd.trangThai = 'DANHANHANG') GROUP BY hd.khachHang.ma, ten, hd.khachHang.soDienThoai " +
            " ORDER BY tong DESC")
    List<TopResponse> dsKhachHangMuaNhieuNhatTheoThang();

    @Query("SELECT count(hd.id) as tong, hd.khachHang.ma as ma, hd.khachHang.ten as ten, hd.khachHang.soDienThoai as thongTin" +
            " FROM HoaDonEntity hd " +
            " WHERE YEAR(hd.ngayDat) = YEAR(CURDATE()) AND hd.trangThai NOT IN ('HUYDON')" +
            " and (hd.phuongThucThanhToan in ('VIDIENTU','CHUYENKHOAN') or hd.trangThai = 'DANHANHANG') GROUP BY hd.khachHang.ma, ten, hd.khachHang.soDienThoai " +
            " ORDER BY tong DESC")
    List<TopResponse> dsKhachHangMuaNhieuNhatTheoNam();

    @Query("SELECT sum(hdct.soLuong) as tong, sp.id, sp.ten as ten FROM HoaDonChiTietEntity hdct " +
            " JOIN BienTheEntity bt ON hdct.bienThe.id = bt.id " +
            " JOIN SanPhamEntity sp ON sp.id = bt.sanPham.id " +
            " WHERE DATE(hdct.hoaDon.ngayDat) = CURDATE() AND hdct.hoaDon.trangThai NOT IN ('HUYDON') " +
            " and (hdct.hoaDon.phuongThucThanhToan in ('VIDIENTU','CHUYENKHOAN') or hdct.hoaDon.trangThai = 'DANHANHANG') GROUP BY sp.ten, sp.id ORDER BY tong DESC")
    List<TopResponse> dsSanPhamBanChayTheoNgay();

    @Query("SELECT sum(hdct.soLuong) as tong, sp.id, sp.ten as ten FROM HoaDonChiTietEntity hdct " +
            " JOIN BienTheEntity bt ON hdct.bienThe.id = bt.id " +
            " JOIN SanPhamEntity sp ON sp.id = bt.sanPham.id " +
            " WHERE YEARWEEK(hdct.hoaDon.ngayDat) = YEARWEEK(CURDATE()) AND YEAR(hdct.hoaDon.ngayDat) = YEAR(CURDATE()) AND hdct.hoaDon.trangThai NOT IN ('HUYDON')" +
            " and (hdct.hoaDon.phuongThucThanhToan in ('VIDIENTU','CHUYENKHOAN') or hdct.hoaDon.trangThai = 'DANHANHANG') GROUP BY sp.ten, sp.id ORDER BY tong DESC")
    List<TopResponse> dsSanPhamBanChayTheoTuan();

    @Query("SELECT sum(hdct.soLuong) as tong, sp.id, sp.ten as ten FROM HoaDonChiTietEntity hdct " +
            " JOIN BienTheEntity bt ON hdct.bienThe.id = bt.id " +
            " JOIN SanPhamEntity sp ON sp.id = bt.sanPham.id " +
            " WHERE YEAR(hdct.hoaDon.ngayDat) = YEAR(CURDATE()) AND MONTH(hdct.hoaDon.ngayDat) = MONTH(CURDATE()) AND hdct.hoaDon.trangThai NOT IN ('HUYDON')" +
            " and (hdct.hoaDon.phuongThucThanhToan in ('VIDIENTU','CHUYENKHOAN') or hdct.hoaDon.trangThai = 'DANHANHANG') GROUP BY sp.ten, sp.id ORDER BY tong DESC")
    List<TopResponse> dsSanPhamBanChayTheoThang();

    @Query("SELECT sum(hdct.soLuong) as tong, sp.id, sp.ten as ten FROM HoaDonChiTietEntity hdct " +
            " JOIN BienTheEntity bt ON hdct.bienThe.id = bt.id " +
            " JOIN SanPhamEntity sp ON sp.id = bt.sanPham.id " +
            " WHERE YEAR(hdct.hoaDon.ngayDat) = YEAR(CURDATE()) AND hdct.hoaDon.trangThai NOT IN ('HUYDON')" +
            " and (hdct.hoaDon.phuongThucThanhToan in ('VIDIENTU','CHUYENKHOAN') or hdct.hoaDon.trangThai = 'DANHANHANG') GROUP BY sp.ten, sp.id ORDER BY tong DESC")
    List<TopResponse> dsSanPhamBanChayTheoNam();

    @Query(value = "select * from vw_doanhthungay", nativeQuery = true)
    DoanhThuBanHangResponse doanhThuNgay();

    @Query(value = "select * from vw_doanhthutuan", nativeQuery = true)
    DoanhThuBanHangResponse doanhThuTuan();

    @Query(value = "select * from vw_doanhthuthang", nativeQuery = true)
    DoanhThuBanHangResponse doanhThuThang();

    @Query(value = "select * from vw_doanhthunam", nativeQuery = true)
    DoanhThuBanHangResponse doanhThuNam();

    List<HoaDonEntity> findAllByTrangThaiAndNhanVien_IdNotNullOrderByNgayTaoDesc(String trangThai);

    @Modifying
    @Query("DELETE FROM HoaDonEntity hd WHERE hd.id = :id")
    void deleteHoaDon(@Param("id") Long id);
}
