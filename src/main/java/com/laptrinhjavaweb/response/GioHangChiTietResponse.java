package com.laptrinhjavaweb.response;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class GioHangChiTietResponse {

    private Long id;

    private String slug;

    private String tenSanPham;

    private String image;

    private Double donGia;

    private Integer soLuong;

    private Double giaMua;

    private Double soTien;

    private List<ThuocTinhResponse> thuocTinh;

    private List<Long> giaTriThuocTinhChecked;

    private Long idBienThe;

    private Boolean isLoadCart;

    private Boolean trangThaiSanPham;

    private Integer soLuongConLaiBienThe;

    private String trangThai;
}
