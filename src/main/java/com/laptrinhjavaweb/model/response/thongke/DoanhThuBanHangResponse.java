package com.laptrinhjavaweb.model.response.thongke;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.poi.hpsf.Decimal;

import javax.persistence.Entity;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;
import java.math.BigDecimal;

//@NamedStoredProcedureQuery(name = "HoaDon",
//        procedureName = "SP_ThongKe", parameters = {
//        @StoredProcedureParameter(mode = ParameterMode.IN, name = "selectType", type = Integer.class),
//        @StoredProcedureParameter(mode = ParameterMode.OUT, name = "doanhThuOnline", type = Decimal.class),
//        @StoredProcedureParameter(mode = ParameterMode.OUT, name = "doanhThuOffline", type = Decimal.class),
//        @StoredProcedureParameter(mode = ParameterMode.OUT, name = "tongSoSanPhamDaBan", type = Long.class),
//        @StoredProcedureParameter(mode = ParameterMode.OUT, name = "soLuongKhuyenMaiDaBan", type = Long.class)
//})
//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
public interface DoanhThuBanHangResponse {
     BigDecimal getDoanhThuOnline();
     BigDecimal getDoanhThuOffline();
     Long getTongSoSanPhamDaBan();
     Long getSoLuongKhuyenMaiDaBan();

    // Getters and setters
}
