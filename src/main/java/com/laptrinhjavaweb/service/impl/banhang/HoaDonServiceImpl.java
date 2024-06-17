package com.laptrinhjavaweb.service.impl.banhang;


import com.laptrinhjavaweb.entity.*;
import com.laptrinhjavaweb.model.response.HoaDonChiTietResponse;
import com.laptrinhjavaweb.model.response.HoaDonResponse;
import com.laptrinhjavaweb.model.response.TrangThaiGiaoHangResponse;
import com.laptrinhjavaweb.model.response.hoadon.AllThongTinHoaDon;
import com.laptrinhjavaweb.model.response.hoadon.HDCTResponse;
import com.laptrinhjavaweb.model.response.hoadon.ThongTinHoaDonResponse;
import com.laptrinhjavaweb.model.response.hoadon.TongTienResponse;
import com.laptrinhjavaweb.model.response.thongke.AllThongKeResponse;
import com.laptrinhjavaweb.model.response.thongke.DanhSachHoaDonResponse;
import com.laptrinhjavaweb.model.response.thongke.ThongKeHoaDonResponse;
import com.laptrinhjavaweb.model.response.thongke.TopResponse;
import com.laptrinhjavaweb.repository.*;
import com.laptrinhjavaweb.service.HoaDonService;
import com.laptrinhjavaweb.service.impl.QuyDoiDiemService;
import com.laptrinhjavaweb.support.supportgiaohang.TrangThaiHoaDon;
import com.laptrinhjavaweb.utils.ResponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Service
public class HoaDonServiceImpl implements HoaDonService {

    @Autowired
    GioHangRepository gioHangRepository;

    @Autowired
    HoaDonRepository hoaDonRepository;

    @Autowired
    KhachHangRepository khachHangRepository;

    @Autowired
    GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private TichDiemRepository tichDiemRepository;

    @Autowired
    private QuyDoiDiemService quyDoiDiemService;

    @Autowired
    private LichSuTichDiemRepository lichSuTichDiemRepository;

//    @Autowired
//    BienTheRepository bienTheRepository;

    @Autowired
    HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    ThongTinMuaHangRepository thongTinMuaHangRepository;

    @Autowired
    TrangThaiGiaoHangRepository trangThaiGiaoHangRepository;

    @Autowired
    ViDienTuRepository viDienTuRepository;

    @Autowired
    ChiTieuRepository chiTieuRepository;

//    @Autowired
//    HoaDonConverter hoaDonConverter;

    @Override
    public void saveHoaDon(HoaDonEntity hoaDon) {
        hoaDonRepository.save(hoaDon);
    }

    @Override
    public List<DanhSachHoaDonResponse> dsHoaDonResponse() {
        return hoaDonRepository.dsHoaDon();
    }

    @Override
    public List<DanhSachHoaDonResponse> dsHoaDonResponse(String phuongThucThanhToan,String trangThai,Date startDate, Date endDate) {
        return hoaDonRepository.dsHoaDon(phuongThucThanhToan,trangThai,startDate,endDate);
    }

    @Override
    public HoaDonEntity findById(Long idhd) {
        return hoaDonRepository.findById(idhd).orElse(null);
    }

    @Override
    public List<ThongKeHoaDonResponse> thongKeHoaDon() {
        return hoaDonRepository.thongKeDsHoaDon();
    }


    @Override
    public List<HoaDonChiTietResponse> findHoaDonMoiDat(Long idkh) {
        return hoaDonChiTietRepository.getHoaDonMoiTaoByIdkh(idkh);
    }

    @Override
    public List<HoaDonChiTietResponse> dsHoaDonChiTietByIdHoaDon(Long idhd) {
        return hoaDonChiTietRepository.dsHoaDonChiTietByIdHoaDon(idhd);
    }

    @Override
    public TongTienResponse tongTienTheoHoaDon(Long idhd) {
        return hoaDonRepository.tongTienByHoaDon(idhd);
    }

    @Override
    public List<HoaDonResponse> dsHoaDonOnline() {
        return hoaDonRepository.dsHoaDonOnline();
    }

