package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "giatrithuoctinh")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GiaTriThuocTinhEntity extends BaseEntity{

	@Column(name = "giatri")
	private String giaTri;
	
	@ManyToOne
	@JoinColumn(name = "idsanpham")
	private SanPhamEntity sanPham;
	
	@ManyToOne
	@JoinColumn(name = "idthuoctinh")
	private ThuocTinhEntity thuocTinh;	
	
	@OneToMany(mappedBy = "giaTriThuocTinh", fetch = FetchType.LAZY)
	private List<GiaTriThuocTinhBienTheEntity> giaTriThuocTinhBienTheEntities = new ArrayList<>();
}
