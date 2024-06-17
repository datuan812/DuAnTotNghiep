package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "chucvu")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChucVuEntity extends BaseEntity {
	@Column(name = "ma", nullable = false)
	private String ma;
	
	@Column(name = "ten")
	private String ten;
	
	@OneToMany(mappedBy = "chucVu", fetch = FetchType.LAZY)
	private List<NhanVienEntity> nhanVienEntities = new ArrayList<>();
}
