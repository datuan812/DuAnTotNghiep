package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.NhanVienEntity;
import com.laptrinhjavaweb.repository.custom.NhanVienRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class NhanVienRepositoryImpl implements NhanVienRepositoryCustom{

	@PersistenceContext
	private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<NhanVienEntity> searchs(String param, String maTK) {
		String sql = "select nhanvien.* from nhanvien join chucvu on nhanvien.idchucvu = chucvu.id"
				+ " where (nhanvien.ten LIKE '%" + param
				+ "%' OR nhanvien.ma LIKE '%" + param
				+ "%' OR sodienthoai LIKE '%" + param
				+ "%' OR email LIKE '%" + param
				+ "%' OR chucvu.ma LIKE '%" + param
				+ "%' OR chucvu.ten LIKE '%" + param
				+ "%'" + ")" +  "AND nhanvien.trangthai <> 'DELETE' AND nhanvien.ma not in ( '"+maTK+"')";
		Query query = entityManager.createNativeQuery(sql, NhanVienEntity.class);
		return query.getResultList();
	}

}
