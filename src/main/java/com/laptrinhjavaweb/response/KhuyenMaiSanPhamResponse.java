package com.laptrinhjavaweb.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class KhuyenMaiSanPhamResponse {
    private Long id;
    private SanPhamResponse sanPhamResponse;
    private String trangThai;
}
