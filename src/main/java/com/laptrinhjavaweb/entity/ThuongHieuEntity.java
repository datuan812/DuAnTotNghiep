package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "thuonghieu")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ThuongHieuEntity extends BaseEntity{

	@Column(name = "slug", unique = true)
	private String slug;
	
	@Column(name = "ten")
	private String ten;
	
	@OneToMany(mappedBy = "thuongHieu", fetch = FetchType.LAZY)
	private List<SanPhamEntity> sanPhamEntities = new ArrayList<>();
}
