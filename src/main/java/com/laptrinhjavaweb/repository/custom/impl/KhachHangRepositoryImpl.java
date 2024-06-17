package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.entity.NhanVienEntity;
import com.laptrinhjavaweb.repository.custom.KhachHangRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class KhachHangRepositoryImpl implements KhachHangRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    @Override
    public List<KhachHangEntity> searchs(String param) {
        String sql = "select * from khachhang "
                + " where khachhang.ten LIKE '%" + param
                + "%' OR khachhang.ma LIKE '%" + param
                + "%' OR soDienThoai LIKE '%" + param
                + "%' OR email LIKE '%" + param
                + "%' OR gioiTinh LIKE '%" + param
                + "%' OR moTa LIKE '%" + param
                + "%' AND khachhang.trangthai <> 'INACTIVE'";
        Query query = entityManager.createNativeQuery(sql, KhachHangEntity.class);
        return query.getResultList();
    }
}
