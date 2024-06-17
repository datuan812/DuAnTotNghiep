package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.NhanVienEntity;
import com.laptrinhjavaweb.repository.custom.NhanVienRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NhanVienRepository extends JpaRepository<NhanVienEntity, Long>, NhanVienRepositoryCustom {


    Page<NhanVienEntity> findAllByTrangThaiNotAndAndMaNotOrderByNgayTaoDesc(String trangThai, String ma, Pageable pageable);

    NhanVienEntity findByMaAndTrangThai(String ma, String trangThai);

    NhanVienEntity findBySoDienThoaiOrEmailOrCanCuocCongDan(String soDienThoai, String email, String canCuocCongDan);

    NhanVienEntity findByMa(String ma);

    NhanVienEntity findByEmail(String email);

    NhanVienEntity findByRestToken(String restToken);

    boolean existsByEmail(String email);
}
