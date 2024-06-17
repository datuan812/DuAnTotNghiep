package com.laptrinhjavaweb.repository.custom.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.repository.custom.ThuocTinhRepositoryCustom;

@Repository
public class ThuocTinhRepositoryImpl implements ThuocTinhRepositoryCustom{

	@PersistenceContext
	private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> findAllDistinctSlug() {
		Query query = entityManager.createNativeQuery("select distinct slug from thuoctinh");
		return query.getResultList();
	}
}
