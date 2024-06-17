package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.entity.HoaDonEntity;
import com.laptrinhjavaweb.model.response.HoaDonChiTietResponse;
import com.laptrinhjavaweb.model.response.HoaDonResponse;
import com.laptrinhjavaweb.model.response.hoadon.AllThongTinHoaDon;
import com.laptrinhjavaweb.model.response.hoadon.TongTienResponse;
import com.laptrinhjavaweb.model.response.thongke.AllThongKeResponse;
import com.laptrinhjavaweb.model.response.thongke.DanhSachHoaDonResponse;
import com.laptrinhjavaweb.model.response.thongke.DoanhThuBanHangResponse;
import com.laptrinhjavaweb.model.response.thongke.ThongKeHoaDonResponse;
import com.laptrinhjavaweb.model.response.thongke.TopResponse;
import com.laptrinhjavaweb.response.CaLamResponse;
import com.laptrinhjavaweb.utils.ResponseObject;

import java.util.Date;
import java.util.List;

public interface HoaDonService {

    void saveHoaDon(HoaDonEntity hoaDon);

    List<DanhSachHoaDonResponse> dsHoaDonResponse();

    List<DanhSachHoaDonResponse> dsHoaDonResponse(String phuongThucThanhToan,String trangThai,Date startDate, Date endDate);

    HoaDonEntity findById(Long idhd);

    List<ThongKeHoaDonResponse> thongKeHoaDon();

    List<HoaDonChiTietResponse> findHoaDonMoiDat(Long idkh);

    List<HoaDonChiTietResponse> dsHoaDonChiTietByIdHoaDon(Long idhd);

    TongTienResponse tongTienTheoHoaDon(Long idhd);

    List<HoaDonResponse> dsHoaDonOnline();

    List<HoaDonResponse> dsHoaDonOnline(String trangThai,String ten);

    String thayDoiTrangThaiHoaDon(Long idhd, String trangThai);

    HoaDonEntity thayDoiTrangThaiHoaDon(Long idhd, String trangThai,String luuy);

    List<HoaDonResponse> dsHoaDonTheoTrangThai(Long idkh,String trangThai);

    List<HoaDonResponse> dsHoaDonDaMua(Long idkh);

    List<HoaDonResponse> dsHoadon();

    ResponseObject huyDatHang(Long idkh);

    AllThongTinHoaDon allThongTinHoaDon(String maHoaDon);

    AllThongKeResponse allThongKe(Integer thoiGian);

    List<TopResponse> thongKeDsSanPham();

}
