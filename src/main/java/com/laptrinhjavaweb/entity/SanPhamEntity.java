package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "sanpham")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SanPhamEntity extends BaseEntity{
	@Column(name = "ten")
	private String ten;
	
	@Column(name = "slug", unique = true)
	private String slug;
	
	@Column(name = "gia")
	private Double gia;

	@Column(name = "soluong")
	private Integer soLuong;
	
	@Column(name = "mota", columnDefinition = "TEXT")
	private String moTa;
	
	@Column(name = "thongtinchitiet", columnDefinition = "TEXT")
	private String thongTinChiTiet;

	@Column(name = "sanphambanchay")
	private Integer sanPhamBanChay;

	@Column(name = "sanphammoi")
	private Integer sanPhamMoi;
	
	@Column(name = "sanphamnoibat")
	private Integer sanPhamNoiBat;
	
	@Column(name = "sanphamnhieuluotxem")
	private Integer sanPhamNhieuLuotXem;
	
	@Column(name = "sanphamphobien")
	private Integer sanPhamPhoBien;

	@Column(name = "experied_isnew")
	private Date experied_isnew;

	@Column(name = "experied_isPopular")
	private Date experied_isPopular;
	
	@ManyToOne
	@JoinColumn(name = "iddanhmuc")
	private DanhMucEntity danhMuc;
	
	@ManyToOne
	@JoinColumn(name = "idthuonghieu")
	private ThuongHieuEntity thuongHieu;
	
	@OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
	private List<DanhGiaSanPhamEntity> danhGiaSanPhamEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
	private List<KhuyenMaiSanPhamEntity> khuyenMaiSanPhamEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
	private List<AnhSanPhamEntity> anhSanPhamEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
	private List<BienTheEntity> bienTheEntities = new ArrayList<>();

	@OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
	private List<GiaTriThuocTinhEntity> giaTriThuocTinhEntities = new ArrayList<>();

	@OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
	private List<GioHangChiTietEntity> gioHangChiTietEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
	private List<KhachHangYeuThichSanPhamEntity> khachHangYeuThichSanPhamEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
	private List<ThuocTinhEntity> thuocTinhEntities = new ArrayList<>();

	@OneToMany(mappedBy = "sanPham", fetch = FetchType.LAZY)
	private List<HoaDonChiTietEntity> hoaDonChiTietEntities = new ArrayList<>();
}
