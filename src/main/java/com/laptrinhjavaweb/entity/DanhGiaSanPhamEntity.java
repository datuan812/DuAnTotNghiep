package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "danhgiasanpham")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DanhGiaSanPhamEntity extends BaseEntity {
	
	@Column(name = "sosao")
	private Integer soSao;
	
	@Column(name = "noidung", columnDefinition = "TEXT")
	private String noiDung;

	@ManyToOne
	@JoinColumn(name = "idsanpham")
	private SanPhamEntity sanPham;
	
	@ManyToOne
	@JoinColumn(name = "idkhachhang")
	private KhachHangEntity khachHang;
}
