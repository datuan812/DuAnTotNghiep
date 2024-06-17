package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "giatrithuoctinhbienthe")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GiaTriThuocTinhBienTheEntity extends BaseEntity {

	@ManyToOne
	@JoinColumn(name = "idgiatrithuoctinh")
	private GiaTriThuocTinhEntity giaTriThuocTinh;
	
	@ManyToOne
	@JoinColumn(name = "idbienthe")
	private BienTheEntity bienThe;
}
