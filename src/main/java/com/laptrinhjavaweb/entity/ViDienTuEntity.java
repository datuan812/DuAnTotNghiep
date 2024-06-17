package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "vidientu")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ViDienTuEntity extends BaseEntity {
	
	@ManyToOne
	@JoinColumn(name = "idkhachhang")
	private KhachHangEntity khachHang;
	
	@Column(name = "sotien")
	private Double soTien;

	@OneToMany(mappedBy = "viDienTu", fetch = FetchType.LAZY)
	private List<ChiTieuEntity> chiTieuEntities = new ArrayList<>();
}
