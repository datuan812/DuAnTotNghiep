package com.laptrinhjavaweb.api.hoadon;

import com.laptrinhjavaweb.entity.HoaDonEntity;
import com.laptrinhjavaweb.model.request.ThongTinNhanHangRequest;
import com.laptrinhjavaweb.model.response.HoaDonResponse;
import com.laptrinhjavaweb.model.response.hoadon.AllThongTinHoaDon;
import com.laptrinhjavaweb.model.response.thongke.AllThongKeResponse;
import com.laptrinhjavaweb.model.response.thongke.DanhSachHoaDonResponse;
import com.laptrinhjavaweb.model.response.thongke.ThongKeHoaDonResponse;
import com.laptrinhjavaweb.model.response.thongke.TopResponse;
import com.laptrinhjavaweb.service.GiaoHangService;
import com.laptrinhjavaweb.service.HoaDonService;
import com.laptrinhjavaweb.service.Thu3Service;
import com.laptrinhjavaweb.support.supportgiaohang.PreviewGiaoHang;
import com.laptrinhjavaweb.support.supportgiaohang.TrangThaiHoaDon;
import com.laptrinhjavaweb.utils.ResponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/hoadon")
public class ApiHoaDonController {

    @Autowired
    HoaDonService hoaDonService;

    @Autowired
    GiaoHangService giaoHangService;

    @Autowired
    RestTemplate restTemplate;

    @Autowired
    ApiGiaoHangController giaoHangController;
    @Autowired
    Thu3Service thu3Service;

    @GetMapping("/thongkedssp")
    public List<TopResponse> thongKeDsSanPham(){
        return hoaDonService.thongKeDsSanPham();
    }
    @GetMapping("/alltt")
    public AllThongTinHoaDon allThongTinHoaDon(@RequestParam("mahoadon") String maHoaDon){
        return hoaDonService.allThongTinHoaDon(maHoaDon);
    }
    @GetMapping("/thongke")
    public Object allThongKe(@RequestParam("thoigian") Integer thoiGian){
        return hoaDonService.allThongKe(thoiGian);
    }

    @GetMapping("/dshoadonresponse")
    public List<DanhSachHoaDonResponse> danhSachHoaDon(@RequestParam(value = "startDate")String startDate,
                                                       @RequestParam(value = "endDate")String endDate,
                                                       @RequestParam(value = "trangThai",required = false,defaultValue = "")String trangThai,
                                                       @RequestParam(value = "phuongThucThanhToan",required = false,defaultValue = "")String phuongThucThanhToan
    ) throws ParseException {
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = formatter.parse(startDate);
        return  hoaDonService.dsHoaDonResponse(phuongThucThanhToan,trangThai,date,formatter.parse(endDate));
    }

    @GetMapping("/findall")
    public List<HoaDonResponse> findAllHoaDon(){
        return hoaDonService.dsHoadon();
    }

    @GetMapping("/dshoadondamua/{idkh}")
    public ResponseObject getDsHoaDonTheoTrangThai(@PathVariable("idkh")Long idkh){
        return new ResponseObject(hoaDonService.dsHoaDonDaMua(idkh));
    }

    @GetMapping("/dshdtheott/{idkh}")
    public ResponseObject getDsHoaDonTheoTrangThai(@PathVariable("idkh")Long idkh,
                                                   @RequestParam("trangthai")String trangThai){
        return new ResponseObject(hoaDonService.dsHoaDonTheoTrangThai(idkh,trangThai));
    }

    @GetMapping("/chuanbidat/{idkh}")
    public ResponseObject getHoaDonChiTiet(@PathVariable(name = "idkh")Long idkh){
        return new ResponseObject(hoaDonService.findHoaDonMoiDat(idkh));
    }




    @GetMapping("/dshoadon")
    public List<HoaDonResponse> dsHoaDonOnline(@RequestParam(name = "ten",required = false,defaultValue = "")String ten,
                                               @RequestParam(name = "trangthai",required = false,defaultValue = "")String trangThai){
        return hoaDonService.dsHoaDonOnline(trangThai,ten);
    }

    @GetMapping("/thaydoitrangthai")
    public String thayDoiTrangThai(@RequestParam("idhd")Long idhd,
                                   @RequestParam("trangthai")String trangThai,
                                   @RequestParam(value = "luuy",required = false,defaultValue = "")String luuy,
                                   @RequestParam(value = "thu3",required = false,defaultValue = "0")Integer check
    ){
        HoaDonEntity hoaDon = hoaDonService.thayDoiTrangThaiHoaDon(idhd,trangThai,luuy);
        if (trangThai.equals(TrangThaiHoaDon.DANHANDON)){
            PreviewGiaoHang previewGiaoHang = giaoHangController.datHang(idhd);
            hoaDon.setMaGiaoHang(previewGiaoHang.getMaHoaDon());
            hoaDonService.saveHoaDon(hoaDon);
            thu3Service.themTrangThaiGiaoHang(idhd,"Đang chuẩn bị hàng","Đã nhận đơn");
        }else if (trangThai.equals(TrangThaiHoaDon.HUYDON)){
            if (check==1){
                thu3Service.themTrangThaiGiaoHang(idhd,"Khách không nhận","Huỷ đơn");
            }else if (check==2){
                thu3Service.themTrangThaiGiaoHang(idhd,"Lỗi giao hàng nhanh","Huỷ đơn");
            }else{
                thu3Service.themTrangThaiGiaoHang(idhd,"Đơn hàng đã huỷ","Huỷ đơn");
            }
        }else if(trangThai.equals(TrangThaiHoaDon.DANHANHANG)){
            thu3Service.themTrangThaiGiaoHang(idhd,"Đã nhận hàng","Nhận Hàng");
        } else if (trangThai.equals(TrangThaiHoaDon.DANGGIAOHANG)) {
            thu3Service.themTrangThaiGiaoHang(idhd,"Đơn hàng đang được giao","Đang giao hàng");
        }
        return  "Thay đổi trạng thái thành công";
    }

    @PostMapping("/dathangnhanhang")
    public ResponseObject datHangNhanHang(@RequestBody ThongTinNhanHangRequest request
                                          ){
        HoaDonEntity hoaDon = giaoHangService.thanhToan(request.getIdkh(),request.getTtgh(),
                "THANHTOANNHANHANG", request.getPhiship(),request.getLuuy(),request.getTongTien());
        return new ResponseObject("Đặt hàng thành công");
    }
    @GetMapping("/thongkehoadon")
    public List<ThongKeHoaDonResponse> thongKeHoaDon(){
        return  hoaDonService.thongKeHoaDon();
    }

    @PostMapping("/datvidientu")
    public ResponseObject datHangViDienTu(@RequestBody ThongTinNhanHangRequest request
    ){
        HoaDonEntity hoaDon = giaoHangService.thanhToan(request.getIdkh(),request.getTtgh(),
                "VIDIENTU", request.getPhiship(),request.getLuuy(),request.getTongTien());
        return new ResponseObject("Đặt hàng thành công");
    }
    @GetMapping("/huydathang/{idkh}")
    public ResponseObject huyDatHang(@PathVariable("idkh")Long idkh){
        return hoaDonService.huyDatHang(idkh);
    }


}
