package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.DanhMucConverter;
import com.laptrinhjavaweb.entity.DanhMucEntity;
import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.exception.EntityNotFoundException;
import com.laptrinhjavaweb.repository.DanhMucRepository;
import com.laptrinhjavaweb.response.DanhMucResponse;
import com.laptrinhjavaweb.response.KhacHangResponse;
import com.laptrinhjavaweb.response.PageableResponse;
import com.laptrinhjavaweb.resquest.DanhMucRequest;
import com.laptrinhjavaweb.resquest.KhachHangRequest;
import com.laptrinhjavaweb.service.IDanhMucService;
import com.laptrinhjavaweb.utils.GenerateStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class DanhMucService implements IDanhMucService {

    @Autowired
    private DanhMucRepository danhMucRepository;

    @Autowired
    private DanhMucConverter danhMucConverter;

    @Override
    public List<DanhMucResponse> findAllByTrangThai() {
        List<DanhMucResponse> results = danhMucRepository.findAllByTrangThai(SystemConstant.ACTICE).stream().map(
                item -> danhMucConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return results;
    }

    @Override
    public  Map<String, Object> pagingOrSearchOrFindAll(Integer pageCurrent, Integer limit, String param ){
        Map<String, Object> results = new HashMap<>();
        Boolean isAll = false;
        Page<DanhMucEntity> page = null;
        List<DanhMucResponse> listDanhMucResponse = new ArrayList<>();
        if(pageCurrent == null && limit == null) {
            isAll = true;
            Pageable wholePage = Pageable.unpaged();
            page = danhMucRepository.findAllByTrangThaiNotOrderByNgayTaoDesc(SystemConstant.IN_ACTICE, wholePage);
        }else {
            Pageable pageable = PageRequest.of(pageCurrent - 1, limit);
            if(param != null) {
                List<DanhMucEntity> listDanhMucEntity = danhMucRepository.searchs(param);
                int sizeOflistDanhMucEntity = listDanhMucEntity.size();
                int start = (int) pageable.getOffset();
                int end = Math.min((start + pageable.getPageSize()), sizeOflistDanhMucEntity);
                List<DanhMucEntity> pageContent = listDanhMucEntity.subList(start, end);
                page = new PageImpl<>(pageContent, pageable, sizeOflistDanhMucEntity);

            }else {
                page = danhMucRepository.findAllByTrangThaiNotOrderByNgayTaoDesc(SystemConstant.IN_ACTICE, pageable);
            }
        }
        listDanhMucResponse = page.getContent().stream().map(
                item -> danhMucConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        results.put("data", listDanhMucResponse);
        if(!isAll) {
            PageableResponse pageableResponse = new PageableResponse();
            pageableResponse.setPageCurrent(pageCurrent);
            pageableResponse.setTotalPage(page.getTotalPages());
            results.put("meta", pageableResponse);
        }
        return results;
    }

    @Override
    public DanhMucResponse create(DanhMucRequest danhMucRequest) {
        DanhMucEntity danhMucEntity = danhMucRepository.findBySlug(danhMucRequest.getSlug());
        if(danhMucEntity != null){
            return null;
        }
        danhMucEntity = danhMucConverter.convertToEntity(danhMucRequest);
        danhMucRepository.save(danhMucEntity);
        DanhMucResponse result = danhMucConverter.convertToResponse(danhMucEntity);
        result.setId(danhMucEntity.getId());
        return result;
    }

    @Override
    public void delete(String slug) {
        DanhMucEntity danhMucEntity = danhMucRepository.findBySlug(slug);
        danhMucEntity.setTrangThai("INACTIVE");
        danhMucRepository.save(danhMucEntity);
    }
}