    @Override
    public List<HoaDonResponse> dsHoaDonOnline(String trangThai, String ten) {
        return hoaDonRepository.dsHoaDonOnline(trangThai,ten);
    }

    @Override
    public String thayDoiTrangThaiHoaDon(Long idhd, String trangThai) {
        try{
            HoaDonEntity hoaDon = hoaDonRepository.findById(idhd).orElse(null);
            assert hoaDon != null;
            // TrangThaiHoaDonEnum
            hoaDon.setTrangThai(trangThai);
            hoaDonRepository.save(hoaDon);
            return "Thay đổi trạng thái thành công";
        }catch (Exception e){
            return "Có lỗi xảy ra";
        }
    }

    @Override
    public HoaDonEntity thayDoiTrangThaiHoaDon(Long idhd, String trangThai,String luuy) {
        try{
            HoaDonEntity hoaDon = hoaDonRepository.findById(idhd).orElse(null);
            assert hoaDon != null;
            if (Objects.equals(trangThai, TrangThaiHoaDon.HUYDON) &&hoaDon.getLoaiThanhToan()){
                ViDienTuEntity viDienTuEntity = viDienTuRepository.findByKhachHang(hoaDon.getKhachHang().getId());
                ChiTieuEntity chiTieu = new ChiTieuEntity();
                chiTieu.setViDienTu(viDienTuEntity);
                chiTieu.setSoTien(hoaDon.getTienKhachTra());
                chiTieu.setLoaiChiTieu(2);
                viDienTuEntity.setSoTien(viDienTuEntity.getSoTien()+hoaDon.getTienKhachTra());
                chiTieuRepository.save(chiTieu);
                viDienTuRepository.save(viDienTuEntity);

                hoaDonRepository.updateLaiSoLuongKhiHuyDon(idhd);
            }

            if (trangThai.equals(TrangThaiHoaDon.DANHANHANG)&&!hoaDon.getLoaiThanhToan()){
                hoaDon.setNgayThanhToan(new java.util.Date());
            }

            hoaDon.setTrangThai(trangThai);
            hoaDon.setMoTa(luuy);
            hoaDonRepository.save(hoaDon);
            if (trangThai.equals(TrangThaiHoaDon.DANHANHANG)){
                saveTichDiemOnline(hoaDon);
            }
            return hoaDon;
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public List<HoaDonResponse> dsHoaDonTheoTrangThai(Long idkh, String trangThai) {
        return hoaDonRepository.findAllByKhachHang_IdAndTrangThaiAndLoai(idkh,trangThai,"Online");
    }

    @Override
    public List<HoaDonResponse> dsHoaDonDaMua(Long idkh) {
        List<String> dsTrangThai = new ArrayList<>();
        dsTrangThai.add(TrangThaiHoaDon.CHUANBIDATHANG);
        return hoaDonRepository.findAllByKhachHang_IdAndTrangThaiNotInAndLoaiOrderByNgayDat(idkh,dsTrangThai,"Online");
    }

    @Override
    public List<HoaDonResponse> dsHoadon() {
        return hoaDonRepository.findAllByTrangThaiNotContainsAndLoai(TrangThaiHoaDon.CHUANBIDATHANG,"Online");
    }

    @Override
    @Transactional
    public ResponseObject huyDatHang(Long idkh) {
        HoaDonEntity hoaDon = hoaDonRepository.findHoaDonMoiDat(idkh);
        hoaDonRepository.delete(hoaDon);
        int sl =  gioHangChiTietRepository.layLaiDsGioHangChiTiet(idkh);
        return new ResponseObject("Thành công");
    }

    @Override
    public AllThongTinHoaDon allThongTinHoaDon(String maHoaDon) {
        HoaDonEntity hoaDon = hoaDonRepository.findByMa(maHoaDon);
        TongTienResponse tongTienResponse = hoaDonRepository.tongTienByHoaDon(hoaDon.getId());
        ThongTinHoaDonResponse hoaDonResponse = hoaDonRepository.getHoaDonResponse(maHoaDon);
        List<HDCTResponse> dsHoaDonChiTiet = hoaDonChiTietRepository.dsHoaDonChiTietResponse(maHoaDon);
        List<TrangThaiGiaoHangResponse> dsTrangThaiGiaoHang = trangThaiGiaoHangRepository.getTrangThaiDonHangByMaHD(maHoaDon);

        AllThongTinHoaDon thongTinHoaDon = new AllThongTinHoaDon();
        thongTinHoaDon.setTongTien(tongTienResponse);
        thongTinHoaDon.setHoaDon(hoaDonResponse);
        thongTinHoaDon.setDsHoaDonChiTiet(dsHoaDonChiTiet);
        thongTinHoaDon.setTrangThaiGiaoHang(dsTrangThaiGiaoHang);
        return thongTinHoaDon;
    }

    @Override
    public AllThongKeResponse allThongKe(Integer thoiGian) {
        AllThongKeResponse response = new AllThongKeResponse();
        switch (thoiGian){
            case 1:{
                response.setDoanhThuBanHang(hoaDonRepository.doanhThuNgay());
                response.setDsSanPhamBanChayNhat(hoaDonRepository.dsSanPhamBanChayTheoNgay());
                response.setDsKhachHangMuaNhieuNhat(hoaDonRepository.dsKhachHangMuaNhieuNhatTheoNgay());

                break;
            }
            case 2:{
                response.setDoanhThuBanHang(hoaDonRepository.doanhThuTuan());
                response.setDsSanPhamBanChayNhat(hoaDonRepository.dsSanPhamBanChayTheoTuan());
                response.setDsKhachHangMuaNhieuNhat(hoaDonRepository.dsKhachHangMuaNhieuNhatTheoTuan());
                break;
            }case 3:{
                response.setDoanhThuBanHang(hoaDonRepository.doanhThuThang());
                response.setDsSanPhamBanChayNhat(hoaDonRepository.dsSanPhamBanChayTheoThang());
                response.setDsKhachHangMuaNhieuNhat(hoaDonRepository.dsKhachHangMuaNhieuNhatTheoThang());

                break;
            }case 4:{
                response.setDoanhThuBanHang(hoaDonRepository.doanhThuNam());
                response.setDsSanPhamBanChayNhat(hoaDonRepository.dsSanPhamBanChayTheoNam());
                response.setDsKhachHangMuaNhieuNhat(hoaDonRepository.dsKhachHangMuaNhieuNhatTheoNam());
                break;
            }
            default:return null;
        }

        return response;
    }

    @Override
    public List<TopResponse> thongKeDsSanPham() {
        return hoaDonRepository.thongKeDsSanPhamTheoThoiGian();
    }



    public void saveTichDiemOnline(HoaDonEntity hoaDonEntity){
            TichDiemEntity entity = tichDiemRepository.findByKhachHang_ma(hoaDonEntity.getKhachHang().getMa());
            Integer soDiemTichDuoc = quyDoiDiemService.TienQuyDiem(hoaDonEntity.getTongTienHang());
            if(entity != null){
                entity.setSoDiem(entity.getSoDiem() - 0 + soDiemTichDuoc);
                tichDiemRepository.save(entity);
            }else{
                TichDiemEntity diemEntity = new TichDiemEntity();
                diemEntity.setSoDiem(soDiemTichDuoc);
                diemEntity.setKhachHang(hoaDonEntity.getKhachHang());
                diemEntity.setTrangThai("ACTIVE");
                tichDiemRepository.save(diemEntity);
            }
            LichSuTichDiemEntity lichSuTichDiemEntity = new LichSuTichDiemEntity();
            lichSuTichDiemEntity.setSoDiemTichDuoc(soDiemTichDuoc);
            lichSuTichDiemEntity.setSoDiemDung(0);
            lichSuTichDiemEntity.setKhachHang(hoaDonEntity.getKhachHang());
            lichSuTichDiemEntity.setHoaDon(hoaDonEntity);
            lichSuTichDiemEntity.setTrangThai("ACTIVE");
            lichSuTichDiemRepository.save(lichSuTichDiemEntity);
    }


}
