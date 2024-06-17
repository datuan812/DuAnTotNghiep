package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "khuyenmaisanpham")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class KhuyenMaiSanPhamEntity extends BaseEntity{

	@ManyToOne
	@JoinColumn(name = "idkhuyenmai")
	private KhuyenMaiEntity khuyenMai;

	@ManyToOne
	@JoinColumn(name = "idsanpham")
	private SanPhamEntity sanPham;
}
