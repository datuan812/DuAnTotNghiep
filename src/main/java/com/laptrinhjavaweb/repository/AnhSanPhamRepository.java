package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.AnhSanPhamEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AnhSanPhamRepository extends JpaRepository<AnhSanPhamEntity, Long> {

    void deleteAllBySanPham_Id (Long idSanPham);
}
