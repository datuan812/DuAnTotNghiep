package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.XoaBienTheConverter;
import com.laptrinhjavaweb.repository.XoaBienTheRepository;
import com.laptrinhjavaweb.response.XoaBienTheResponse;
import com.laptrinhjavaweb.service.IXoaBienTheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class XoaBienTheService implements IXoaBienTheService {

    @Autowired
    private XoaBienTheRepository xoaBienTheRepository;

    @Autowired
    private XoaBienTheConverter xoaBienTheConverter;

    @Override
    public List<XoaBienTheResponse> findAllByMaKhachHang(String maKhachHang) {
        List<XoaBienTheResponse> result = xoaBienTheRepository.findAllByMaKhachHang(maKhachHang).stream().map(
                item -> xoaBienTheConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return result;
    }

    @Override
    public List<XoaBienTheResponse> findAllByMaHoaDon(String maHoaDon) {
        List<XoaBienTheResponse> result = xoaBienTheRepository.findAllByMaHoaDon(maHoaDon).stream().map(
                item -> xoaBienTheConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return result;
    }

    @Override
    public void deleteBienThe(Long id) {
        xoaBienTheRepository.deleteById(id);
    }
}
