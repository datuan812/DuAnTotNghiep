package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "khachhang")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class KhachHangEntity extends BaseEntity{
	
	@Column(name = "ma", unique = true, nullable = false)
	private String ma;
	
	@Column(name = "matkhau")
	private String matKhau;
	
	@Column(name = "ten")
	private String ten;
	
	@Column(name = "sodienthoai", unique = true)
	private String soDienThoai;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "gioitinh")
	private String gioiTinh;
	
	@Column(name = "ngaysinh", columnDefinition = "TIMESTAMP")
	private Date ngaySinh;
	
	@Column(name = "mota")
	private String moTa;

	@Column(name = "expiretime")
	private LocalDateTime expireTime ;

	@Column(name = "resttoken")
	private String restToken;

	@Column(name = "loai")
	private String loai;

	@Column(name = "sodonhuytrongngay")
	private Integer soDonHuyTrongNgay;

	@Column(name = "solanhuydon")
	private Integer soLanHuyDon;

	@Column(name = "songaybiban")
	private Integer soNgayBiBan;

	@OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
	private List<HoaDonEntity> hoaDonEntities  = new ArrayList<>();
	
	@OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
	private List<DanhGiaSanPhamEntity> danhGiaSanPhamEntities = new ArrayList<>();
	
	@OneToOne(mappedBy = "khachHang", fetch = FetchType.LAZY)
	private GioHangEntity gioHangEntities ;

	@OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
	private List<KhachHangYeuThichSanPhamEntity> khachHangYeuThichSanPhamEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
	private List<ThongTinMuaHangEntity> thongTinMuaHangEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
	private List<TichDiemEntity> tichDiemEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
	private List<TimKiemSanPhamEntity> timKiemSanPhamEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
	private List<ViDienTuEntity> viDienTuEntities = new ArrayList<>();

	@OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
	private List<LichSuTichDiemEntity> lichSuTichDiemEntities = new ArrayList<>();
}
