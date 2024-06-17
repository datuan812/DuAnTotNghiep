package com.laptrinhjavaweb.model.response.thongke;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class QueryDoanhThu {

    private String queryDoanhThu;
    public QueryDoanhThu(Integer loai) {
        if (loai==1){
            queryDoanhThu=doanhThuNgay();
        }else {
            queryDoanhThu= doanhThuNgay();
        }
    }

    private String doanhThuNgay(){
        return " SELECT \n" +
                "                SUM(CASE WHEN loai = 'Online' THEN tongtienhang ELSE 0 END) AS doanhThuOnline,\n" +
                "                SUM(CASE WHEN loai = 'Ofline' THEN tongtienhang ELSE 0 END) AS doanhThuOffline,\n" +
                "                sum(hdct.soluong) as tongSoSanPhamDaBan,\n" +
                "                sum(case when hdct.idkhuyenmai is not null then 1 else 0 end) as soLuongKhuyenMaiDaBan\n" +
                "            FROM hoadon hd join hoadonchitiet hdct on hdct.idhoadon = hd.id\n" +
                "            WHERE DATE(ngaydat) = CURDATE()";
    }
    private String doanhThuTuan(){
        return "SELECT \n" +
                "                SUM(CASE WHEN loai = 'Online' THEN tongtienhang ELSE 0 END) AS doanhThuOnline,\n" +
                "                SUM(CASE WHEN loai = 'Ofline' THEN tongtienhang ELSE 0 END) AS doanhThuOffline,\n" +
                " sum(hdct.soluong) as tongSoSanPhamDaBan,\n" +
                "                sum(case when hdct.idkhuyenmai is not null then 1 else 0 end) as soLuongKhuyenMaiDaBan\n" +
                "            FROM hoadon hd join hoadonchitiet hdct on hdct.idhoadon = hd.id\n" +
                "            WHERE YEARWEEK(ngaydat) = YEARWEEK(CURDATE()) and YEAR(ngaydat) = YEAR(CURDATE())";
    }
    private String doanhThuThang(){
        return " SELECT \n" +
                "                SUM(CASE WHEN loai = 'Online' THEN tongtienhang ELSE 0 END) AS doanhThuOnline,\n" +
                "                SUM(CASE WHEN loai = 'Ofline' THEN tongtienhang ELSE 0 END) AS doanhThuOffline,\n" +
                " sum(hdct.soluong) as tongSoSanPhamDaBan,\n" +
                "                sum(case when hdct.idkhuyenmai is not null then 1 else 0 end) as soLuongKhuyenMaiDaBan\n" +
                "            FROM hoadon hd join hoadonchitiet hdct on hdct.idhoadon = hd.id\n" +
                "            WHERE YEAR(ngaydat) = YEAR(CURDATE()) AND MONTH(ngaydat) = MONTH(CURDATE())";
    }
}
