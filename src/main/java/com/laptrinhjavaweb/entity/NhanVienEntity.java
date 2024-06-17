package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "nhanvien")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NhanVienEntity extends BaseEntity{
	
	@Column(name = "ma" , unique = true, nullable = false)
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
	
	@Column(name = "anh")
	private String anh;
	
	@Column(name = "diachi", columnDefinition = "nvarchar(255)")
	private String diaChi;
	
	@Column(name = "cancuoccongdan", columnDefinition = "char(12)")
	private String canCuocCongDan;
	
	@Column(name = "ngaycap", columnDefinition = "TIMESTAMP")
	private Date ngayCap;
	
	@Column(name = "expiretime")
	private LocalDateTime expireTime ;

	@Column(name = "resttoken")
	private String restToken;
	
	@ManyToOne
	@JoinColumn(name = "idchucvu")
	private ChucVuEntity chucVu;
	
	@OneToMany(mappedBy = "nhanVien", fetch = FetchType.LAZY)
	private List<CaLamEntity> caLamEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "nhanVien", fetch = FetchType.LAZY)
	private List<HoaDonEntity> hoaDonEntities  = new ArrayList<>();
}
