package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Entity
@Table(name = "giohangchitiet")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GioHangChiTietEntity extends BaseEntity{

	@ManyToOne
	@JoinColumn(name = "idbienthe")
	private BienTheEntity bienThe;
	
	@ManyToOne
	@JoinColumn(name = "idgiohang")
	private GioHangEntity gioHang;
	
	@ManyToOne
	@JoinColumn(name = "idsanpham")
	private SanPhamEntity sanPham;
	
	@Column(name = "gia")
	private Double gia;
	
	@Column(name = "soluong")
	private Integer soLuong;

	public Double getGiaTien(){
		if (bienThe.getGia()==null){
			return bienThe.getSanPham().getGia()*soLuong;
		}else return bienThe.getGia();
	}

	public Double getGiaTienKm(){
		List<KhuyenMaiSanPhamEntity> dsKhuyenMai = bienThe.getSanPham().getKhuyenMaiSanPhamEntities();
		LocalDate ngayHienTai = LocalDate.now();

		assert dsKhuyenMai != null;
		Optional<KhuyenMaiSanPhamEntity> khuyenMaiHopLeOptional = dsKhuyenMai.stream()
				.filter(khuyenMai -> {
					Date ngayBatDau = khuyenMai.getKhuyenMai().getNgayBatDau();
					Date ngayKetThuc = khuyenMai.getKhuyenMai().getNgayKetThuc();

					LocalDate localNgayBatDau = ngayBatDau.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
					LocalDate localNgayKetThuc = ngayKetThuc.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

					return !localNgayBatDau.isAfter(ngayHienTai) &&
							!localNgayKetThuc.isBefore(ngayHienTai)&&khuyenMai.getKhuyenMai().getSoLuong()>0
							&&!khuyenMai.getTrangThai().equals("EXPIRED");
				})
				.findFirst();

		if (khuyenMaiHopLeOptional.isPresent()) {
			KhuyenMaiSanPhamEntity khuyenMaiHopLe = khuyenMaiHopLeOptional.get();
			if (khuyenMaiHopLe.getTrangThai().equals("EXPIRED")||khuyenMaiHopLe.getTrangThai().equals("DELETE")){
				return null;
			}
			KhuyenMaiEntity khuyenMai = khuyenMaiHopLe.getKhuyenMai();
			Double giaTri = khuyenMai.getGiaTri();
			if (khuyenMai.getLoai().equals("1"))
			{
				return getGiaTien() * (100 - giaTri) / 100;
			}

// Tính giá sau khi giảm giá
			return getGiaTien()-giaTri;
		} else {
			return null;
		}


	}

	public Double soTienDuocGiam(){
		Double giaTienKm  = getGiaTienKm();
		if (giaTienKm==null){
			return null;
		}else{
			return getGiaTien()-giaTienKm;
		}
	}

	public Double getTongTien(){
		Double giaTienKm = getGiaTienKm();
		if (giaTienKm==null){
			return getGiaTien()*soLuong;
		}
		return giaTienKm*soLuong;
	}
	public String getHinhAnh() {
		return bienThe.getHinhAnh()==null?
				bienThe.getSanPham().getAnhSanPhamEntities().get(0).getHinhAnh(): bienThe.getHinhAnh();
	}
}
