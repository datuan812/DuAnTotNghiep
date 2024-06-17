package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.QuyDoiDiemEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuyDoiDiemRepository extends JpaRepository<QuyDoiDiemEntity, Long> {

    QuyDoiDiemEntity findByLoai(String loai);
}
