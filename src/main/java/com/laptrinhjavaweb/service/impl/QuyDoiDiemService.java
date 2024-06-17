package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.QuyDoiDiemConverter;
import com.laptrinhjavaweb.entity.QuyDoiDiemEntity;
import com.laptrinhjavaweb.repository.QuyDoiDiemRepository;
import com.laptrinhjavaweb.response.QuyDoiDiemResponse;
import com.laptrinhjavaweb.resquest.QuyDoiDiemRequest;
import com.laptrinhjavaweb.service.IQuyDoiDiemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class QuyDoiDiemService implements IQuyDoiDiemService {

    @Autowired
    private QuyDoiDiemRepository quyDoiDiemRepository;

    @Autowired
    private QuyDoiDiemConverter quyDoiDiemConverter;


    @Override
    public List<QuyDoiDiemResponse> getAll() {
        List<QuyDoiDiemEntity> entity = quyDoiDiemRepository.findAll();

        List<QuyDoiDiemResponse> result = entity.stream().map(
                item ->
                        quyDoiDiemConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return result;
    }

    @Override
    public List<QuyDoiDiemResponse> saveOrUpdate(List<QuyDoiDiemRequest> requests) {
        List<QuyDoiDiemResponse> resuluts = requests.stream().map(
                item -> {
                    QuyDoiDiemEntity entity = quyDoiDiemConverter.convertToEntity(item);
                    if(item.getLoai().equals("TIENQUYDIEM")){
                        entity.setLoai("TIENQUYDIEM");
                    }else{
                        entity.setLoai("DIEMQUYTIEN");
                    }
                    quyDoiDiemRepository.save(entity);
                    return quyDoiDiemConverter.convertToResponse(entity);
                }
        ).collect(Collectors.toList());
        return resuluts;
    }

    public double DiemQuyRaTien(int diem) {
        QuyDoiDiemEntity quyDoiDiem = quyDoiDiemRepository.findByLoai("DIEMQUYTIEN");
        return diem * quyDoiDiem.getTien() / quyDoiDiem.getDiem();
    }

    public Integer TienQuyDiem(double tien) {
        QuyDoiDiemEntity quyDoiDiem = quyDoiDiemRepository.findByLoai("TIENQUYDIEM");
        return (int)(tien * quyDoiDiem.getDiem() / quyDoiDiem.getTien());
    }

}
