package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.GiaTriThuocTinhConverter;
import com.laptrinhjavaweb.entity.GiaTriThuocTinhEntity;
import com.laptrinhjavaweb.repository.GiaTriThuocTinhRepository;
import com.laptrinhjavaweb.resquest.GiaTriThuocTinhRequest;
import com.laptrinhjavaweb.service.IGiaTriThuocTinhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GiaTriThuocTinhService implements IGiaTriThuocTinhService {

    @Autowired
    private GiaTriThuocTinhRepository giaTriThuocTinhRepository;

    @Autowired
    private GiaTriThuocTinhConverter giaTriThuocTinhConverter;

    @Transactional
    @Override
    public void save(GiaTriThuocTinhRequest request) {
        GiaTriThuocTinhEntity entity = giaTriThuocTinhConverter.convertToEntity(request);
        giaTriThuocTinhRepository.save(entity);
    }
}
