package com.laptrinhjavaweb.model.request;

import com.laptrinhjavaweb.entity.HoaDonEntity;
import com.laptrinhjavaweb.support.supportgiaohang.SanPhamGhnApi;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.apache.commons.lang3.ArrayUtils;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class ThongTinDatHangRequest {
    // 1: Người bán/Người gửi.
    // 2: Người mua/Người nhận.

    private Long payment_type_id;     // Loại thanh toán

    public void setNguoiThanhToan(String nguoiThanhToan){
        if (nguoiThanhToan.equals("CUAHANG")){
            payment_type_id=1L;
        }else{
            payment_type_id=2L;
        }
    }
    private String note;             // Ghi chú

    // CHOTHUHANG, CHOXEMHANGKHONGTHU, KHONGCHOXEMHANG
    private String required_note;    // Ghi chú yêu cầu
    private String client_order_code; // Mã đơn hàng riêng của khách hàng.

    private String from_name;        // Tên người gửi
    private String from_phone;       // Số điện thoại người gửi
    private String from_address;     // Địa chỉ người gửi
    private String from_ward_name;   // Tên phường/ngõ người gửi
    private String from_district_name; // Tên quận/huyện người gửi
    private String from_province_name; // Tên tỉnh/thành phố người gửi
    public void setDiaChiNguoiGui(String diaChi){
        String[] arrDiaChi = diaChi.split(", ");
        ArrayUtils.reverse(arrDiaChi);

        from_province_name= arrDiaChi[1];
        from_district_name= arrDiaChi[2];
        from_ward_name= arrDiaChi[3];
        from_address = diaChi;
    }

    private String to_name;          // Tên người nhận
    private String to_phone;         // Số điện thoại người nhận
    private String to_address;       // Địa chỉ người nhận
    private String to_ward_name;     // Tên phường/ngõ người nhận
    private String to_district_name; // Tên quận/huyện người nhận
    private String to_province_name; // Tên tỉnh/thành phố người nhận



    public void setNguoiNhan(String diaChi,String soDienThoai,String tenNguoiNhan){
        String[] arrDiaChi = diaChi.split(", ");
        ArrayUtils.reverse(arrDiaChi);

        to_province_name= arrDiaChi[1];
        to_district_name= arrDiaChi[2];
        to_ward_name= arrDiaChi[3];
        to_phone = soDienThoai;
        to_name= tenNguoiNhan;
        to_address = diaChi;
    }



    private Long cod_amount;         // Số tiền thu hộ
    public void setTienThuHo(HoaDonEntity hoaDon){
        if (hoaDon.getPhuongThucThanhToan()==null||hoaDon.getLoaiThanhToan()){
            cod_amount = 0L;
            payment_type_id=1L;
        }else {
            cod_amount = hoaDon.getTongTienHang().longValue();
            payment_type_id=2L;
        }
    }
    public void setSoTienThuHo(Long soTienThuHo){
        cod_amount = soTienThuHo;
    };
    private String content;          // Nội dung đơn hàng
    public void setNoiDungDonHang(String noiDungDonHang){
        content = noiDungDonHang;
    }
    private Integer weight = 100;    // Trọng lượng
    private Integer length = 10;     // Chiều dài
    private Integer width = 10;      // Chiều rộng
    private Integer height = 10;     // Chiều cao
    private Long deliver_station_id; // ID trạm giao hàng

    // private Long insurance_value;    // Giá gốc đơn hàng
    private Long service_id;         // ID dịch vụ
    private Long service_type_id;    // 2: Chuyển phát thương mại điện tử, 5: Chuyển phát truyền thống
    // private Object coupon;           // Mã khuyến mãi
    private Long pickup_time;        // Thời gian mong muốn lấy hàng
    public void setDsSanPham(List<SanPhamGhnApi> dsSanPham){
//        dsSanPham.get(i).getQuantity();
        int slSanPham = 0;
        for (SanPhamGhnApi sp: dsSanPham
             ) {
            slSanPham+=sp.getQuantity();
        }
        slSanPham*=7;
        weight=slSanPham;
        length=slSanPham;
        width=slSanPham;
        items = dsSanPham;
    }

    private List<SanPhamGhnApi> items;
}
