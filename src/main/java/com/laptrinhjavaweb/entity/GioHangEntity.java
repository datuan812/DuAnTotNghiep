package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "giohang")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GioHangEntity extends BaseEntity{

	@OneToOne
	@JoinColumn(name = "idkhachhang")
	private KhachHangEntity khachHang;
	
	@OneToMany(mappedBy = "gioHang", fetch = FetchType.LAZY)
	private List<GioHangChiTietEntity> gioHangChiTietEntities = new ArrayList<>();
}
