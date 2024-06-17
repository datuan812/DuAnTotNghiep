package com.laptrinhjavaweb.resquest;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class QuyDoiDiemRequest {

    private Long id;

    private Double tien;

    private Integer diem;

    private String loai;

    private String trangThai = "ACTIVE";
}
