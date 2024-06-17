package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.DanhMucEntity;
import com.laptrinhjavaweb.repository.custom.DanhMucRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class DanhMucRepositoryImpl implements DanhMucRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    @Override
    public List<DanhMucEntity> searchs(String param) {
        String sql = "select * from danhmuc "
                + " where danhmuc.ten LIKE '%" + param
                + "%' AND danhmuc.trangthai <> 'INACTIVE'";
        Query query = entityManager.createNativeQuery(sql, DanhMucEntity.class);
        return query.getResultList();
    }
}
