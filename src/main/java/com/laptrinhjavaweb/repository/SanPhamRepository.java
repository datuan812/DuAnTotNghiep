package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.SanPhamEntity;
import com.laptrinhjavaweb.repository.custom.SanPhamRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SanPhamRepository extends JpaRepository<SanPhamEntity, Long>, SanPhamRepositoryCustom{

	SanPhamEntity findBySlug(String slug);

	List<SanPhamEntity> findByDanhMuc_slugAndTrangThai(String slug, String trangThai);

	Page<SanPhamEntity> findByTrangThaiOrderByNgayTaoDesc(String trangThai, Pageable pageable);

	Page<SanPhamEntity> findAllByOrderByNgayTaoDesc(Pageable pageable);
}
