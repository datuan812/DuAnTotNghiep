package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.GioHangEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GioHangRepository extends JpaRepository<GioHangEntity,Long> {

    GioHangEntity findByKhachHang_ma (String ma);
}
