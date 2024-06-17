package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.ChucVuEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChucVuRepository extends JpaRepository<ChucVuEntity, Long> {

    ChucVuEntity findByMa(String ma);

    ChucVuEntity findByTen(String ten);
}
