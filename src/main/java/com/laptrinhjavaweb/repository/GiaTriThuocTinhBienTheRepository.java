package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.GiaTriThuocTinhBienTheEntity;
import com.laptrinhjavaweb.repository.custom.GiaTriThuocTinhBienTheRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GiaTriThuocTinhBienTheRepository extends JpaRepository<GiaTriThuocTinhBienTheEntity, Long>, GiaTriThuocTinhBienTheRepositoryCustom {

    @Modifying
    @Query("delete from GiaTriThuocTinhBienTheEntity g where g.bienThe.id in ?1")
    void deleteByBienThe_IdIn (List<Long> idsBienThe);
}
