package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.response.KhacHangResponse;
import com.laptrinhjavaweb.response.TimKiemSanPhamResponse;
import com.laptrinhjavaweb.resquest.KhachHangRequest;
import com.laptrinhjavaweb.service.IKhachHangService;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/khach-hang")
public class KhachHangAPI {

    @Autowired
    private IKhachHangService khachHangService;

    @GetMapping("/search")
    public ResponseEntity<?> searchs(
            @RequestParam(name = "q") String param,
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit){
        Map<String, Object> results = khachHangService.pagingOrSearchOrFindAll(page, limit, param);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<?> pagination(@RequestParam(name = "page", defaultValue = "1") Integer page,
                                        @RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit
    ){
        Map<String, Object> results = khachHangService.pagingOrSearchOrFindAll(page, limit, null);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @GetMapping("/all")
    public ResponseEntity<?> findÁll(){
        Map<String, Object> results = khachHangService.pagingOrSearchOrFindAll(null, null, null);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<?> created(@RequestBody KhachHangRequest request){
        KhacHangResponse result = khachHangService.insert(request);
        if(result == null){
            throw new ClientError("Số điện thoại hoặc email đã tồn tại");
        }
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody KhachHangRequest khachHangRequest) {
        KhacHangResponse result = khachHangService.register(khachHangRequest);
        if(result == null){
            throw new ClientError("Số điện thoại hoặc email đã tồn tại");
        }
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @DeleteMapping("/{ma}")
    public ResponseEntity<?> delete(@PathVariable(name = "ma") String ma){
        khachHangService.delete(ma);
        return new ResponseEntity<>("Xóa thành công", HttpStatus.OK);
    }

    @GetMapping("/{ma}")
    public ResponseEntity<?> findByMa(@PathVariable String ma) {
        KhacHangResponse result = khachHangService.getDetail(ma);
        if (result == null) {
            return new ResponseEntity<>("Khách hàng không tồn tại", HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PutMapping("/{ma}")
    public ResponseEntity<?> updateKhachHang(@PathVariable String ma, @RequestBody KhachHangRequest khachHangRequest) {
        KhacHangResponse result = khachHangService.update(ma, khachHangRequest);

        if (result != null) {
            return ResponseEntity.ok(result); 
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy khách hàng với mã " + ma);
        }
    }

    @GetMapping("/exportToExcel")
    public void exportToExcel(HttpServletResponse response,
                              @RequestParam(name = "ma", required = false) String ma,
                              @RequestParam(name = "ten", required = false) String ten,
                              @RequestParam(name = "email", required = false) String email,
                              @RequestParam(name = "soDienThoai", required = false) String soDienThoai,
                              @RequestParam(name = "gioiTinh", required = false) String gioiTinh,
                              @RequestParam(name = "moTa", required = false) String moTa) throws IOException {
        List<KhacHangResponse> customers = khachHangService.findAllAndTrangThai(ma, ten, email, soDienThoai, gioiTinh, moTa, SystemConstant.ACTICE);

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Danh sách khách hàng");

        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Mã KH");
        header.createCell(1).setCellValue("Họ và tên");
        header.createCell(2).setCellValue("SDT");
        header.createCell(3).setCellValue("Email");
        header.createCell(4).setCellValue("Giới tính");
        header.createCell(5).setCellValue("Ngày sinh");
        header.createCell(6).setCellValue("Mô tả");

        // Tạo một CellStyle cho định dạng ngày tháng
        CellStyle dateStyle = workbook.createCellStyle();
        CreationHelper createHelper = workbook.getCreationHelper();
        dateStyle.setDataFormat(createHelper.createDataFormat().getFormat("dd-MM-yyyy"));

        int rowNum = 1;
        for (KhacHangResponse khachHang : customers) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(khachHang.getMa());
            row.createCell(1).setCellValue(khachHang.getTen());
            row.createCell(2).setCellValue(khachHang.getSoDienThoai());
            row.createCell(3).setCellValue(khachHang.getEmail());
            row.createCell(4).setCellValue(khachHang.getGioiTinh());
            // Đặt định dạng cho ô chứa ngày tháng
            Cell dateCell = row.createCell(5);
            dateCell.setCellValue(khachHang.getNgaySinh());
            dateCell.setCellStyle(dateStyle);
            row.createCell(6).setCellValue(khachHang.getMoTa());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=Customer.xlsx");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        outputStream.close();
    }

    @PostMapping("/import")
    public ResponseEntity<String> importCustomers(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return new ResponseEntity<>("Tệp không được để trống", HttpStatus.BAD_REQUEST);
        }

        try {
            khachHangService.importFromExcel(file);
            return new ResponseEntity<>("Dữ liệu đã được import thành công", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Lỗi khi import dữ liệu từ tệp Excel: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/histories")
    public ResponseEntity<?> historiesSerach (@RequestParam(name = "ma") String ma){
        List<TimKiemSanPhamResponse> results = khachHangService.histosies(ma);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @PutMapping("/doi-mat-khau")
    public ResponseEntity<?> changePass(@RequestBody KhachHangRequest khachHangRequest) {
        KhacHangResponse result = khachHangService.changePassword(khachHangRequest);
        if(result == null){
            throw new ClientError("Mật khẩu cũ không đúng!");
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
