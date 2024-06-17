package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "danhmuc")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DanhMucEntity extends BaseEntity {

	@Column(name = "slug", unique = true)
	private String slug;

	@Column(name = "ten")
	private String ten;

	@Column(name = "hienthi")
	private Integer hienThi;

	@OneToMany(mappedBy = "danhMuc", fetch = FetchType.LAZY)
	private List<SanPhamEntity> sanPhamEntities = new ArrayList<>();
}
