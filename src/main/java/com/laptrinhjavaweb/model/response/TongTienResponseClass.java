package com.laptrinhjavaweb.model.response;


import com.laptrinhjavaweb.model.response.hoadon.TongTienResponse;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class TongTienResponseClass {
    private Double tongTien;//Giá chưa giảm
    private Double tongTienDaGiam; //Giá đã giảm

    public TongTienResponseClass(TongTienResponse response) {
        this.tongTien = response.getGiaGoc();
        this.tongTienDaGiam = response.getGiaGiam();
    }

    public Double getSoTienGiam(){
        if (tongTienDaGiam==null){
            return null;
        }
        return tongTien-tongTienDaGiam;
    } //Giảm bao nhiêu

    public Double getTongTienThuc(){
        return tongTienDaGiam==null?tongTien:tongTienDaGiam;
    }
}
