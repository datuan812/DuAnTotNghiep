package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.KhuyenMaiSanPhamEntity;
import com.laptrinhjavaweb.repository.custom.KhuyenMaiSanPhamRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

public class KhuyenMaiSanPhamRepositoryImpl implements KhuyenMaiSanPhamRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<KhuyenMaiSanPhamEntity> seachs(String param) {
        String sql = "SELECT kmsp.* FROM khuyenmaisanpham kmsp " +
                "JOIN sanpham sp ON kmsp.idsanpham = sp.id " +
                "WHERE sp.ten LIKE :param OR sp.slug LIKE :param " +
                "GROUP BY kmsp.idkhuyenmai " +
                "ORDER BY kmsp.ngaytao DESC";

        Query query = entityManager.createNativeQuery(sql, KhuyenMaiSanPhamEntity.class);
        query.setParameter("param", "%" + param + "%");
        return query.getResultList();
    }

    @Override
    public List<KhuyenMaiSanPhamEntity> allActivate() {
        String sql = "SELECT kmsp.* FROM khuyenmaisanpham kmsp " +
                "JOIN sanpham sp ON kmsp.idsanpham = sp.id " +
                "WHERE kmsp.trangthai = 'ACTIVE' AND sp.trangthai = 'ACTIVE' " +
                "ORDER BY kmsp.ngaytao DESC";

        Query query = entityManager.createNativeQuery(sql, KhuyenMaiSanPhamEntity.class);
        return query.getResultList();
    }
}
