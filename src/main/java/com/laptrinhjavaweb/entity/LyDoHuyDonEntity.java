package com.laptrinhjavaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "lydohuydon")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LyDoHuyDonEntity extends BaseEntity{

	@Column(name = "lydo", columnDefinition = "TEXT")
	private String lyDo;
	
	@Column(name = "mota", columnDefinition = "TEXT")
	private String moTa;
	
	@OneToMany(mappedBy = "lyDoHuyDon", fetch = FetchType.LAZY)
	private List<HoaDonEntity> hoaDonEntities  = new ArrayList<>();
}
