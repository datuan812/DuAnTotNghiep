package com.laptrinhjavaweb.model.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class ThongTinNhanHangRequest {

    private Long idkh;
    private Long ttgh;
    private Double phiship;
    private String luuy;
    private String idVi;
    private Double tongTien;
}
