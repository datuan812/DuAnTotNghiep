package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.BienTheEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BienTheRepository extends JpaRepository<BienTheEntity, Long>{

    @Modifying
    @Query("delete from BienTheEntity b where b.sanPham.id=:idSanPham")
    void deleteAllBySanPham_Id (@Param("idSanPham") Long idSanPham);

    BienTheEntity findByTenAndSanPham_Id (String ten, Long id);

    void deleteByIdIn (List<Long> id);
}
