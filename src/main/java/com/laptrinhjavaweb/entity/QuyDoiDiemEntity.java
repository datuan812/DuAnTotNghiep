package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "quydoidiem")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QuyDoiDiemEntity extends BaseEntity{

	@Column(name = "tien")
	private Double tien;
	
	@Column(name = "diem")
	private Integer diem;
	
	@Column(name = "loai")
	private String loai;
}
