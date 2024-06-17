package com.laptrinhjavaweb.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ThuocTinhResponse {

	private Long id;

	private String ten;

	private String slug;
	
	private List<GiaTriThuocTinhResponse> giaTriThuocTinh;
}
