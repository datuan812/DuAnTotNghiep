package com.laptrinhjavaweb.response;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class HoaDonChiTietResponse {

    private Long id;

    private String tenSanPham;

    private String image;

    private Integer soLuong;

    private Double gia;

    private Double thanhTien;

    private List<ThuocTinhResponse> thuocTinh;

    private List<Long> giaTriThuocTinhChecked;

    private Long idBienThe;

    private String tenThuongHieu;

    private String moTa;

    private String tenBienThe;
}
