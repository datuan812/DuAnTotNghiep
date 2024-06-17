package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.LyDoHuyDonConverter;
import com.laptrinhjavaweb.entity.LyDoHuyDonEntity;
import com.laptrinhjavaweb.repository.LyDoHuyDonRepository;
import com.laptrinhjavaweb.response.LyDoHuyDonReponse;
import com.laptrinhjavaweb.resquest.LyDoHuyDonResquest;
import com.laptrinhjavaweb.service.ILyDoHuyDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LyDoHuyDonService implements ILyDoHuyDonService {

    @Autowired
    private LyDoHuyDonConverter lyDoHuyDonConverter;

    @Autowired
    private LyDoHuyDonRepository lyDoHuyDonRepository;


    @Override
    @Transactional
    public LyDoHuyDonReponse insert(LyDoHuyDonResquest lyDoHuyDonResquest) {

        LyDoHuyDonEntity lyDoHuyDonEntity = lyDoHuyDonConverter.convertToEntity(lyDoHuyDonResquest);
        lyDoHuyDonRepository.save(lyDoHuyDonEntity);
        LyDoHuyDonReponse result = lyDoHuyDonConverter.convertToResponse(lyDoHuyDonEntity);
        return result;
    }
}
