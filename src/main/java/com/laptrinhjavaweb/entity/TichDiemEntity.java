package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "tichdiem")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TichDiemEntity extends BaseEntity{
	
	@ManyToOne
	@JoinColumn(name = "idkhachhang")
	private KhachHangEntity khachHang;
	
	@Column(name = "sodiem")
	private Integer soDiem;
}
