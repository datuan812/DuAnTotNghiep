package com.laptrinhjavaweb.model.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class DiaChiGiaoHangRequest {

    private String tenNguoiNhan;
    private String soDienThoai;
    private Integer idThanhPho;
    private Integer idHuyen;
    private Integer idXa;
    private String soNha;
    private String diaChi;
    private Boolean macDinh;
}
