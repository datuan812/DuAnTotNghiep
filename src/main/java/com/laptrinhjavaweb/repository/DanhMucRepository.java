package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.DanhMucEntity;
import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.repository.custom.DanhMucRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DanhMucRepository extends JpaRepository<DanhMucEntity, Long>, DanhMucRepositoryCustom {
	
	DanhMucEntity findBySlug(String slug);

	List<DanhMucEntity> findAllByTrangThai(String trangThai);

	Page<DanhMucEntity> findAllByTrangThaiNotOrderByNgayTaoDesc(String trangThai, Pageable pageable);

}
