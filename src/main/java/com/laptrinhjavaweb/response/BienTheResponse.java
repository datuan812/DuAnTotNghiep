package com.laptrinhjavaweb.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BienTheResponse {
	
	private Long id;

	private Double gia;

	private String ten;
	
	private String hinhAnh;
	
	private Integer soLuong;

	private Double giaBan;

	private KhuyenMaiHienThiResponse khuyenMaiHienThiResponse;
}
