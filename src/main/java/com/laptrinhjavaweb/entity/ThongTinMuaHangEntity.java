package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.laptrinhjavaweb.model.enumentity.TrangThaiTTMHEnum;
import lombok.*;

@Entity
@Table(name = "thongtinmuahang")
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class ThongTinMuaHangEntity extends BaseEntity{

	@Column(name = "ten")
	private String ten;
	
	@Column(name = "sodienthoai")
	private String soDienThoai;
	
	@Column(name = "diachi")
	private String diaChi;
	
	@Column(name = "idthanhpho")

	private Integer idThanhPho;
	
	@Column(name = "idhuyen")
	private Integer idHuyen;
	
	@Column(name = "idxa")
	private Integer idXa;
	
	@Column(name = "sonha")
	private String soNha;

	@ManyToOne
	@JoinColumn(name = "idkhachhang")
	private KhachHangEntity khachHang;


	public Boolean getDefault(){
		return super.getTrangThai().equals("DEFAULT");
	}
}
