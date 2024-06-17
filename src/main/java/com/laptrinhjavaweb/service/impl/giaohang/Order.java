package com.laptrinhjavaweb.service.impl.giaohang;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Order {

    private double price;
    private String currency;
    private String method;
    private String intent;
    private String description;
    private String idkh;
    private Long idttmuahang;

    private Double phiShip;
    private Double tienKhachTra;
    private String mota;
    private Long idhd;

    public void convertVnd(Double tien){
        price = tien/23000;
    }
}