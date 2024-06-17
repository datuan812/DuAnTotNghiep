package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.KhachHangConverter;
import com.laptrinhjavaweb.converter.TimKiemSanPhamConverter;
import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.repository.KhachHangRepository;
import com.laptrinhjavaweb.response.KhacHangResponse;
import com.laptrinhjavaweb.response.PageableResponse;
import com.laptrinhjavaweb.response.TimKiemSanPhamResponse;
import com.laptrinhjavaweb.resquest.KhachHangRequest;
import com.laptrinhjavaweb.service.IKhachHangService;
import com.laptrinhjavaweb.utils.GenerateRandomCode;
import com.laptrinhjavaweb.utils.GenerateStringUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class KhachHangService implements IKhachHangService {

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private KhachHangConverter khachHangConverter;

    @Autowired
    private TimKiemSanPhamConverter timKiemSanPhamConverter;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JavaMailSender javaMailSender;

    @Value("datnnhom@gmail.com") private String sender;

    @Override
    public void sendPassRandom(String recipient, String password) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(sender);
        mailMessage.setTo(recipient);
        mailMessage.setSubject("Mật khẩu của quý khách");
        mailMessage.setText("Quý khách sử dụng mật khẩu này để đăng nhập vào cửa hàng King Of Clothes: " + password);

        javaMailSender.send(mailMessage);
    }

    @Override
    public KhacHangResponse findBySoDienThoaiOrEmailAndTrangThai(String sodienThoai, String email, String trangThai) {
        KhachHangEntity khachHangEntity = khachHangRepository.findBySoDienThoaiOrEmailAndTrangThai(sodienThoai, email, trangThai);
        if (khachHangEntity == null) {
            return null;
        }
        KhacHangResponse result = khachHangConverter.convertToResponse(khachHangEntity);
        return result;
    }

    @Override
    public Map<String, Object> pagingOrSearchOrFindAll(Integer pageCurrent, Integer limit, String param) {
        Map<String, Object> results = new HashMap<>();
        Boolean isAll = false;
        Page<KhachHangEntity> page = null;
        List<KhacHangResponse> listKhachHangResponse = new ArrayList<>();
        if (pageCurrent == null && limit == null) {
            isAll = true;
            Pageable wholePage = Pageable.unpaged();
            page = khachHangRepository.findAllByTrangThaiNotOrderByNgayTaoDesc(SystemConstant.IN_ACTICE, wholePage);
        } else {
            Pageable pageable = PageRequest.of(pageCurrent - 1, limit);
            if (param != null) {
                List<KhachHangEntity> listKhachHangEntity = khachHangRepository.searchs(param);
                int sizeOflistKhachHangEntity = listKhachHangEntity.size();
                int start = (int) pageable.getOffset();
                int end = Math.min((start + pageable.getPageSize()), sizeOflistKhachHangEntity);
                List<KhachHangEntity> pageContent = listKhachHangEntity.subList(start, end);
                page = new PageImpl<>(pageContent, pageable, sizeOflistKhachHangEntity);

            } else {
                page = khachHangRepository.findAllByTrangThaiNotOrderByNgayTaoDesc(SystemConstant.IN_ACTICE, pageable);
            }
        }
        listKhachHangResponse = page.getContent().stream().map(
                item -> khachHangConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        results.put("data", listKhachHangResponse);
        if (!isAll) {
            PageableResponse pageableResponse = new PageableResponse();
            pageableResponse.setPageCurrent(pageCurrent);
            pageableResponse.setTotalPage(page.getTotalPages());
            results.put("meta", pageableResponse);
        }
        return results;
    }

    @Override
    public KhacHangResponse update(String ma, KhachHangRequest khachHangRequest) {
        KhachHangEntity khachHangEntity = khachHangRepository.findByMa(ma);

        if (khachHangEntity != null) {
            khachHangEntity.setTen(khachHangRequest.getTen().trim());
            khachHangEntity.setEmail(khachHangRequest.getEmail().trim());
            khachHangEntity.setSoDienThoai(khachHangRequest.getSoDienThoai().trim());
            khachHangEntity.setNgaySinh(khachHangRequest.getNgaySinh());
            khachHangEntity.setMoTa(khachHangRequest.getMoTa().trim());
            khachHangEntity.setGioiTinh(khachHangRequest.getGioiTinh());

            khachHangRepository.save(khachHangEntity);
            KhacHangResponse result = khachHangConverter.convertToResponse(khachHangEntity);
            return result;
        }
        return null;
    }

    @Override
    @Transactional
    public KhacHangResponse insert(KhachHangRequest khachHangRequest) {
        KhachHangEntity khachHangEntity = khachHangRepository.findBySoDienThoai(khachHangRequest.getSoDienThoai());
        if (khachHangEntity != null) {
            return null;
        }
        if(khachHangRequest.getEmail() != null && !khachHangRequest.getEmail().isEmpty()){
            if(khachHangRepository.findByEmail(khachHangRequest.getEmail()) != null){
                return null;
            }
        }
        khachHangEntity = khachHangConverter.convertToEntity(khachHangRequest);
        khachHangEntity.setMa(GenerateStringUtils.generateMa(khachHangRequest.getTen()));
        khachHangEntity.setTrangThai("ACTIVE");
        String randomMatKhau = GenerateRandomCode.generateRandomPassword();
        sendPassRandom(khachHangEntity.getEmail(), randomMatKhau);
        khachHangEntity.setMatKhau(passwordEncoder.encode(randomMatKhau));

        khachHangRepository.save(khachHangEntity);
        KhacHangResponse result = khachHangConverter.convertToResponse(khachHangEntity);
        result.setId(khachHangEntity.getId());
        return result;
    }

    @Override
    public void delete(String ma) {
        KhachHangEntity khachHangEntity = khachHangRepository.findByMa(ma);
        khachHangEntity.setTrangThai("INACTIVE");
        khachHangRepository.save(khachHangEntity);
    }

    @Override
    public KhacHangResponse getDetail(String ma) {
        KhachHangEntity khachHangEntity = khachHangRepository.findByMa(ma);
        if (khachHangEntity == null) {
            return null;
        }
        return khachHangConverter.convertToResponse(khachHangEntity);
    }


    @Override
    public List<KhacHangResponse> findAllAndTrangThai(
            String ma, String ten, String email, String soDienThoai, String gioiTinh, String moTa, String trangThai) {
        List<KhachHangEntity> entity = khachHangRepository
                .findAllByMaContainingOrTenContainingOrEmailContainingOrSoDienThoaiContainingOrGioiTinhContainingOrMoTaContainingAndTrangThai(ma, ten, email, soDienThoai, gioiTinh, moTa, SystemConstant.ACTICE);
        if (entity == null) {
            return null;
        }
        List<KhacHangResponse> result = entity.stream().map(
                item -> khachHangConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return result;
    }

    @Override
    public void importFromExcel(MultipartFile file) {
        try {
            InputStream inputStream = file.getInputStream();
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0);

            for (Row row : sheet) {
                if (row.getRowNum() == 0) {
                    // Skip the header row
                    continue;
                }

                KhachHangRequest khachHangRequest = new KhachHangRequest();
                khachHangRequest.setMa(row.getCell(0).getStringCellValue());
                khachHangRequest.setTen(row.getCell(1).getStringCellValue());
                khachHangRequest.setSoDienThoai(row.getCell(2).getStringCellValue());
                khachHangRequest.setEmail(row.getCell(3).getStringCellValue());
                khachHangRequest.setGioiTinh(row.getCell(4).getStringCellValue());

                java.util.Date utilDate = row.getCell(5).getDateCellValue();
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                khachHangRequest.setNgaySinh(sqlDate);
                khachHangRequest.setMoTa(row.getCell(6).getStringCellValue());

                // Call your existing service method to save the customer
                insert(khachHangRequest);
            }

            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<TimKiemSanPhamResponse> histosies(String ma) {
        KhachHangEntity khachHangEntity = khachHangRepository.findByMa(ma);
        List<TimKiemSanPhamResponse> results = khachHangEntity.getTimKiemSanPhamEntities().stream().map(
                item -> timKiemSanPhamConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return results;
    }

    @Override
    public KhacHangResponse register(KhachHangRequest khachHangRequest) {
        String xacNhanMatKhau = khachHangRequest.getXacNhanMatKhau();

        if (xacNhanMatKhau == null || !khachHangRequest.getMatKhau().equals(xacNhanMatKhau.trim())) {
            return null;
        }

        KhachHangEntity khachHangEntity = khachHangRepository.findBySoDienThoaiOrEmail(
                khachHangRequest.getSoDienThoai(), khachHangRequest.getEmail()
        );
        if (khachHangEntity != null) {
            return null;
        }

        String newPassword = passwordEncoder.encode(khachHangRequest.getMatKhau().trim());
        khachHangEntity = khachHangConverter.convertToEntity(khachHangRequest);
        khachHangEntity.setMa(GenerateStringUtils.generateMa(khachHangRequest.getTen()));
        khachHangEntity.setMatKhau(newPassword);
        khachHangRepository.save(khachHangEntity);

        KhacHangResponse result = khachHangConverter.convertToResponse(khachHangEntity);
        result.setId(khachHangEntity.getId());
        return result;
    }

    @Override
    public KhacHangResponse changePassword(KhachHangRequest khachHangRequest) {
        KhachHangEntity khachHangEntity = khachHangRepository.findByMa(khachHangRequest.getMa());
        String oldPassword = passwordEncoder.encode(khachHangRequest.getMatKhau().trim());
        if (passwordEncoder.matches(khachHangRequest.getMatKhau().trim(), khachHangEntity.getMatKhau())) {
            String newPassword = passwordEncoder.encode(khachHangRequest.getMatKhauMoi().trim());
            khachHangEntity.setMatKhau(newPassword);
            KhachHangEntity newKhachHangEntity = khachHangRepository.save(khachHangEntity);
            return khachHangConverter.convertToResponse(newKhachHangEntity);
        } else {
            return null;
        }

    }
}
