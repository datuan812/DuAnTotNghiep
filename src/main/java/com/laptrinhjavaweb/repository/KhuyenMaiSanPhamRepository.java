package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.KhuyenMaiSanPhamEntity;
import com.laptrinhjavaweb.repository.custom.KhuyenMaiSanPhamRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhuyenMaiSanPhamRepository extends JpaRepository<KhuyenMaiSanPhamEntity, Long>, KhuyenMaiSanPhamRepositoryCustom {

    KhuyenMaiSanPhamEntity findBySanPham_idAndTrangThaiOrSanPham_idAndTrangThai(Long idSanPham, String trangThai1,
                                                                                Long idSanPham2, String trangThai2);
    List<KhuyenMaiSanPhamEntity> findAllByKhuyenMai_id(Long idkm);

    List<KhuyenMaiSanPhamEntity> findAllByTrangThaiOrderByNgayTao(String trangThai);

    Page<KhuyenMaiSanPhamEntity> findAllByTrangThaiOrderByNgayTaoDesc(String active, Pageable pageable);
}
