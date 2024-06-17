package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.KhuyenMaiEntity;
import com.laptrinhjavaweb.repository.custom.KhuyenMaiRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Map;

public class KhuyenMaiRepositoryImpl implements KhuyenMaiRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    @Override
    public List<KhuyenMaiEntity> seachs(String param) {
        String sql = "FROM KhuyenMaiEntity WHERE ten LIKE '%" + param + "%' OR ma LIKE '%" + param
                + "%' ORDER BY ngaytao DESC";
        Query query = entityManager.createQuery(sql, KhuyenMaiEntity.class);
        return query.getResultList();
    }
    @SuppressWarnings("unchecked")
    @Override
    public List<Long> filters(Map<String, Object> params) {
        return null;
    }
}
