package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "khuyenmai")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class KhuyenMaiEntity extends BaseEntity {

	@Column(name = "ma", unique = true)
	private String ma;
	
	@Column(name = "ten")
	private String ten;
	
	@Column(name = "loai")
	private String loai;
	
	@Column(name = "giatri")
	private Double giaTri;
	
	@Column(name = "mota", columnDefinition = "TEXT")
	private String moTa;
	
	@Column(name = "ngaybatdau", columnDefinition = "TIMESTAMP")
	private Date ngayBatDau;
	
	@Column(name = "ngayketthuc", columnDefinition = "TIMESTAMP")
	private Date ngayKetThuc;
	
	@Column(name = "soluong")
	private Integer soLuong;
	
	@Column(name = "tong")
	private Integer tong;
	
	@OneToMany(mappedBy = "khuyenMai", fetch = FetchType.LAZY)
	private List<KhuyenMaiSanPhamEntity> khuyenMaiSanPhamEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "khuyenMai", fetch = FetchType.LAZY)
	private List<HoaDonChiTietEntity> hoaDonChiTietEntities = new ArrayList<>();


}
