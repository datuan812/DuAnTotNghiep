package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.DanhMucEntity;
import com.laptrinhjavaweb.entity.ThuongHieuEntity;
import com.laptrinhjavaweb.repository.custom.ThuongHieuRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ThuongHieuRepository extends JpaRepository<ThuongHieuEntity, Long>, ThuongHieuRepositoryCustom {
	
	ThuongHieuEntity findBySlug(String slug);

	List<ThuongHieuEntity> findAllByTrangThai(String trangThai);

	Page<ThuongHieuEntity> findAllByTrangThaiNotOrderByNgayTaoDesc(String trangThai, Pageable pageable);
}
