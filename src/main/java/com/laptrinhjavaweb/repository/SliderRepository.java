package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.entity.SliderEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SliderRepository extends JpaRepository<SliderEntity, Long> {

    SliderEntity findByImage(String image);

    Page<SliderEntity> findAllByTrangThaiNotOrderByNgayTaoDesc(String trangThai, Pageable pageable);
}
