package com.laptrinhjavaweb.support.supportgiaohang;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class PhiGiaoHang {

    private Double main_service;//Phí ship

    private Double insurance;//Phí bảo hiểm khi giao hàng lỗi
}
