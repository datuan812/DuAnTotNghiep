package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
@Entity
@Table(name = "bienthe")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BienTheEntity extends BaseEntity{
	
	@Column(name = "ma", unique = true)
	private String ma;

	@Column(name = "ten")
	private String ten;
	
	@Column(name = "gia")
	private Double gia;
	
	@Column(name = "hinhanh")
	private String hinhAnh;
	
	@Column(name = "soluong")
	private Integer soLuong;
	
	@ManyToOne
	@JoinColumn(name = "idsanpham")
	private SanPhamEntity sanPham;

	@OneToMany(mappedBy = "bienThe", fetch = FetchType.LAZY)
	private List<GiaTriThuocTinhBienTheEntity> giaTriThuocTinhBienTheEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "bienThe", fetch = FetchType.LAZY)
	private List<HoaDonChiTietEntity> hoaDonChiTietEntities = new ArrayList<>();
}
