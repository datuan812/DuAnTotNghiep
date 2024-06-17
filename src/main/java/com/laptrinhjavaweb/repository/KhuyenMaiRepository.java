package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.KhuyenMaiEntity;
import com.laptrinhjavaweb.repository.custom.KhuyenMaiRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhuyenMaiRepository extends JpaRepository<KhuyenMaiEntity, Long>, KhuyenMaiRepositoryCustom {

    KhuyenMaiEntity findByMa(String ma);

    @Query("SELECT km FROM KhuyenMaiEntity km ORDER BY km.ngayTao DESC")
    List<KhuyenMaiEntity> findAllByTrangThai(String active);

    @Query("SELECT km FROM KhuyenMaiEntity km ORDER BY km.ngayTao DESC")
    Page<KhuyenMaiEntity> findAllByTrangThai(String active, Pageable pageable);

    @Query(value = "SELECT sum(soluong) as soluongsudung, sum(thanhtien) as sotienthuduoc, sum(sotiengiam) as sotiengiam FROM hoadonchitiet WHERE idkhuyenmai = :id", nativeQuery = true)
    List<Object[]> thongKeKM(@Param("id") Long id);



}
