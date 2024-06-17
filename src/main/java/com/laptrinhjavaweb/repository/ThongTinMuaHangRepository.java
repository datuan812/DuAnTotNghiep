package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.ThongTinMuaHangEntity;
import com.laptrinhjavaweb.model.response.ThongTinMuaHangResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface ThongTinMuaHangRepository extends JpaRepository<ThongTinMuaHangEntity,Long> {

    @Query("select tt from ThongTinMuaHangEntity tt where tt.khachHang.id=:idkh and tt.trangThai =:trangthai")
    ThongTinMuaHangResponse getTTMuaHangByIdKHAndTrangThai(@Param("idkh") Long idkh, @Param("trangthai")String trangThai);

    @Query("select tt from ThongTinMuaHangEntity tt where tt.khachHang.id=:idkh and tt.trangThai <> 'DELETE'")
    List<ThongTinMuaHangResponse> dsThongTinMuaHangByIdKhachHang(@Param("idkh") Long idkh);
    @Modifying
    @Transactional
    @Query("update ThongTinMuaHangEntity tt set tt.trangThai='ACTIVE' " +
            "where tt.khachHang.id=:idkh and tt.trangThai <> 'DELETE'")
    void updateTrangThaiThongTinMuaHang(@Param("idkh") Long idkh);

    @Query("select tt from ThongTinMuaHangEntity tt where tt.id =:idtt")
    ThongTinMuaHangResponse getThongTinMuaHangByIdTT(@Param("idtt")Long idThongTinMuaHang);
    @Query(value = "update thongtinmuahang set trangthai = 'DEFAULT' WHERE id =:idtt",nativeQuery = true)
    @Modifying
    void setDefault(@Param("idtt")Long idtt);
}
