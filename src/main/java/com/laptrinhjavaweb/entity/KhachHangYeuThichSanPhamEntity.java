package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
@Entity
@Table(name = "khachhangyeuthichsanpham")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class KhachHangYeuThichSanPhamEntity extends BaseEntity{

	@ManyToOne
	@JoinColumn(name = "idkhachhang")
	private KhachHangEntity khachHang;
	
	@ManyToOne
	@JoinColumn(name = "idsanpham")
	private SanPhamEntity sanPham;
}
