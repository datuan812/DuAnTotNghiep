package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "chitieu")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChiTieuEntity extends BaseEntity{
	
	@Column(name = "sotien")
	private Double soTien;
	
	@Column(name = "loaichitieu")
	private Integer loaiChiTieu;
	
	@ManyToOne
	@JoinColumn(name = "idvidientu")
	private ViDienTuEntity viDienTu;
}
