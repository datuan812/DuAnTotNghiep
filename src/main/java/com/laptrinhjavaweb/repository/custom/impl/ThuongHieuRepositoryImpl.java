package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.ThuongHieuEntity;
import com.laptrinhjavaweb.repository.custom.ThuongHieuRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class ThuongHieuRepositoryImpl implements ThuongHieuRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    @Override
    public List<ThuongHieuEntity> searchs(String param) {
        String sql = "select * from thuonghieu "
                + " where thuonghieu.ten LIKE '%" + param
                + "%' AND thuonghieu.trangthai <> 'INACTIVE'";
        Query query = entityManager.createNativeQuery(sql, ThuongHieuEntity.class);
        return query.getResultList();
    }
}
