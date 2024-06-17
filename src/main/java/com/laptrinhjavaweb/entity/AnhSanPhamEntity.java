package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
@Entity
@Table(name = "anhsanpham")
@Getter @Setter
@AllArgsConstructor @NoArgsConstructor
public class AnhSanPhamEntity extends BaseEntity{

	@Column(name = "hinhanh")
	private String hinhAnh;
	
	@ManyToOne
	@JoinColumn(name = "idsanpham")
	private SanPhamEntity sanPham;
}
