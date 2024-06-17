package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.repository.custom.KhachHangRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface KhachHangRepository extends JpaRepository<KhachHangEntity, Long>, KhachHangRepositoryCustom {

    Page<KhachHangEntity> findAllByTrangThaiNotOrderByNgayTaoDesc(String trangThai, Pageable pageable);

    KhachHangEntity findBySoDienThoaiOrEmailAndTrangThai(String soDienThoai, String email, String trangThai);

    KhachHangEntity findBySoDienThoaiOrEmail(String soDienThoai, String email);

    KhachHangEntity findBySoDienThoai(String soDienThoai);

    KhachHangEntity findByMa(String ma);

    KhachHangEntity findByEmail(String email);

    KhachHangEntity findByRestToken(String restToken);

    List<KhachHangEntity> findAllByMaContainingOrTenContainingOrEmailContainingOrSoDienThoaiContainingOrGioiTinhContainingOrMoTaContainingAndTrangThai(String ma, String ten, String email, String soDienThoai, String gioiTinh, String moTa, String trangThai);

    boolean existsByEmail(String email);
}
