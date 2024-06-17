package com.laptrinhjavaweb.repository;

import java.util.List;

import com.laptrinhjavaweb.converter.ThuocTinhConverter;
import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.ThuocTinhEntity;
import com.laptrinhjavaweb.repository.custom.ThuocTinhRepositoryCustom;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ThuocTinhRepository extends JpaRepository<ThuocTinhEntity, Long>, ThuocTinhRepositoryCustom {

	List<ThuocTinhEntity> findTop5BySlug(String slug);

	@Modifying
	@Query("delete from ThuocTinhEntity t where t.sanPham.id=:idSanPham")
	void deleteAllBySanPham_Id (@Param("idSanPham") Long idSanPham);

	ThuocTinhEntity findByTenAndSanPham_Id (String name, Long idSanPham);
}
