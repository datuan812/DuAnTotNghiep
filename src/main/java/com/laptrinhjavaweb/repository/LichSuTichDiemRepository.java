package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.LichSuTichDiemEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LichSuTichDiemRepository extends JpaRepository<LichSuTichDiemEntity, Long> {

    List<LichSuTichDiemEntity> findAllByOrderByNgayTaoDesc();

    List<LichSuTichDiemEntity> findAllByKhachHang_idOrderByNgayTaoDesc(Long idKhachHang);

    LichSuTichDiemEntity findByHoaDon_maAndTrangThai(String maHoaDon, String trangThai);
}
