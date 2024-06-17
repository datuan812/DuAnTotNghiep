package com.laptrinhjavaweb.entity;

import com.laptrinhjavaweb.model.enumentity.TrangThaiHoaDonEnum;
import com.laptrinhjavaweb.support.supportgiaohang.TrangThaiHoaDon;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "hoadon")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HoaDonEntity extends BaseEntity{

	@Column(name = "ma", unique = true)
	private String ma;

	@Column(name = "magiaohang", unique = true)
	private String maGiaoHang;

	@Column(name = "mota", columnDefinition = "TEXT")
	private String moTa;
	
	@Column(name = "tongtienhang")
	private Double tongTienHang;
	
	@Column(name = "tienkhachtra")
	private Double tienKhachTra;
	
	@Column(name = "phuongthucthanhtoan")
	private String phuongThucThanhToan;
	
	@Column(name = "ngaydat", columnDefinition = "TIMESTAMP")
	private Date ngayDat;
	
	@Column(name = "ngaydukiengiaohang", columnDefinition = "TIMESTAMP")
	private Date ngayDuKienGiaoHang;

	@Column(name = "ngaygiaohang", columnDefinition = "TIMESTAMP")
	private Date ngayGiaoHang;

	@Column(name = "ngaythanhtoan", columnDefinition = "TIMESTAMP")
	private Date ngayThanhToan;
	
	@Column(name = "ngaynhanhang", columnDefinition = "TIMESTAMP")
	private Date ngayNhanHang;
	
	@Column(name = "tennguoinhan")
	private String tenNguoiNhan;
	
	@Column(name = "sodienthoai")
	private String sodienthoai;
	
	@Column(name = "diachi")
	private String diaChi;

	@Column(name = "tienship")
	private Double tienShip;

	@Column(name = "loai")
	private String loai;

	@Column(name = "tiengiamgia")
	private Double tienGiamGia;

	@ManyToOne
	@JoinColumn(name = "idnhanvien")
	private NhanVienEntity nhanVien;
	
	@ManyToOne
	@JoinColumn(name = "idkhachhang")
	private KhachHangEntity khachHang;
	
	@ManyToOne
	@JoinColumn(name = "idlydohuydon")
	private LyDoHuyDonEntity lyDoHuyDon;

	@OneToMany(mappedBy = "hoaDon")
	private List<TrangThaiGiaoHangEntity> trangThaiGiaoHangs;

	@OneToMany(mappedBy = "hoaDon")
	private List<ChiTietCaLamEntity> chiTietCaLamEntities = new ArrayList<>();
	
	@OneToMany(mappedBy = "hoaDon",cascade = CascadeType.REMOVE)
	private List<HoaDonChiTietEntity> hoaDonChiTietEntities  = new ArrayList<>();
	
	@OneToMany(mappedBy = "hoaDon", fetch = FetchType.LAZY)
	private List<LichSuTichDiemEntity> lichSuTichDiemEntities = new ArrayList<>();

	public void setTrangThai(TrangThaiHoaDonEnum trangThai){
		if (trangThai == TrangThaiHoaDonEnum.CHUANBIDATHANNG){
			super.setTrangThai("CHUANBIDATHANG");
		} else if (trangThai==TrangThaiHoaDonEnum.CHONHANDON){
			super.setTrangThai("CHONHANDON");
		}else if (trangThai==TrangThaiHoaDonEnum.DANHANDON){
			super.setTrangThai("DANHANDON");
		}else if (trangThai==TrangThaiHoaDonEnum.DANGVANCHUYEN){
			super.setTrangThai("DANGVANCHUYEN");
		}else if (trangThai==TrangThaiHoaDonEnum.DANHANHANG){
			super.setTrangThai("DANHANHANG");
		}else if (trangThai==TrangThaiHoaDonEnum.HUYDON){
			super.setTrangThai("HUYDON");
		}else if(trangThai == TrangThaiHoaDonEnum.TREO){
			super.setTrangThai("TREO");
		}else if(trangThai == TrangThaiHoaDonEnum.THANHCONG){
			super.setTrangThai("THANHCONG");
		}
	}

	public String getTrangThaiHoaDonOff() {
		return super.getTrangThai();
	}

	@Override
	public String getTrangThai() {
		String tt = super.getTrangThai();
		return tt.equals(TrangThaiHoaDon.CHONHANDON)?"Chờ nhận đơn":
				tt.equals(TrangThaiHoaDon.DANHANDON)?"Đã nhận đơn"
				:tt.equals(TrangThaiHoaDon.DANGGIAOHANG)?"Đang giao hàng":
				tt.equals(TrangThaiHoaDon.HUYDON)?"Huỷ đơn":
				tt.equals(TrangThaiHoaDon.DANHANHANG)?"Đã nhận hàng":"";
	}

	public void setThongTinDatHang(ThongTinMuaHangEntity thongTinMuaHang){
		diaChi = thongTinMuaHang.getDiaChi();
		sodienthoai = thongTinMuaHang.getSoDienThoai();
		tenNguoiNhan = thongTinMuaHang.getTen();
	}

	public Double getTongTien() {
		try {
			return tongTienHang+tienShip;
		}catch (Exception e){
			return 0D;
		}
	}

	public Double getTienShip() {
		return tienShip==null?0:tienShip;
	}

	public Double getTienKhachTraOnline() {
		if (phuongThucThanhToan.equals("CHUYENKHOAN")){
			return 0D;
		}
		return getTienShip()+tongTienHang;
	}

	public String getPhuongThucThanhToan() {
		return phuongThucThanhToan.equals("CHUYENKHOAN")?"Paypal":
				phuongThucThanhToan.equals("VIDIENTU")?"Ví điện tử":"Thanh toán khi nhận hàng";
	}

	public Boolean getLoaiThanhToan(){
		return phuongThucThanhToan.equals("CHUYENKHOAN")||phuongThucThanhToan.equals("VIDIENTU");
	}

	public String getPhuongThuc(){
		return phuongThucThanhToan;
	}
}
