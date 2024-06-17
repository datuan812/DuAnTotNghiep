package com.laptrinhjavaweb.api.hoadon;

import com.laptrinhjavaweb.model.request.DiaChiGiaoHangRequest;
import com.laptrinhjavaweb.service.ThongTinMuaHangService;
import com.laptrinhjavaweb.utils.ResponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.LinkedHashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/user/ttgh")
@CrossOrigin(origins = "*")
public class ApiThongTinMuaHangController {
    @Autowired
    ThongTinMuaHangService thongTinMuaHangService;

    @Value("${tokenghn.string}")
    private String tokenghn;
    @Value("${urlghn.string}")
    private String urlGhn ;

    RestTemplate restTemplate = new RestTemplate();

    @PostMapping("/insert/{idkh}")
    public ResponseObject themThongTinGiaoHang(@PathVariable(name = "idkh")Long idkh, @RequestBody DiaChiGiaoHangRequest request){
        return new ResponseObject(thongTinMuaHangService.themDiaChiGiaoHang(idkh,request));
    }

    @PostMapping("/update/{idtt}")
    public ResponseObject suaThongTinGiaoHang(@PathVariable(name = "idtt")Long idttmh,@RequestBody DiaChiGiaoHangRequest request){
        return new ResponseObject(thongTinMuaHangService.suaDiaChiGiaoHang(idttmh,request));
    }

    @GetMapping("/findone/{idtt}")
    public ResponseObject findOneThongTinMuaHang(@PathVariable(name = "idtt")Long idtt){
        return new ResponseObject(thongTinMuaHangService.findThongTinMuaHangDefault(idtt));
    }
    @GetMapping("/default/{idkh}")
    public ResponseObject getDefaultThongTinGiaoHang(@PathVariable(name = "idkh")Long idkh){
        return new ResponseObject(thongTinMuaHangService.findThongTinMuaHangDefault(idkh));
    }

    @GetMapping("/dsthongtingiaohang/{idkh}")
    public ResponseObject dsThongTinGiaoHang(@PathVariable(name = "idkh")Long idkh){
        return new ResponseObject(thongTinMuaHangService.dsThongTinMuaHang(idkh));
    }
    @GetMapping("/findThongTinMuaHangById/{idttmh}")
    public ResponseObject findThongTinMuaHangById(@PathVariable(name = "idttmh")Long idtt){
        return new ResponseObject(thongTinMuaHangService.findThongTinMuaHangById(idtt));
    }

    @GetMapping("/thanhpho")
    public Object thanhPho() {
        final String uri = urlGhn+"/province";

        // Tạo HttpHeaders và đặt các header mà bạn muốn thêm
        HttpHeaders headers = new HttpHeaders();
        headers.set("Token", tokenghn); // Thay "HeaderName" và "HeaderValue" bằng giá trị thực tế

        // Tạo yêu cầu sử dụng HttpHeaders
        HttpEntity<Object> entity = new HttpEntity<>(headers);

        // Gọi API với yêu cầu có header
        ResponseEntity<Object> responseEntity = restTemplate.exchange(uri, HttpMethod.GET, entity, Object.class);

        Object result = responseEntity.getBody();
        return result;
    }

    @GetMapping("/huyen/{id}")
    public Object quanhuyen(@PathVariable(name = "id")Long id) {
        final String uri = urlGhn+"/district";

        // Tạo HttpHeaders và đặt các header
        HttpHeaders headers = new HttpHeaders();
        headers.set("Token", tokenghn);
        headers.setContentType(MediaType.APPLICATION_JSON);
// Tạo một Map để biểu diễn dữ liệu JSON
        Map<String, Object> requestBody = new LinkedHashMap<>();
        requestBody.put("province_id",id);
        // Sử dụng `requestBody` để truyền dữ liệu JSON
        // requestBody sẽ được tự động chuyển thành JSON bởi Spring Boot
        HttpEntity<Object> requestEntity = new HttpEntity<>(requestBody, headers);

        // Gọi API với yêu cầu POST và `requestBody`
        ResponseEntity<Object> responseEntity = restTemplate.exchange(uri, HttpMethod.POST, requestEntity, Object.class);

        Object result = responseEntity.getBody();
        return result;
    }

    @GetMapping("/xa/{id}")
    public Object xa(@PathVariable(name = "id")Long id) {
        final String uri = urlGhn+"/ward?district_id";

        // Tạo HttpHeaders và đặt các header
        HttpHeaders headers = new HttpHeaders();
        headers.set("Token", tokenghn);
        headers.setContentType(MediaType.APPLICATION_JSON);
// Tạo một Map để biểu diễn dữ liệu JSON
        Map<String, Object> requestBody = new LinkedHashMap<>();
        requestBody.put("district_id",id);
        // Sử dụng `requestBody` để truyền dữ liệu JSON
        // requestBody sẽ được tự động chuyển thành JSON bởi Spring Boot
        HttpEntity<Object> requestEntity = new HttpEntity<>(requestBody, headers);

        // Gọi API với yêu cầu POST và `requestBody`
        ResponseEntity<Object> responseEntity = restTemplate.exchange(uri, HttpMethod.POST, requestEntity, Object.class);

        Object result = responseEntity.getBody();
        return result;
    }
}
