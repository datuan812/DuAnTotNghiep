package com.laptrinhjavaweb.service.impl.giaohang;


import com.laptrinhjavaweb.entity.ChiTieuEntity;
import com.laptrinhjavaweb.entity.HoaDonEntity;
import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.entity.ThongTinMuaHangEntity;
import com.laptrinhjavaweb.entity.TrangThaiGiaoHangEntity;
import com.laptrinhjavaweb.entity.ViDienTuEntity;
import com.laptrinhjavaweb.model.request.ThongTinDatHangRequest;
import com.laptrinhjavaweb.model.response.HoaDonChiTietResponse;
import com.laptrinhjavaweb.model.response.ThongTinMuaHangResponse;
import com.laptrinhjavaweb.model.response.hoadon.TongTienResponse;
import com.laptrinhjavaweb.repository.ChiTieuRepository;
import com.laptrinhjavaweb.repository.GioHangChiTietRepository;
import com.laptrinhjavaweb.repository.HoaDonChiTietRepository;
import com.laptrinhjavaweb.repository.HoaDonRepository;
import com.laptrinhjavaweb.repository.KhachHangRepository;
import com.laptrinhjavaweb.repository.TrangThaiGiaoHangRepository;
import com.laptrinhjavaweb.repository.ViDienTuRepository;
import com.laptrinhjavaweb.service.GiaoHangService;
import com.laptrinhjavaweb.service.ThongTinMuaHangService;
import com.laptrinhjavaweb.support.supportgiaohang.DateUtil;
import com.laptrinhjavaweb.support.supportgiaohang.SanPhamGhnApi;
import com.laptrinhjavaweb.support.supportgiaohang.TrangThaiHoaDon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class GiaoHangServiceImpl implements GiaoHangService {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private ThongTinMuaHangService thongTinMuaHangService;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;


    @Autowired
    private ViDienTuRepository viDienTuRepository;

    @Autowired
    private ChiTieuRepository chiTieuRepository;

    @Autowired
    private TrangThaiGiaoHangRepository trangThaiGiaoHangRepository;
    private String diaChiBuuCuc ="Số 97 Thiên hiền , Phường Mỹ Đình 1, QUận Nam Từ Liêm , Hà Nội, Vietnam";

    private ThongTinDatHangRequest getThongTinDatHangRequest (List<SanPhamGhnApi> dssp,
                                                              HoaDonEntity hoaDon
                                                              ){
        ThongTinDatHangRequest request = ThongTinDatHangRequest.builder()
              //  .payment_type_id(2L)
                .note(hoaDon.getMoTa())
                .required_note("KHONGCHOXEMHANG")
                .client_order_code("")
                .from_name("Đinh Tuấn Anh")
                .from_phone("0389478937")
                .content("Test mua đơn hàng")
//                .weight(100)
//                .length(10)
//                .width(10)
//                .height(10)
                .deliver_station_id(null)
                .service_id(0L)
                .service_type_id(2L)
                .build();
        request.setTienThuHo(hoaDon);
        request.setDiaChiNguoiGui(diaChiBuuCuc);
        request.setDsSanPham(dssp);
        request.setNoiDungDonHang("Khách đặt");
        request.setNguoiNhan(hoaDon.getDiaChi(), hoaDon.getSodienthoai(),hoaDon.getTenNguoiNhan());
        return request;
    }
    private ThongTinDatHangRequest getThongTinDatHangRequest (List<SanPhamGhnApi> dssp,
                                                              String diaChi,String soDienThoai,String nguoiNhan
    ){
        ThongTinDatHangRequest request = ThongTinDatHangRequest.builder()
                //  .payment_type_id(2L)
                .note("Chuyển khoản")
                .required_note("KHONGCHOXEMHANG")
                .client_order_code("")
                .from_name("Đinh Tuấn Anh")
                .from_phone("0389478937")
//                .weight(100)
//                .length(10)
//                .width(10)
//                .height(10)
                .cod_amount(20000L)
                .deliver_station_id(null)
                .service_id(0L)
                .service_type_id(2L)
                .build();
        request.setDiaChiNguoiGui(diaChiBuuCuc);
        request.setDsSanPham(dssp);
        request.setNguoiNhan(diaChi,soDienThoai,nguoiNhan);
        request.setNguoiThanhToan("NguoiNhan");
        return request;
    }
   private List<SanPhamGhnApi> getListSanPhamGhn(List<HoaDonChiTietResponse> dsHdct){
        List<SanPhamGhnApi> sanPhamGhnApiList = new ArrayList<>();
        for (HoaDonChiTietResponse hdct:dsHdct
             ) {
            sanPhamGhnApiList.add(new SanPhamGhnApi(hdct));
        }
        return  sanPhamGhnApiList;
    }
    @Override
    public ThongTinDatHangRequest getThongTinDatHang(Long idttdathang,Long idkh) {
        List<HoaDonChiTietResponse> dsHdct = dsHoaDonChiTiet(idkh);
        ThongTinMuaHangResponse thongTinMuaHang = thongTinMuaHangService.findThongTinMuaHangById(idttdathang);
        List<SanPhamGhnApi> sanPhamGhnApiList = getListSanPhamGhn(dsHdct);
        //  request.setTo_phone("0325808823");
        return getThongTinDatHangRequest(sanPhamGhnApiList, thongTinMuaHang.getDiaChi(),thongTinMuaHang.getSdt(),thongTinMuaHang.getTenNguoiNhan());
    }


    @Override
    public List<HoaDonChiTietResponse> dsHoaDonChiTiet(Long idkh) {
        return hoaDonChiTietRepository.getHoaDonMoiTaoByIdkh(idkh);
    }


    @Override
    @Transactional
    public HoaDonEntity thanhToan(Long idkh,Long idttgh ,String pttt,Double phiShip,String mota,Double tongTien) {
        KhachHangEntity khachHang = khachHangRepository.findById(idkh).get();
        ThongTinMuaHangEntity thongTinMuaHang = thongTinMuaHangService.findById(idttgh);
        HoaDonEntity hoaDon = hoaDonRepository.findHoaDonMoiDat(khachHang.getId());
        if (hoaDon == null){
            return null;
        }
        hoaDon.setTrangThai(TrangThaiHoaDon.CHONHANDON);
        hoaDon.setNgayDat(DateUtil.dateNow());
        hoaDon.setThongTinDatHang(thongTinMuaHang);
        hoaDon.setPhuongThucThanhToan(pttt);
        hoaDon.setTienShip(phiShip);
        if (hoaDon.getLoaiThanhToan()){
            hoaDon.setNgayThanhToan(DateUtil.dateNow());
        }
        hoaDon.setMoTa(mota);
        TongTienResponse response = hoaDonRepository.tongTienByHoaDon(hoaDon.getId());
        hoaDon.setTongTienHang(response.getThucTe());
//        if (pttt.equals("THANHTOANNHANHANG")){
            hoaDon.setTienKhachTra(tongTien);
//        }else{
//            hoaDon.setTienKhachTra(0D);
//        }
        if (pttt.equals("VIDIENTU")){
            ViDienTuEntity viDienTuEntity = viDienTuRepository.findByKhachHang(khachHang.getId());
             ChiTieuEntity chiTieu  = new ChiTieuEntity();
             chiTieu.setLoaiChiTieu(0);
             chiTieu.setSoTien(tongTien);
             chiTieu.setViDienTu(viDienTuEntity);
             chiTieuRepository.save(chiTieu);
             viDienTuEntity.setSoTien(viDienTuEntity.getSoTien()-tongTien);
        }
        TrangThaiGiaoHangEntity trangThaiGiaoHang = new TrangThaiGiaoHangEntity();
        trangThaiGiaoHang.setHoaDon(hoaDon);
        trangThaiGiaoHang.setTenTrangThai("Đặt hàng");
        trangThaiGiaoHang.setTrangThaiHoaDon(" ");
        trangThaiGiaoHangRepository.save(trangThaiGiaoHang);
        int parameter = gioHangChiTietRepository.configHoaDonChiTietKhiDatHang(hoaDon.getId(),khachHang.getId());
        hoaDon.setLoai("Online");
        return hoaDonRepository.save(hoaDon);
    }

    @Override
    public ThongTinDatHangRequest datHangGiaoHangNhanh(Long idhd) {
        HoaDonEntity hoaDon = hoaDonRepository.findById(idhd).get();
        List<HoaDonChiTietResponse> dsHdct = dsHoaDonChiTietTheoHoaDon(hoaDon.getId());
        List<SanPhamGhnApi> sanPhamGhnApiList = getListSanPhamGhn(dsHdct);
        return getThongTinDatHangRequest(sanPhamGhnApiList,
                 hoaDon);
    }
    private List<HoaDonChiTietResponse> dsHoaDonChiTietTheoHoaDon(Long idhd) {
        List<HoaDonChiTietResponse> dsHdct = hoaDonChiTietRepository.dsHoaDonChiTietByIdHoaDon(idhd);
        return dsHdct;
    }

}
