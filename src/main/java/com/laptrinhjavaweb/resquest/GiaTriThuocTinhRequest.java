package com.laptrinhjavaweb.resquest;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GiaTriThuocTinhRequest{

    private Long idThuocTinh;

    private Long idSanPham;

    private String giaTri;

    private String trangThai = "ACTIVE";

    public GiaTriThuocTinhRequest(Long idThuocTinh, Long idSanPham, String giaTri) {
        this.idThuocTinh = idThuocTinh;
        this.idSanPham = idSanPham;
        this.giaTri = giaTri;
    }
}
