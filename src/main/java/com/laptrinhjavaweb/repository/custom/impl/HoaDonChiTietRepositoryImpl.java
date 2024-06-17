package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.DanhMucEntity;
import com.laptrinhjavaweb.entity.HoaDonChiTietEntity;
import com.laptrinhjavaweb.repository.custom.HoaDonChiTietCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.stream.Collectors;

public class HoaDonChiTietRepositoryImpl implements HoaDonChiTietCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void updateWhenUpdateProduct(List<Long> idsBienThe) {
        String idsIn = idsBienThe.stream().map(
                item -> String.valueOf(item)
        ).collect(Collectors.joining(",", "(", ")"));

        String sql = "UPDATE hoadonchitiet JOIN hoadon ON hoadon.id = hoadonchitiet.idhoadon set " +
                "hoadonchitiet.idbienthe = null WHERE hoadon.trangthai <> 'CHOXACNHAN' and hoadon.trangthai <> 'TREO' AND hoadonchitiet.idbienthe IN " + idsIn;
        Query query = entityManager.createNativeQuery(sql, HoaDonChiTietEntity.class);
        query.executeUpdate();
    }

    @Override
    public void deleteWhenUpdateProduct(List<Long> idsBienThe) {
       String idsIn = idsBienThe.stream().map(
               item -> String.valueOf(item)
       ).collect(Collectors.joining(",", "(", ")"));

       String sql = "DELETE hoadonchitiet FROM hoadonchitiet JOIN hoadon ON hoadon.id = hoadonchitiet.idhoadon WHERE hoadon.trangthai = 'TREO' AND hoadonchitiet.idbienthe IN " + idsIn;
       Query query = entityManager.createNativeQuery(sql, HoaDonChiTietEntity.class);
       query.executeUpdate();
    }

    @Override
    public void updateHoaDonChoWhenUpdateProduct(List<Long> idsBienThe) {
        String idsIn = idsBienThe.stream().map(
                item -> String.valueOf(item)
        ).collect(Collectors.joining(",", "(", ")"));

        String sql = "UPDATE hoadonchitiet JOIN hoadon ON hoadon.id = hoadonchitiet.idhoadon JOIN sanpham on sanpham.id = hoadonchitiet.idsanpham set " +
                "hoadonchitiet.idbienthe = null, sanpham.trangthai = 'INACTIVE' WHERE hoadon.trangthai = 'CHOXACNHAN' AND hoadonchitiet.idbienthe IN " + idsIn;
        Query query = entityManager.createNativeQuery(sql, HoaDonChiTietEntity.class);
        query.executeUpdate();
    }

    @Override
    public Integer updateProduct(List<Long> idsBienThe) {
        String idsIn = idsBienThe.stream().map(
                item -> String.valueOf(item)
        ).collect(Collectors.joining(",", "(", ")"));

        String sql = "SELECT hoadonchitiet.* FROM hoadonchitiet JOIN hoadon ON hoadon.id = hoadonchitiet.idhoadon " +
                "WHERE (hoadon.trangthai = 'CHONHANDON' OR hoadon.trangthai = 'TREO') AND hoadonchitiet.idbienthe IN " + idsIn;
        Query query = entityManager.createNativeQuery(sql, HoaDonChiTietEntity.class);
        return query.getResultList().size();
    }
}
