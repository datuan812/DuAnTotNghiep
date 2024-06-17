package com.laptrinhjavaweb.resquest;


import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ThuongHieuRequest {

    private Long id;

    private String slug;

    private String ten;

    private String trangThai = "ACTIVE";
}
