package com.laptrinhjavaweb.service.impl.banhang;

import com.laptrinhjavaweb.entity.BienTheEntity;
import com.laptrinhjavaweb.entity.GioHangChiTietEntity;
import com.laptrinhjavaweb.entity.GioHangEntity;
import com.laptrinhjavaweb.entity.HoaDonChiTietEntity;
import com.laptrinhjavaweb.entity.HoaDonEntity;
import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.model.request.ThayDoiSoLuongGioHangRequest;
import com.laptrinhjavaweb.model.response.GioHangResponse;
import com.laptrinhjavaweb.model.response.hoadon.TongTienResponse;
import com.laptrinhjavaweb.repository.BienTheRepository;
import com.laptrinhjavaweb.repository.GioHangChiTietRepository;
import com.laptrinhjavaweb.repository.GioHangRepository;
import com.laptrinhjavaweb.repository.HoaDonChiTietRepository;
import com.laptrinhjavaweb.repository.HoaDonRepository;
import com.laptrinhjavaweb.repository.KhachHangRepository;
import com.laptrinhjavaweb.service.GioHangService;
import com.laptrinhjavaweb.support.supportgiaohang.TrangThaiHoaDon;
import com.laptrinhjavaweb.utils.ResponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class GioHangServiceImpl implements GioHangService {

    @Autowired
    GioHangChiTietRepository gioHangChiTietRepository;
    @Autowired
    HoaDonRepository hoaDonRepository;

    @Autowired
    KhachHangRepository khachHangRepository;

    @Autowired
    HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    BienTheRepository bienTheRepository;

    @Autowired
    GioHangRepository gioHangRepository;


    @Override
    @Transactional
    public ResponseObject thayDoiSoLuong(ThayDoiSoLuongGioHangRequest request) {
        try {
            GioHangChiTietEntity gioHangChiTiet = gioHangChiTietRepository.findById(request.getIdGhct()).orElse(null);
            if (gioHangChiTiet==null){
                return new ResponseObject("Không có giỏ hàng chi tiết này");
            }
            gioHangChiTiet.setSoLuong(request.getSoLuong());
            gioHangChiTiet = gioHangChiTietRepository.save(gioHangChiTiet);
            request.setSoLuong(gioHangChiTiet.getSoLuong());
            request.setTongTien(gioHangChiTiet.getTongTien());
            return new ResponseObject(request);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<GioHangResponse> dsGioHangChiTietByIdKh(Long idKH) {
        return gioHangChiTietRepository.dsGioHangChiTietByIdKh(idKH);
    }

    @Override
    public List<List<GioHangResponse>> dsGioHangTheoSpByIdkh(Long idkh) {
        List<List<GioHangResponse>> dsGioHangTheoSp = new ArrayList<>();
        List<Long> dsidsp = gioHangChiTietRepository.dsspCuaGioHang(idkh);
        for (Long idsp: dsidsp
             ) {
            dsGioHangTheoSp.add(gioHangChiTietRepository.dsGhctCuaSanPham(idkh,idsp));
        }
        return dsGioHangTheoSp;
    }

    @Override
    public TongTienResponse tongTienTheoGioHangChiTiet(List<Long> lstGhct) {
        return gioHangChiTietRepository.tongTienTheoGioHangChiTiet( lstGhct);
    }

    @Override
    @Transactional
    public String datHang(Long idkh, List<Long> dsghct) {
//        HoaDonChiTietEntity hoaDon = hoaDonRepository.getHoaDonMoiTaoByIdkh(idkh);
//        if (hoaDon!=null){
//            return new ResponseObject("Đang có hoá đơn trạng thái chưa giao hàng,vui lòng xem lại");
//        }
        KhachHangEntity khachHang = khachHangRepository.findById(idkh).orElse(null);
        HoaDonEntity hoaDon = hoaDonRepository.findHoaDonMoiDat(idkh);
        if (hoaDon==null){
            hoaDon = new HoaDonEntity();
            hoaDon.setKhachHang(khachHang);
            hoaDon.setTrangThai(TrangThaiHoaDon.CHUANBIDATHANG);
            hoaDon = hoaDonRepository.save(hoaDon);
            hoaDon.setMa("HD"+hoaDon.getId());
            hoaDon.setLoai("Online");
            hoaDonRepository.save(hoaDon);
        }

//        String check = null;
//        for (GioHangChiTietEntity gioHangChiTiet:gioHangChiTietRepository.dsGioHangChiTiet(dsghct)) {
//            BienTheEntity bienThe = gioHangChiTiet.getBienThe();
//            if (bienThe.getSoLuong() < gioHangChiTiet.getSoLuong()) {
//                if (bienThe.getSoLuong()==0){
//                    gioHangChiTiet.setTrangThai("DAHETHANG");
//                }else{
//                    Integer sl = bienThe.getSoLuong();
//                    if (sl>10){
//                        gioHangChiTiet.setSoLuong(10);
//                    }else{
//                        gioHangChiTiet.setSoLuong(sl);
//                    }
//                }
//                gioHangChiTietRepository.save(gioHangChiTiet);
//                check= "1";
//            }
//        }
//        if (check!=null){
//            return check;
//        }
//        int checkSl = 0;
        for (GioHangChiTietEntity gioHangChiTiet:gioHangChiTietRepository.dsGioHangChiTiet(dsghct)) {
            BienTheEntity bienThe = gioHangChiTiet.getBienThe();
            HoaDonChiTietEntity hoaDonChiTiet = new HoaDonChiTietEntity();
            hoaDonChiTiet.setBienThe(bienThe);
            hoaDonChiTiet.setHoaDon(hoaDon);
            hoaDonChiTiet.setSoLuong(gioHangChiTiet.getSoLuong());
            hoaDonChiTiet.setGia(gioHangChiTiet.getGia());
            hoaDonChiTiet.setSoTienGiam(gioHangChiTiet.soTienDuocGiam());
            hoaDonChiTiet.setHoaDon(hoaDon);
            hoaDonChiTiet.setTenBienThe(bienThe.getTen());
            hoaDonChiTiet.setSanPham(bienThe.getSanPham());
            hoaDonChiTiet.setAnhbienthe(bienThe.getHinhAnh()==null?bienThe.getSanPham().getAnhSanPhamEntities().get(0).getHinhAnh():bienThe.getHinhAnh());
            gioHangChiTiet.setTrangThai("PENDING");
            hoaDonChiTietRepository.save(hoaDonChiTiet);
        }

        return null;
    }

    @Override
    @Transactional
    public String themVaoGioHang(Long idkh, Long idBienThe,Integer quantity) {
        BienTheEntity bienThe = bienTheRepository.findById(idBienThe).orElse(null);
        assert bienThe != null;
        KhachHangEntity khachHang = khachHangRepository.findById(idkh).orElse(null);
        assert khachHang != null;
        if (khachHang.getGioHangEntities()==null){
            GioHangEntity gioHang = new GioHangEntity();
            gioHang.setKhachHang(khachHang);
            gioHang.setTrangThai("ACTIVE");
            khachHang.setGioHangEntities(gioHangRepository.save(gioHang));
        }
        GioHangChiTietEntity gioHangChiTiet = gioHangChiTietRepository.findGioHangChiTietEntitiesByBienThe_IdAndGioHang_KhachHang_IdAndTrangThai(idBienThe,idkh,"ACTIVE");

        if (gioHangChiTiet==null){
            if (quantity>bienThe.getSoLuong()){
                return "2";
            }
            if (quantity>10){
                quantity=10;
            }
            gioHangChiTiet = new GioHangChiTietEntity();
            gioHangChiTiet.setBienThe(bienThe);
            gioHangChiTiet.setGioHang(khachHang.getGioHangEntities());
            gioHangChiTiet.setSoLuong(quantity);
            gioHangChiTiet.setTrangThai("ACTIVE");
        }else {
            int soLuongNeuThem = gioHangChiTiet.getSoLuong()+quantity;
            if (soLuongNeuThem>bienThe.getSoLuong()){
                soLuongNeuThem=10;
            }
            if (soLuongNeuThem>10){
                return "1";
            }
            gioHangChiTiet.setSoLuong(soLuongNeuThem);
        }
        gioHangChiTiet =   gioHangChiTietRepository.save(gioHangChiTiet);
        return gioHangChiTiet.getBienThe().getId().toString();
    }

    @Override
    public GioHangResponse updateGioHangChiTiet(Long idghct, Long bienTheId) {
        GioHangChiTietEntity gioHangChiTiet = gioHangChiTietRepository.findById(idghct).orElse(null);
        assert gioHangChiTiet != null;
        gioHangChiTiet.setBienThe(bienTheRepository.findById(bienTheId).orElse(null));
        gioHangChiTietRepository.save(gioHangChiTiet);
        return gioHangChiTietRepository.getGioHangChiTietResponse(idghct);
    }

    @Override
    public String xoaGioHangChiTiet(Long idghct) {
        gioHangChiTietRepository.delete(gioHangChiTietRepository.findById(idghct).get());
        return "Xoá thành công";
    }

    @Override
    public Long tongSoSanPhamTrongGioHang(Long idkh) {
        KhachHangEntity khachHang = khachHangRepository.findById(idkh).orElse(null);
        assert khachHang != null;
        if (khachHang.getGioHangEntities()==null){
            GioHangEntity gioHang = new GioHangEntity();
            gioHang.setKhachHang(khachHang);
            gioHang.setTrangThai("ACTIVE");
            khachHang.setGioHangEntities(gioHangRepository.save(gioHang));
            return 0L;
        }
        List<GioHangResponse> dsGioHang = gioHangChiTietRepository.dsGioHangChiTietByIdKh(idkh);
        return (long) dsGioHang.size();
    }

    @Override
    public Boolean checkSoLanMua(Long idkh) {
        return hoaDonRepository.soLanMua(idkh)>=5;
    }

    @Override
    public void deleteHoaDonChuanBiDat(Long idsanpham) {
        int check = gioHangChiTietRepository.configHoaDonChuanBiDat(idsanpham);
    }

//
//    private BienThe getBienTheByDsThuocTinhChiTiet(List<Long> dsgtttid){
//        Long bienTheId = giaTriThuocTinhBienTheRepository.getIdBienTheByDsttbt(dsgtttid,dsgtttid.size());
//        return bienTheRepository.findById(bienTheId).orElse(null);
//    }
}
