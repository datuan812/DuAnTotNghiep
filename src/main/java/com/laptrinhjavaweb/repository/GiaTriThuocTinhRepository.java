package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.GiaTriThuocTinhEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface GiaTriThuocTinhRepository extends JpaRepository<GiaTriThuocTinhEntity, Long> {

    @Modifying
    @Query("delete from GiaTriThuocTinhEntity g where g.sanPham.id=:idSanPham")
    void deleteAllBySanPham_Id (@Param("idSanPham") Long idSanPham);

    GiaTriThuocTinhEntity findByGiaTriAndSanPham_Id (String giaTri, Long idSanPham);

    void deleteByIdIn(List<Long> ids);
}
