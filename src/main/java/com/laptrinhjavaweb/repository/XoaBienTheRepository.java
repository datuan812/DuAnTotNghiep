package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.XoaBienTheEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface XoaBienTheRepository extends JpaRepository<XoaBienTheEntity, Long> {

    List<XoaBienTheEntity> findAllByMaKhachHang(String maKhachHang);

    List<XoaBienTheEntity> findAllByMaHoaDon (String maHoaDon);
}
