package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.CaLamEntity;
import com.laptrinhjavaweb.repository.custom.CaLamRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Repository
public class CaLamRepositoryImpl implements CaLamRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public CaLamEntity findByCurrentDateAndMaNhanVien(String ngay, String maNhanVien) {
        String sql = "SELECT calam.* FROM calam JOIN nhanvien on calam.idnhanvien = nhanvien.id " +
                "WHERE DATE(calam.ngaytao) = '" + ngay  + "' AND nhanvien.ma = '" + maNhanVien + "' ORDER BY ngaytao DESC";
        Query query = entityManager.createNativeQuery(sql, CaLamEntity.class);
        return (CaLamEntity) query.getResultList().get(0);
    }
}
