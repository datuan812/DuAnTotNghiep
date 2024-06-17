package com.laptrinhjavaweb.resquest;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DanhMucRequest{

    private Long id;

    private String slug;

    private String ten;

    private String trangThai = "ACTIVE";
}
