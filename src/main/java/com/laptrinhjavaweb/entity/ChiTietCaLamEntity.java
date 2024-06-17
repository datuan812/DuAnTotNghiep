package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
@Entity
@Table(name = "chitietcalam")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChiTietCaLamEntity extends BaseEntity {

	@ManyToOne
	@JoinColumn(name = "idcalam")
	private CaLamEntity caLam;

	@ManyToOne
	@JoinColumn(name = "idhoadon")
	private HoaDonEntity hoaDon;

}
