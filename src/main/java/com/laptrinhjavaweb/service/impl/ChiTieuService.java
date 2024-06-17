package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.ChiTieuConvert;
import com.laptrinhjavaweb.entity.ChiTieuEntity;
import com.laptrinhjavaweb.repository.ChiTieuRepository;
import com.laptrinhjavaweb.response.ChiTieuResponse;
import com.laptrinhjavaweb.service.IChiTieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
@Service
public class ChiTieuService implements IChiTieuService {

    @Autowired
    private ChiTieuRepository chiTieuRepository;

    @Autowired
    private ChiTieuConvert chiTieuConvert;

    @Override
    public List<ChiTieuResponse> findByIdVi(Long idVi) {
        List<ChiTieuEntity> list = chiTieuRepository.findByIdVi(idVi);
        List<ChiTieuResponse> responses = list.stream().map(
                item -> chiTieuConvert.convertToResponse(item)
        ).collect(Collectors.toList());
        return responses;
    }
}
