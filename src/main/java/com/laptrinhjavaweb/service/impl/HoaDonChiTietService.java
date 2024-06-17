package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.HoaDonChiTietConverter;
import com.laptrinhjavaweb.entity.HoaDonChiTietEntity;
import com.laptrinhjavaweb.entity.KhuyenMaiEntity;
import com.laptrinhjavaweb.entity.KhuyenMaiSanPhamEntity;
import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.repository.HoaDonChiTietRepository;
import com.laptrinhjavaweb.repository.KhuyenMaiRepository;
import com.laptrinhjavaweb.response.HoaDonChiTietResponse;
import com.laptrinhjavaweb.resquest.HoaDonChiTietRequest;
import com.laptrinhjavaweb.service.IHoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class HoaDonChiTietService implements IHoaDonChiTietService {

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private HoaDonChiTietConverter hoaDonChiTietConverter;

    @Autowired
    private KhuyenMaiRepository khuyenMaiRepository;

    @Transactional
    @Override
    public void save(HoaDonChiTietRequest hoaDonChiTietRequest) {
        HoaDonChiTietEntity entity = hoaDonChiTietConverter.convertToEntity(hoaDonChiTietRequest);
        HoaDonChiTietEntity hoaDonChiTietEntity = hoaDonChiTietRepository.findByHoaDon_maAndSanPham_idAndBienThe_id(hoaDonChiTietRequest.getMaHoaDon(),
                hoaDonChiTietRequest.getIdSanPham(), hoaDonChiTietRequest.getIdBienThe());

        if(hoaDonChiTietEntity != null){
            Integer quantity = entity.getSanPham().getSoLuong();
            if(entity.getBienThe() != null) {
                quantity = entity.getBienThe().getSoLuong();
            }
            if(hoaDonChiTietRequest.getSoLuong() > quantity){
               throw new ClientError("Vui lòng giảm số lượng sản phẩm mua hoặc kiểm tra lại số lượng sản phẩm có sẵn");
            }
            if(entity.getSoTienGiam() != null){
                Double soTienGiamLanDau = hoaDonChiTietEntity.getSoTienGiam() / hoaDonChiTietEntity.getSoLuong();
                hoaDonChiTietEntity.setSoTienGiam(soTienGiamLanDau * hoaDonChiTietRequest.getSoLuong());
            }
            hoaDonChiTietEntity.setSoLuong(hoaDonChiTietEntity.getSoLuong() + 1);
            hoaDonChiTietEntity.setThanhTien(hoaDonChiTietEntity.getGia() * hoaDonChiTietEntity.getSoLuong());
            hoaDonChiTietEntity.setTenBienThe(hoaDonChiTietEntity.getBienThe().getTen());
            hoaDonChiTietRepository.save(hoaDonChiTietEntity);
        }else{
            entity.setTenBienThe(entity.getBienThe().getTen());
            hoaDonChiTietRepository.save(entity);
        }
    }

    @Override
    @Transactional
    public void update(Long id, Integer soLuong) {
        HoaDonChiTietEntity entity = hoaDonChiTietRepository.findById(id).get();
        if(entity.getSoTienGiam() != null){
            Double soTienGiamLanDau = entity.getSoTienGiam() / entity.getSoLuong();
            entity.setSoTienGiam(soTienGiamLanDau * soLuong);
        }
        entity.setSoLuong(soLuong);
        entity.setThanhTien(entity.getGia() * soLuong);
        Integer quantity = entity.getSanPham().getSoLuong();
        if(entity.getBienThe() != null){
            quantity = entity.getBienThe().getSoLuong();
        }
        if(entity.getSoLuong() > quantity){
            throw new ClientError("Vui lòng giảm số lượng sản phẩm mua hoặc kiểm tra lại số lượng sản phẩm có sẵn");
        }

        hoaDonChiTietRepository.save(entity);
    }

    @Override
    public HoaDonChiTietResponse findById(Long id) {
        HoaDonChiTietEntity hoaDonChiTietEntity = hoaDonChiTietRepository.findById(id).get();
        return hoaDonChiTietConverter.convertToResponse(hoaDonChiTietEntity);
    }

    @Override
    public void delete(Long id) {
        hoaDonChiTietRepository.deleteById(id);
    }
}
