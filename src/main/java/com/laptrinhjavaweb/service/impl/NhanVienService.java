package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.NhanVienConverter;
import com.laptrinhjavaweb.entity.ChucVuEntity;
import com.laptrinhjavaweb.entity.NhanVienEntity;
import com.laptrinhjavaweb.repository.ChucVuRepository;
import com.laptrinhjavaweb.repository.NhanVienRepository;
import com.laptrinhjavaweb.response.MyUserResponse;
import com.laptrinhjavaweb.response.NhanVienResponse;
import com.laptrinhjavaweb.response.PageableResponse;
import com.laptrinhjavaweb.resquest.NhanVienRequest;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.INhanVienService;
import com.laptrinhjavaweb.utils.GenerateStringUtils;
import com.laptrinhjavaweb.utils.UploadFileUtils;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class NhanVienService implements INhanVienService {
    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private NhanVienConverter nhanVienConverter;

    @Autowired
    private UploadFileUtils uploadFileUtils;

    @Autowired
    private ChucVuRepository chucVuRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public NhanVienResponse findByMaAndTrangThai(String ma, String trangThai) {
        NhanVienEntity nhanVienEntity = nhanVienRepository.findByMaAndTrangThai(ma, trangThai);
        if(nhanVienEntity == null){
            return null;
        }
        NhanVienResponse nhanVienResponse = nhanVienConverter.convertToResponse(nhanVienEntity);
        return nhanVienResponse;
    }

    @Override
    public NhanVienResponse save(NhanVienRequest nhanVienRequest) {
        NhanVienEntity nhanVienEntity = nhanVienRepository.findBySoDienThoaiOrEmailOrCanCuocCongDan(
                nhanVienRequest.getSoDienThoai(), nhanVienRequest.getEmail(), nhanVienRequest.getCanCuocCongDan()
        );
        if (nhanVienEntity != null) {
            return null;
        }
        if (nhanVienRequest.getBase64() != null) {
            nhanVienRequest.setAnh(GenerateStringUtils.generate(6) + ".jpg");
            saveImage(nhanVienRequest);
        }
        nhanVienEntity = nhanVienConverter.convertToEntity(nhanVienRequest);
        nhanVienEntity.setMa(GenerateStringUtils.generateMa(nhanVienRequest.getTen()));
        nhanVienEntity.setMatKhau(passwordEncoder.encode("123456"));
        nhanVienRepository.save(nhanVienEntity);
        nhanVienEntity.setTrangThai("INACTIVE");
        nhanVienRepository.save(nhanVienEntity);
        NhanVienResponse result = nhanVienConverter.convertToResponse(nhanVienEntity);
        return result;
    }

    @Override
    public NhanVienResponse getDetail(String ma) {
        NhanVienEntity nhanVienEntity = nhanVienRepository.findByMa(ma);
        if (nhanVienEntity == null) {
            return null;
        }
        return nhanVienConverter.convertToResponse(nhanVienEntity);
    }

    @Override
    public NhanVienResponse update(String ma, NhanVienRequest nhanVienRequest) {
        NhanVienEntity nhanVienEntity = nhanVienRepository.findByMa(ma);

        if (nhanVienEntity != null) {
            nhanVienEntity.setTen(nhanVienRequest.getTen().trim());
            nhanVienEntity.setEmail(nhanVienRequest.getEmail().trim());
            nhanVienEntity.setSoDienThoai(nhanVienRequest.getSoDienThoai().trim());
            nhanVienEntity.setNgaySinh(nhanVienRequest.getNgaySinh());
            nhanVienEntity.setDiaChi(nhanVienRequest.getDiaChi().trim());
            nhanVienEntity.setGioiTinh(nhanVienRequest.getGioiTinh());
            nhanVienEntity.setCanCuocCongDan(nhanVienRequest.getCanCuocCongDan().trim());
            nhanVienEntity.setNgayCap(nhanVienRequest.getNgayCap());

            ChucVuEntity chucVuEntity = chucVuRepository.findByMa(nhanVienRequest.getMaChucVu());
            nhanVienEntity.setChucVu(chucVuEntity);
            
            nhanVienRepository.save(nhanVienEntity);
            NhanVienResponse result = nhanVienConverter.convertToResponse(nhanVienEntity);
            return result;
        }
        return null;
    }

    @Override
    public Map<String, Object> pagingOrSearchOrFindAll(Integer pageCurrent, Integer limit, String role, String param ){
        MyUserResponse myUserResponse = SecurityUtils.getPrincipal();
        String ma = myUserResponse.getMa();
        Map<String, Object> results = new HashMap<>();
        Boolean isAll = false;
        Page<NhanVienEntity> page = null;
        List<NhanVienResponse> listNhanVienResponse = new ArrayList<>();
        if(pageCurrent == null && limit == null) {
            isAll = true;
            Pageable wholePage = Pageable.unpaged();
            page = nhanVienRepository.findAllByTrangThaiNotAndAndMaNotOrderByNgayTaoDesc(SystemConstant.DELETE, ma, wholePage);
        }else {
            Pageable pageable = PageRequest.of(pageCurrent - 1, limit);
            if(param != null) {
                List<NhanVienEntity> listNhanVienEntity = nhanVienRepository.searchs(param, ma);
                int sizeOflistNhanVienEntity = listNhanVienEntity.size();
                int start = (int) pageable.getOffset();
                int end = Math.min((start + pageable.getPageSize()), sizeOflistNhanVienEntity);
                List<NhanVienEntity> pageContent = listNhanVienEntity.subList(start, end);
                page = new PageImpl<>(pageContent, pageable, sizeOflistNhanVienEntity);

            }else {
                page = nhanVienRepository.findAllByTrangThaiNotAndAndMaNotOrderByNgayTaoDesc(SystemConstant.DELETE, ma, pageable);
            }
        }
        listNhanVienResponse = page.getContent().stream().map(
                item -> nhanVienConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        results.put("data", listNhanVienResponse);
        if(!isAll) {
            PageableResponse pageableResponse = new PageableResponse();
            pageableResponse.setPageCurrent(pageCurrent);
            pageableResponse.setTotalPage(page.getTotalPages());
            results.put("meta", pageableResponse);
        }
        return results;
    }

    public void saveImage(NhanVienRequest nhanVienRequest) {
        String path = SystemConstant.path + "/"  + nhanVienRequest.getAnh();
        if (nhanVienRequest.getBase64() != null) {
            byte[] bytes = Base64.decodeBase64(nhanVienRequest.getBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
        }
    }

    @Override
    public void delete(String ma) {
        NhanVienEntity nhanVienEntity = nhanVienRepository.findByMa(ma);
        nhanVienEntity.setTrangThai("DELETE");
        nhanVienRepository.save(nhanVienEntity);
    }

    @Override
    public NhanVienResponse moCa(String ma) {
        NhanVienEntity nhanVienEntity = nhanVienRepository.findByMa(ma);
        nhanVienEntity.setTrangThai(SystemConstant.ACTICE);
        nhanVienRepository.save(nhanVienEntity);
        return nhanVienConverter.convertToResponse(nhanVienEntity);
    }

    @Override
    public NhanVienResponse dongCa(String ma) {
        NhanVienEntity nhanVienEntity = nhanVienRepository.findByMa(ma);
        nhanVienEntity.setTrangThai(SystemConstant.IN_ACTICE);
        nhanVienRepository.save(nhanVienEntity);
        return nhanVienConverter.convertToResponse(nhanVienEntity);
    }


}
