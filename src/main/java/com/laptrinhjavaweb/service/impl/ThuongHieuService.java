package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.ThuongHieuConverter;
import com.laptrinhjavaweb.entity.ThuongHieuEntity;
import com.laptrinhjavaweb.repository.ThuongHieuRepository;
import com.laptrinhjavaweb.response.PageableResponse;
import com.laptrinhjavaweb.response.ThuongHieuResponse;
import com.laptrinhjavaweb.resquest.ThuongHieuRequest;
import com.laptrinhjavaweb.service.IThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ThuongHieuService implements IThuongHieuService {

    @Autowired
    private ThuongHieuRepository thuongHieuRepository;

    @Autowired
    private ThuongHieuConverter thuongHieuConverter;

    @Override
    public List<ThuongHieuResponse> findAllByTrangThai() {
        List<ThuongHieuResponse> results = thuongHieuRepository.findAllByTrangThai(SystemConstant.ACTICE).stream().map(
                item -> thuongHieuConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return results;
    }

    @Override
    public Map<String, Object> pagingOrSearchOrFindAll(Integer pageCurrent, Integer limit, String param) {
        Map<String, Object> results = new HashMap<>();
        Boolean isAll = false;
        Page<ThuongHieuEntity> page = null;
        List<ThuongHieuResponse> listThuongHieuResponse = new ArrayList<>();
        if(pageCurrent == null && limit == null) {
            isAll = true;
            Pageable wholePage = Pageable.unpaged();
            page = thuongHieuRepository.findAllByTrangThaiNotOrderByNgayTaoDesc(SystemConstant.IN_ACTICE, wholePage);
        }else {
            Pageable pageable = PageRequest.of(pageCurrent - 1, limit);
            if(param != null) {
                List<ThuongHieuEntity> listThuongHieuEntity = thuongHieuRepository.searchs(param);
                int sizeOflistThuongHieuEntity = listThuongHieuEntity.size();
                int start = (int) pageable.getOffset();
                int end = Math.min((start + pageable.getPageSize()), sizeOflistThuongHieuEntity);
                List<ThuongHieuEntity> pageContent = listThuongHieuEntity.subList(start, end);
                page = new PageImpl<>(pageContent, pageable, sizeOflistThuongHieuEntity);

            }else {
                page = thuongHieuRepository.findAllByTrangThaiNotOrderByNgayTaoDesc(SystemConstant.IN_ACTICE, pageable);
            }
        }
        listThuongHieuResponse = page.getContent().stream().map(
                item -> thuongHieuConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        results.put("data", listThuongHieuResponse);
        if(!isAll) {
            PageableResponse pageableResponse = new PageableResponse();
            pageableResponse.setPageCurrent(pageCurrent);
            pageableResponse.setTotalPage(page.getTotalPages());
            results.put("meta", pageableResponse);
        }
        return results;
    }

    @Override
    public ThuongHieuResponse create(ThuongHieuRequest thuongHieuRequest) {
        ThuongHieuEntity thuongHieuEntity = thuongHieuRepository.findBySlug(thuongHieuRequest.getSlug());
        if(thuongHieuEntity != null){
            return null;
        }
        thuongHieuEntity = thuongHieuConverter.convertToEntity(thuongHieuRequest);
        thuongHieuRepository.save(thuongHieuEntity);
        ThuongHieuResponse result = thuongHieuConverter.convertToResponse(thuongHieuEntity);
        result.setId(thuongHieuEntity.getId());
        return result;
    }

    @Override
    public void delete(String slug) {
        ThuongHieuEntity thuongHieuEntity = thuongHieuRepository.findBySlug(slug);
        thuongHieuEntity.setTrangThai("INACTIVE");
        thuongHieuRepository.save(thuongHieuEntity);
    }
}
