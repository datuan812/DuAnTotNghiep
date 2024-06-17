package com.laptrinhjavaweb.api.hoadon;

import com.laptrinhjavaweb.entity.HoaDonEntity;
import com.laptrinhjavaweb.model.request.ThongTinDatHangRequest;
import com.laptrinhjavaweb.service.GiaoHangService;
import com.laptrinhjavaweb.service.HoaDonService;
import com.laptrinhjavaweb.service.Thu3Service;
import com.laptrinhjavaweb.support.supportgiaohang.ApiResponse;
import com.laptrinhjavaweb.support.supportgiaohang.ConvertJson;
import com.laptrinhjavaweb.support.supportgiaohang.PreviewGiaoHang;
import com.laptrinhjavaweb.utils.ResponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/api/user/giaohang")
public class ApiGiaoHangController {

    @Autowired
    private GiaoHangService giaoHangService;

    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private Thu3Service thu3Service;
    @Value("${tokenghn.string}")
    private String tokenghn;
    @Value("${urlgiaohang.string}")
    private String urlGiaoHang;

    RestTemplate restTemplate = new RestTemplate();


    private HttpHeaders getHeader() {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Token", tokenghn);
        headers.setContentType(MediaType.APPLICATION_JSON);
        return headers;
    }

    @GetMapping("/phiship")
    public ResponseEntity<?> phiShip(@RequestParam(name = "idttgh") Long idttgh,
                                     @RequestParam(name = "idkh") Long idkh) {
        final String uri = urlGiaoHang + "/preview";

        // Tạo HttpHeaders và đặt các header
        HttpHeaders headers = getHeader();

        // Tạo đối tượng request
        ThongTinDatHangRequest request = giaoHangService.getThongTinDatHang(idttgh, idkh);

        // Sử dụng `request` để truyền dữ liệu JSON
        HttpEntity<ThongTinDatHangRequest> requestEntity = new HttpEntity<>(request, headers);

        // Gọi API với yêu cầu POST và `requestEntity`
        PreviewGiaoHang responseEntity = ConvertJson.convert(restTemplate, uri
                , HttpMethod.POST, requestEntity
                , new ParameterizedTypeReference<ApiResponse<PreviewGiaoHang>>() {
                }
        );
        // Xử lý khi yêu cầu thành công
        return ResponseEntity.ok(responseEntity);
    }

    @GetMapping("/datHang/{idhd}")
    public PreviewGiaoHang datHang(@PathVariable(name = "idhd") Long idhd) {
        final String uri = urlGiaoHang + "/create";

        // Tạo HttpHeaders và đặt các header
        HttpHeaders headers = getHeader();

        // Tạo đối tượng request
        ThongTinDatHangRequest request = giaoHangService.datHangGiaoHangNhanh(idhd);

        // Sử dụng `request` để truyền dữ liệu JSON
        HttpEntity<ThongTinDatHangRequest> requestEntity = new HttpEntity<>(request, headers);

        // Gọi API với yêu cầu POST và `requestEntity`
        PreviewGiaoHang responseEntity = ConvertJson.convert(restTemplate, uri
                , HttpMethod.POST, requestEntity
                , new ParameterizedTypeReference<ApiResponse<PreviewGiaoHang>>() {
                }
        );
        HoaDonEntity hoaDon = hoaDonService.findById(idhd);
        hoaDon.setMaGiaoHang(responseEntity.getMaHoaDon());
        hoaDon.setNgayDuKienGiaoHang(responseEntity.getThoiGianDuKienNhan());

        hoaDonService.saveHoaDon(hoaDon);

        // Xử lý khi yêu cầu thành công
        return responseEntity;
    }

    @GetMapping("/hdct/{idkh}")
    public ResponseObject getHoaDonChiTiet(@PathVariable(name = "idkh") Long idkh) {
        return new ResponseObject(giaoHangService.dsHoaDonChiTiet(idkh));
    }

    @GetMapping("/tongtienhd/{idhd}")
    public ResponseObject tongTienTheoHoaDon(@PathVariable(name = "idhd") Long idhd) {
        return new ResponseObject(hoaDonService.tongTienTheoHoaDon(idhd));
    }
}