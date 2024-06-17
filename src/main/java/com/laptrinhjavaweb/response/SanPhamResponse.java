package com.laptrinhjavaweb.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SanPhamResponse {

	private Long id;

	private String slug;
	
	private String ma;
	
	private String ten;
	
	private Double gia;

	private Integer soLuong;
	
	private String moTa;

	private String thongTinChiTiet;
	
	private DanhMucResponse danhMuc;
	
	private ThuongHieuResponse thuongHieu;
	
	private List<ThuocTinhResponse> thuocTinh;

	private List<BienTheResponse> bienThe;

	private List<AnhSanPhamResponse> anh;

	private Double giaBan;

	private KhuyenMaiHienThiResponse khuyenMaiHienThiResponse;

	private String trangThai;

	private String ngayTao;

}
