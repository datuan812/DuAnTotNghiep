package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.TichDiemEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TichDiemRepository extends JpaRepository<TichDiemEntity, Long> {

    TichDiemEntity findByKhachHang_ma(String maKhachHang);
}
