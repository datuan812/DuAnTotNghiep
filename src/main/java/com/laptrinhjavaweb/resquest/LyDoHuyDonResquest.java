package com.laptrinhjavaweb.resquest;


import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class LyDoHuyDonResquest {

    private Long id;

    private String lyDo;

    private String trangThai = "ACTIVE";
}
