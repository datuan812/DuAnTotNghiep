package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.BienTheConverter;
import com.laptrinhjavaweb.converter.HoaDonConverter;
import com.laptrinhjavaweb.entity.*;
import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.model.enumentity.TrangThaiHoaDonEnum;
import com.laptrinhjavaweb.repository.*;
import com.laptrinhjavaweb.response.BienTheResponse;
import com.laptrinhjavaweb.response.HoaDonResponse;
import com.laptrinhjavaweb.resquest.HoaDonResquest;
import com.laptrinhjavaweb.service.IHoaDonService;
import com.laptrinhjavaweb.utils.GenerateStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class HoaDonService implements IHoaDonService {

    @Autowired
    private HoaDonConverter hoaDonConverter;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private TrangThaiGiaoHangRepository trangThaiGiaoHangRepository;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private BienTheRepository bienTheRepository;

    @Autowired
    private TichDiemRepository tichDiemRepository;

    @Autowired
    private LichSuTichDiemRepository lichSuTichDiemRepository;

    @Autowired
    private LyDoHuyDonRepository lyDoHuyDonRepository;

    @Autowired
    private BienTheConverter bienTheConverter;

    @Autowired
    private KhuyenMaiRepository khuyenMaiRepository;


    @Override
    @Transactional
    public HoaDonResponse save(HoaDonResquest hoaDonResquest) {
        HoaDonEntity entity = hoaDonConverter.convertToEntity(hoaDonResquest);
        entity.setTrangThai(TrangThaiHoaDonEnum.TREO);
        entity.setMa(GenerateStringUtils.generate(6));
        hoaDonRepository.save(entity);
        HoaDonResponse result = hoaDonConverter.convertToResponse(entity);
        return result;
    }

    @Override
    public HoaDonResponse findByMa(String ma) {
        HoaDonEntity entity = hoaDonRepository.findByMa(ma);
        HoaDonResponse result = hoaDonConverter.convertToResponse(entity);
        return result;
    }

    @Override
    public List<HoaDonResponse> findByMaStatus(String trangThai) {
        List<HoaDonEntity> list = hoaDonRepository.findAllByTrangThaiAndNhanVien_IdNotNullOrderByNgayTaoDesc(trangThai);
        List<HoaDonResponse> result = list.stream().map(
                item -> hoaDonConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return result;
    }

    @Override
    @Transactional
    public HoaDonResponse update(HoaDonResquest hoaDonResquest) {
        String trangThai = hoaDonResquest.getTrangThai();
        HoaDonEntity entity = hoaDonConverter.convertToEntity(hoaDonResquest);
        if (trangThai.equals("THANHCONG")) {
            List<HoaDonChiTietEntity> hoaDonChiTietEntities = hoaDonChiTietRepository.findAllByHoaDon_ma(hoaDonResquest.getMa());
            hoaDonChiTietEntities.forEach(
                    item -> {
                        BienTheEntity bienTheEntity = item.getBienThe();
                        if(!item.getGia().equals(bienTheEntity.getGia())){
                            BienTheResponse bienTheResponse = bienTheConverter.convertToResponse(bienTheEntity);
                            item.setGia(bienTheResponse.getGiaBan());
                            item.setThanhTien(bienTheResponse.getGiaBan() * item.getSoLuong());
                        }
                        bienTheEntity.setSoLuong(bienTheEntity.getSoLuong() - item.getSoLuong());
                        bienTheRepository.save(bienTheEntity);
                        KhuyenMaiSanPhamEntity kmsp = item.getKhuyenMai().orElse(null);
                        if(kmsp != null){
                            KhuyenMaiEntity km = kmsp.getKhuyenMai();
                            int soMoi = km.getSoLuong()-item.getSoLuong();
                            km.setSoLuong(soMoi);
                            khuyenMaiRepository.save(km);
                        }
                    }
            );
        }
        if (hoaDonResquest.getTrangThai().equals("THANHCONG")) {
            entity.setNgayThanhToan(new Date());
        }
        HoaDonEntity result = hoaDonRepository.save(entity);
        return hoaDonConverter.convertToResponse(result);
    }

    @Override
    @Transactional
    public String delete(String ma) {
        HoaDonEntity entity = hoaDonRepository.findByMa(ma);
        if (entity != null) {
            List<HoaDonChiTietEntity> listHDCT = entity.getHoaDonChiTietEntities();
            if (!listHDCT.isEmpty()) {
                for (HoaDonChiTietEntity hdct : listHDCT) {
                    hoaDonChiTietRepository.deleteHoaDonCT(hdct.getId());
                }
            }

            trangThaiGiaoHangRepository.deleteByHoaDonId(entity);
            hoaDonRepository.deleteHoaDon(entity.getId());
            return "Xóa thành công";
        }
        return "Không tìm thấy hoá đơn";
    }

    @Override
    public List<HoaDonResponse> searchs(String param, String trangThai) {
        List<HoaDonEntity> list = hoaDonRepository.searchs(param, trangThai);
        List<HoaDonResponse> result = list.stream().map(
                item -> hoaDonConverter.convertToResponse(item)
        ).collect(Collectors.toList());
        return result;
    }

    @Override
    @Transactional
    public void deleteStatus(String ma, Long idHuyDon) {
        HoaDonEntity hoaDonEntity = hoaDonRepository.findByMa(ma);

        LocalDateTime ngayThanhToan = hoaDonEntity.getNgayThanhToan().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();

        LocalDateTime now = LocalDateTime.now();
        if (now.isAfter(ngayThanhToan.plusDays(3))) {
            throw new ClientError("Không được hủy đơn sau 3 ngày thanh toán !");
        }

        if (hoaDonEntity.getKhachHang() != null) {
            KhachHangEntity khachHangEntity = hoaDonEntity.getKhachHang();

            LichSuTichDiemEntity lichSuTichDiemEntity = lichSuTichDiemRepository.findByHoaDon_maAndTrangThai(ma, SystemConstant.CONGDIEM);

            TichDiemEntity tichDiemEntity = tichDiemRepository.findByKhachHang_ma(khachHangEntity.getMa());

            if (tichDiemEntity.getSoDiem() >= lichSuTichDiemEntity.getSoDiemTichDuoc()) {
                tichDiemEntity.setSoDiem(tichDiemEntity.getSoDiem() - lichSuTichDiemEntity.getSoDiemTichDuoc());
                tichDiemRepository.save(tichDiemEntity);

                LichSuTichDiemEntity newLichSu = new LichSuTichDiemEntity();
                newLichSu.setSoDiemHoan(lichSuTichDiemEntity.getSoDiemTichDuoc());
                newLichSu.setTrangThai("HOANDIEM");
                newLichSu.setKhachHang(khachHangEntity);
                newLichSu.setHoaDon(hoaDonEntity);
                lichSuTichDiemRepository.save(newLichSu);
            } else {
                throw new ClientError("Không thể hủy đơn vì khách hàng đã sử dụng hết số điểm tích.");
            }
        }

        List<HoaDonChiTietEntity> hoaDonChiTietEntities = hoaDonChiTietRepository.findAllByHoaDon_ma(ma);

        hoaDonChiTietEntities.forEach(item -> {
            BienTheEntity bienTheEntity = item.getBienThe();
            if (bienTheEntity != null) {
                bienTheEntity.setSoLuong(bienTheEntity.getSoLuong() + item.getSoLuong());
                bienTheRepository.save(bienTheEntity);
            }
        });

        LyDoHuyDonEntity lyDoHuyDonEntity = lyDoHuyDonRepository.findById(idHuyDon).get();

        hoaDonEntity.setLyDoHuyDon(lyDoHuyDonEntity);
        hoaDonEntity.setTrangThai("HUYDON");
        hoaDonRepository.save(hoaDonEntity);
    }
}
