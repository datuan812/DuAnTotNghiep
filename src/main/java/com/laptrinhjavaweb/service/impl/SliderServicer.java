package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.SliderConverter;
import com.laptrinhjavaweb.entity.SliderEntity;
import com.laptrinhjavaweb.repository.SliderRepository;
import com.laptrinhjavaweb.response.PageableResponse;
import com.laptrinhjavaweb.response.SliderResponse;
import com.laptrinhjavaweb.resquest.SliderRequest;
import com.laptrinhjavaweb.service.ISliderService;
import com.laptrinhjavaweb.utils.GenerateStringUtils;
import com.laptrinhjavaweb.utils.UploadFileUtils;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class SliderServicer implements ISliderService {

    @Autowired
    private SliderRepository sliderRepository;

    @Autowired
    private UploadFileUtils uploadFileUtils;

    @Autowired
    private SliderConverter sliderConverter;

    @Override
    public Map<String, Object> pagingOrFindAll(Integer pageCurrent, Integer limit ){
        Map<String, Object> results = new HashMap<>();
        Boolean isAll = false;
        Page<SliderEntity> page = null;
        List<SliderResponse> listSliderResponse = new ArrayList<>();
        if(pageCurrent == null && limit == null) {
            isAll = true;
            Pageable wholePage = Pageable.unpaged();
            page = sliderRepository.findAllByTrangThaiNotOrderByNgayTaoDesc(SystemConstant.IN_ACTICE,wholePage);
        }else {
            Pageable pageable = PageRequest.of(pageCurrent - 1, limit);
            page = sliderRepository.findAllByTrangThaiNotOrderByNgayTaoDesc(SystemConstant.IN_ACTICE,pageable);
        }
        listSliderResponse = page.getContent().stream().map(
                item -> sliderConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        results.put("data", listSliderResponse);
        if(!isAll) {
            PageableResponse pageableResponse = new PageableResponse();
            pageableResponse.setPageCurrent(pageCurrent);
            pageableResponse.setTotalPage(page.getTotalPages());
            results.put("meta", pageableResponse);
        }
        return results;
    }

    @Override
    public SliderResponse save(SliderRequest sliderRequest) {
        SliderEntity sliderEntity = sliderRepository.findByImage(sliderRequest.getImage());

        if (sliderEntity != null) {
            return null;
        }
        if (sliderRequest.getBase64() != null) {
            sliderRequest.setImage(GenerateStringUtils.generate(6) + ".jpg");
            saveImage(sliderRequest);
        }
        sliderEntity = sliderConverter.convertToEntity(sliderRequest);
        sliderRepository.save(sliderEntity);
        SliderResponse result = sliderConverter.convertToResponse(sliderEntity);
        return result;
    }

    @Override
    public void delete(Long id) {
        SliderEntity sliderEntity = sliderRepository.findById(id).get();
        sliderEntity.setTrangThai("INACTIVE");
        sliderRepository.save(sliderEntity);
    }

    public void saveImage(SliderRequest sliderRequest) {
        String path = SystemConstant.path + "/"  + sliderRequest.getImage();
        if (sliderRequest.getBase64() != null) {
            byte[] bytes = Base64.decodeBase64(sliderRequest.getBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
        }
    }
}
