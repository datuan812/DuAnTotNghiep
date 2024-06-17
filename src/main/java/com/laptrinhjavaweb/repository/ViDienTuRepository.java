package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.ViDienTuEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ViDienTuRepository extends JpaRepository<ViDienTuEntity, Long> {
    @Query(value = "select * from ViDienTu where idkhachhang = ?1", nativeQuery = true)
    ViDienTuEntity findByKhachHang(Long id);

    ViDienTuEntity findByKhachHang_ma(String maKhachHang);
}
