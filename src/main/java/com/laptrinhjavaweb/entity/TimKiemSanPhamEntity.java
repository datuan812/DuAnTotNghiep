package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "timkiemsanpham")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TimKiemSanPhamEntity extends BaseEntity {

	@Column(name = "timkiem")
	private String timKiem;
	
	@ManyToOne
	@JoinColumn(name = "idkhachhang")
	private KhachHangEntity khachHang;
}
