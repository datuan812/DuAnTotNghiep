package com.laptrinhjavaweb.response;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter
@Setter
public class HoaDonResponse {

    private Long id;

    private String ma;

    private String tenKhachHang;

    private String soDienThoaiKhachHang;

    private Double tongTienHang;

    private Double tienKhachTra;

    private Double tienGiamGia;

    private Double tienThua;

    private List<HoaDonChiTietResponse> hoaDonChiTiet;

    private Date ngayTao;

    private Date ngaySua;

    private Date ngayThanhToan;

    private String tenNhanVien;

    private String trangThai;

    private String nguoiSua;

    private LyDoHuyDonReponse lyDoHuyDon;
}
