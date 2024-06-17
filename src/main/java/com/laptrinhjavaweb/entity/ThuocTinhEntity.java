package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;
@Entity
@Table(name = "thuoctinh")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ThuocTinhEntity extends BaseEntity{
	
	@Column(name = "slug")
	private String slug;
	
	@Column(name = "ten")
	private String ten;
	
	@ManyToOne
	@JoinColumn(name = "idsanpham")
	private SanPhamEntity sanPham;
	
	@OneToMany(mappedBy = "thuocTinh")
	private List<GiaTriThuocTinhEntity> giaTriThuocTinhEntities = new ArrayList<>();
}
