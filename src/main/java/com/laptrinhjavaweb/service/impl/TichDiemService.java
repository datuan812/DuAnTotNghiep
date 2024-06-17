package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.TichDiemConverter;
import com.laptrinhjavaweb.entity.TichDiemEntity;
import com.laptrinhjavaweb.repository.TichDiemRepository;
import com.laptrinhjavaweb.resquest.TichDiemRequest;
import com.laptrinhjavaweb.service.ITichDiemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TichDiemService implements ITichDiemService {

    @Autowired
    private TichDiemRepository tichDiemRepository;

    @Autowired
    private TichDiemConverter tichDiemConverter;

    @Override
    @Transactional
    public void update(TichDiemRequest request) {
        TichDiemEntity entity = tichDiemRepository.findByKhachHang_ma(request.getMaKhachHang());
        if(entity != null){
            entity.setSoDiem(entity.getSoDiem() - request.getSoDiemDung() + request.getSoDiemTichDuoc());
        }else{
            entity = tichDiemConverter.convertToEntity(request);
        }
        tichDiemRepository.save(entity);
    }



    @Override
    public Integer soDiemFindByKhachHang(String ma) {
        TichDiemEntity entity = tichDiemRepository.findByKhachHang_ma(ma);
        if(entity == null){
            return 0;
        }
        return entity.getSoDiem();
    }
}
