package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.exception.EntityNotFoundException;
import com.laptrinhjavaweb.response.HoaDonResponse;
import com.laptrinhjavaweb.resquest.HoaDonResquest;
import com.laptrinhjavaweb.service.IHoaDonService;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@RestController
@RequestMapping("/api/hoa-don-off")
public class HoaDonAPI {

    @Autowired
    private IHoaDonService hoaDonService;

    @PostMapping
    public ResponseEntity<?> created(@RequestBody HoaDonResquest hoaDonResquest){
        HoaDonResponse result = hoaDonService.save(hoaDonResquest);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @GetMapping("/{ma}")
    public ResponseEntity<?> detail(@PathVariable("ma") String ma){
        HoaDonResponse result = hoaDonService.findByMa(ma);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/find-by-status")
    public ResponseEntity<?> findByStatus(@RequestParam String trangThai){
        List<HoaDonResponse> result = hoaDonService.findByMaStatus(trangThai);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PutMapping()
    public ResponseEntity<?> update(@RequestBody HoaDonResquest hoaDonResquest){
        HoaDonResponse result = hoaDonService.update(hoaDonResquest);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @DeleteMapping("/{ma}")
    public ResponseEntity<?> delete(@PathVariable("ma") String ma){
        String result = hoaDonService.delete(ma);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/exportToExcel")
    public void exportToExcel(HttpServletResponse response,
                              @RequestParam(name = "trangThai", required = false) String trangThai) throws IOException {

        List<HoaDonResponse> hoaDonList = hoaDonService.findByMaStatus(trangThai);

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Danh sách hóa đơn");

        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Mã hóa đơn");
        header.createCell(1).setCellValue("Khách hàng");
        header.createCell(2).setCellValue("Nhân viên");
        header.createCell(3).setCellValue("Ngày mua");
        header.createCell(4).setCellValue("Tổng tiền hàng");
        header.createCell(5).setCellValue("Tổng tiền khách trả");
        header.createCell(6).setCellValue("Tiền thừa");
        // Tạo một CellStyle cho định dạng ngày tháng
        CellStyle dateStyle = workbook.createCellStyle();
        CreationHelper createHelper = workbook.getCreationHelper();
        dateStyle.setDataFormat(createHelper.createDataFormat().getFormat("dd-MM-yyyy"));

        int rowNum = 1;
        for (HoaDonResponse hoadon : hoaDonList) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(hoadon.getMa());
            row.createCell(1).setCellValue(hoadon.getTenKhachHang());
            row.createCell(2).setCellValue(hoadon.getTenNhanVien());
            // Đặt định dạng cho ô chứa ngày tháng
            Cell dateCell = row.createCell(3);
            dateCell.setCellValue(hoadon.getNgayTao());
            dateCell.setCellStyle(dateStyle);
            row.createCell(4).setCellValue(String.valueOf(hoadon.getTongTienHang()));
            row.createCell(5).setCellValue(String.valueOf(hoadon.getTienKhachTra()));

            Double calculateTienThua = hoadon.getTienKhachTra() - hoadon.getTongTienHang();
            row.createCell(6).setCellValue(String.valueOf(calculateTienThua));
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=DanhSachHoaDon.xlsx");

        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        outputStream.close();
    }

    @GetMapping("/search")
    public ResponseEntity<?> search(
            @RequestParam (name = "q") String param,
            @RequestParam String trangThai){
        List<HoaDonResponse> result = hoaDonService.searchs(param,trangThai);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PutMapping("/deleteStatus/{ma}")
    public ResponseEntity<?> deleteStatus(@PathVariable String ma, @RequestBody Long idHuyDon){
            hoaDonService.deleteStatus(ma, idHuyDon);
            return ResponseEntity.ok("Hủy đơn thành công");
    }
}
