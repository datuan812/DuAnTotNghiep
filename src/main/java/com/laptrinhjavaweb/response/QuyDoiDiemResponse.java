package com.laptrinhjavaweb.response;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class QuyDoiDiemResponse {

    private Long id;

    private Double tien;

    private Integer diem;

    private String loai;
}
