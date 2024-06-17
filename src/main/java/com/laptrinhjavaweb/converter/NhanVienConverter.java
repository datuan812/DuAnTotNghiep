package com.laptrinhjavaweb.converter;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.entity.ChucVuEntity;
import com.laptrinhjavaweb.entity.NhanVienEntity;
import com.laptrinhjavaweb.repository.ChucVuRepository;
import com.laptrinhjavaweb.response.ChucVuResponse;
import com.laptrinhjavaweb.response.NhanVienResponse;
import com.laptrinhjavaweb.resquest.NhanVienRequest;

@Component
public class NhanVienConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private ChucVuRepository chucVuRepository;
    
    @Autowired
    private ChucVuConverter chucVuConverter;
   
    public NhanVienResponse convertToResponse(NhanVienEntity entity){
        NhanVienResponse response = modelMapper.map(entity, NhanVienResponse.class);
        ChucVuResponse chucVuResponse = chucVuConverter.convertToResponse(entity.getChucVu());
        response.setChucVu(chucVuResponse);
        return response;
    }

    public NhanVienEntity convertToEntity(NhanVienRequest request){
        NhanVienEntity entity = modelMapper.map(request, NhanVienEntity.class);
        ChucVuEntity chucVuEntity = chucVuRepository.findByMa(request.getMaChucVu());
        entity.setChucVu(chucVuEntity);
        return entity;
    }
}
