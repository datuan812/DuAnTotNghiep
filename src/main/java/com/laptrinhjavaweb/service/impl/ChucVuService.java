package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.ChucVuConverter;
import com.laptrinhjavaweb.entity.ChucVuEntity;
import com.laptrinhjavaweb.repository.ChucVuRepository;
import com.laptrinhjavaweb.response.ChucVuResponse;
import com.laptrinhjavaweb.resquest.ChucVuRequest;
import com.laptrinhjavaweb.service.IChucVuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ChucVuService implements IChucVuService {

    @Autowired
    private ChucVuRepository chucVuRepository;

    @Autowired
    private ChucVuConverter chucVuConverter;

    @Override
    public ChucVuResponse findByMa(String ma) {
        ChucVuEntity chucVuEntity = chucVuRepository.findByMa(ma);
        if(chucVuEntity == null){
            return null;
        }
        ChucVuResponse result = chucVuConverter.convertToResponse(chucVuEntity);
        return result;
    }

    @Override
    public ChucVuResponse save(ChucVuRequest chucVuRequest) {
        ChucVuEntity chucVuEntity = chucVuRepository.findByTen(
                chucVuRequest.getTen()
        );
        if(chucVuEntity != null){
            return null;
        }
        chucVuEntity = chucVuConverter.convertToEntity(chucVuRequest);
        chucVuEntity.setMa("STAFF");
        chucVuEntity.setTrangThai("ACTIVE");
        chucVuRepository.save(chucVuEntity);
        ChucVuResponse result = chucVuConverter.convertToResponse(chucVuEntity);
        return result;
    }

    @Override
    public List<ChucVuResponse> getDSChucVu() {
        List<ChucVuEntity> entity = chucVuRepository.findAll();

        List<ChucVuResponse> result = entity.stream().map(
                item ->
                        chucVuConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return result;
    }


}
