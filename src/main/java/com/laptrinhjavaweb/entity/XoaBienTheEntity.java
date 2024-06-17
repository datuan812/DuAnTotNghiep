package com.laptrinhjavaweb.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "xoabienthe")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class XoaBienTheEntity extends BaseEntity {
    @Column(name = "ten")
    private String ten;

    @Column(name = "anh")
    private String anh;

    @Column(name = "giatribienthe")
    private String giaTriBienThe;

    @Column(name = "soluong")
    private Integer soLuong;

    @Column(name = "giagoc")
    private Double giaGoc;

    @Column(name = "giamua")
    private Double giaMua;

    @Column(name = "makhachhang")
    private String maKhachHang;

    @Column(name = "mahoadon")
    private String maHoaDon;

    @Column(name = "url")
    private String url;
}
