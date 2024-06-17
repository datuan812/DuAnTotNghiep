package com.laptrinhjavaweb.resquest;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class KhuyenMaiSanPhamRequest{

    KhuyenMaiRequest khuyenMaiRequest;

    List<String> listSanPham;

    private String trangThai = "ACTIVE";
}
