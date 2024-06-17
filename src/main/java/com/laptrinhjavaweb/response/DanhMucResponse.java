package com.laptrinhjavaweb.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DanhMucResponse {

	private Long id;
	
	private String slug;
	
	private String ten;

	private String trangThai;
}
