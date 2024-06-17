package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.KhuyenMaiConvert;
import com.laptrinhjavaweb.entity.KhuyenMaiEntity;
import com.laptrinhjavaweb.entity.KhuyenMaiSanPhamEntity;
import com.laptrinhjavaweb.entity.SanPhamEntity;
import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.repository.KhuyenMaiRepository;
import com.laptrinhjavaweb.repository.KhuyenMaiSanPhamRepository;
import com.laptrinhjavaweb.response.KhuyenMaiResponse;
import com.laptrinhjavaweb.response.PageableResponse;
import com.laptrinhjavaweb.response.ThongKeKhuyenMaiResponse;
import com.laptrinhjavaweb.resquest.KhuyenMaiRequest;
import com.laptrinhjavaweb.service.IKhuyenMaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class KhuyenMaiService implements IKhuyenMaiService {
    private final KhuyenMaiRepository khuyenMaiRepository;

    @Autowired
    private KhuyenMaiConvert khuyenMaiConvert;

    private final KhuyenMaiSanPhamRepository khuyenMaiSanPhamRepository;

    @Autowired
    private SanPhamService sanPhamService;

    public KhuyenMaiService(KhuyenMaiRepository khuyenMaiRepository, KhuyenMaiSanPhamRepository khuyenMaiSanPhamRepository) {
        this.khuyenMaiRepository = khuyenMaiRepository;
        this.khuyenMaiSanPhamRepository = khuyenMaiSanPhamRepository;
        updateDS();
    }

    public void updateDS(){
        List<KhuyenMaiEntity> listEntity = this.khuyenMaiRepository.findAllByTrangThai("DELETE");
        for (KhuyenMaiEntity km: listEntity) {
            if(!(km.getTrangThai().equals("EXPIRED"))){
                updateStatus(km);
                khuyenMaiRepository.save(km);
            }
        }
    }

    @Override
    public List<KhuyenMaiResponse> getAll() {
        List<KhuyenMaiEntity> listEntity = khuyenMaiRepository.findAllByTrangThai("DELETE");
        List<KhuyenMaiResponse> list = listEntity.stream().map(
                item -> khuyenMaiConvert.convertToResponse(item)
        ).collect(Collectors.toList());
        return list;
    }

    @Override
    public KhuyenMaiResponse save(KhuyenMaiRequest request) {
        KhuyenMaiEntity khuyenMaiEntity = khuyenMaiConvert.convertToEntity(request);
        if(request.getLoai().equals("0")){
            List<String> list = request.getListSanPham();
            List<Double> listGia = new ArrayList<>();
            for (String x : list ){
                SanPhamEntity spEntity = sanPhamService.findEntityBySlug(x);
                listGia.add(spEntity.getGia());
            }
            Double minGia = listGia.stream()
                    .min(Double::compare)
                    .orElse(Double.NaN);
            if(request.getGiaTri() > minGia){
                throw new ClientError("Giá trị giảm phải nhỏ hơn giá sản phẩm khuyến mại. Vui lòng chỉnh lại khuyến mại!");
            }
        }
        KhuyenMaiEntity result = khuyenMaiRepository.save(khuyenMaiEntity);


        Date timeNow = new Date();
        if (khuyenMaiEntity.getNgayBatDau().compareTo(timeNow) > 0) {
            khuyenMaiEntity.setTrangThai("UPCOMING");
            khuyenMaiRepository.save(khuyenMaiEntity);
            result.setTrangThai("UPCOMING");
        }

        List<String> list = request.getListSanPham();
        for (String x : list ){
            SanPhamEntity spEntity = sanPhamService.findEntityBySlug(x);
            KhuyenMaiSanPhamEntity entity = new KhuyenMaiSanPhamEntity();
            entity.setKhuyenMai(result);
            entity.setSanPham(spEntity);
            entity.setTrangThai("ACTIVE");
            khuyenMaiSanPhamRepository.save(entity);
            if (result.getTrangThai().equals("UPCOMING")) {
                entity.setTrangThai("UPCOMING");
                khuyenMaiSanPhamRepository.save(entity);
            }
        }
        KhuyenMaiEntity km = khuyenMaiRepository.findById(result.getId()).orElse(null);
        return khuyenMaiConvert.convertToResponse(km);
    }

    @Override
    public String delete(String ma) {
        KhuyenMaiEntity km = khuyenMaiRepository.findByMa(ma);
        if (km != null) {
            List<KhuyenMaiSanPhamEntity> list = km.getKhuyenMaiSanPhamEntities();
            for (KhuyenMaiSanPhamEntity kmsp:list ) {
                kmsp.setTrangThai("DELETE");
                khuyenMaiSanPhamRepository.save(kmsp);
            }
            km.setTrangThai("DELETE");
            this.khuyenMaiRepository.save(km);
            return "Xoa thanh cong";
        } else {
            return "Khong tim thay";
        }
    }

    @Override
    public KhuyenMaiResponse update(KhuyenMaiRequest request, String ma) {
        KhuyenMaiEntity km = khuyenMaiRepository.findByMa(ma);
        if (km != null) {
            KhuyenMaiEntity khuyenMaiEntity = khuyenMaiConvert.convertToEntity(request);
            khuyenMaiEntity.setId(km.getId());
            if(khuyenMaiEntity.getNgayKetThuc().compareTo(request.getNgayKetThuc()) <= 0){
                khuyenMaiEntity.setTrangThai("ACTIVE");
            }
            if(request.getLoai().equals("0")){
                List<String> list = request.getListSanPham();
                List<Double> listGia = new ArrayList<>();
                for (String x : list ){
                    SanPhamEntity spEntity = sanPhamService.findEntityBySlug(x);
                    listGia.add(spEntity.getGia());
                }
                Double minGia = listGia.stream()
                        .min(Double::compare)
                        .orElse(Double.NaN);
                if(request.getGiaTri() > minGia){
                    throw new ClientError("Giá trị giảm phải nhỏ hơn giá sản phẩm khuyến mại. Vui lòng chỉnh lại khuyến mại!");
                }
            }
            khuyenMaiEntity.setTong(request.getSoLuong());
            ThongKeKhuyenMaiResponse thongKe = getThongKe(khuyenMaiEntity.getId());
            int soMoi=0;
            if(thongKe.getSoLuongSuDung()==null){
                soMoi = request.getSoLuong();
            }else{
                soMoi = request.getSoLuong() - thongKe.getSoLuongSuDung();
            }
            khuyenMaiEntity.setSoLuong(soMoi);
            KhuyenMaiEntity result = khuyenMaiRepository.save(khuyenMaiEntity);
            List<KhuyenMaiSanPhamEntity> list = khuyenMaiSanPhamRepository.findAllByKhuyenMai_id(result.getId());
            for (KhuyenMaiSanPhamEntity kmsp:list
            ) {
                khuyenMaiSanPhamRepository.delete(kmsp);
            }
            List<String> listSlug = request.getListSanPham();
            for (String x : listSlug ){
                SanPhamEntity spEntity = sanPhamService.findEntityBySlug(x);
                KhuyenMaiSanPhamEntity kmsp = khuyenMaiSanPhamRepository.findBySanPham_idAndTrangThaiOrSanPham_idAndTrangThai(spEntity.getId(), "ACTIVE", spEntity.getId(),"UPCOMING");
                if(kmsp != null){
                    throw new ClientError("Sản phẩm: "+spEntity.getTen()+" đang chạy khuyến mại. Vui lòng tạo khuyến mại!");
                }
            }
            for (String x : listSlug ){
                SanPhamEntity spEntity = sanPhamService.findEntityBySlug(x);
                KhuyenMaiSanPhamEntity entity = new KhuyenMaiSanPhamEntity();
                entity.setKhuyenMai(result);
                entity.setSanPham(spEntity);
                entity.setTrangThai("ACTIVE");
                khuyenMaiSanPhamRepository.save(entity);
                entity.setTrangThai(result.getTrangThai());
                khuyenMaiSanPhamRepository.save(entity);
            }
            return khuyenMaiConvert.convertToResponse(result);
        } else {
            return null;
        }

    }

    @Override
    public KhuyenMaiResponse findById(Long id) {
        return null;
    }

    @Override
    public KhuyenMaiResponse findByMa(String ma) {
        KhuyenMaiEntity entity = khuyenMaiRepository.findByMa(ma);
        updateStatus(entity);
        KhuyenMaiResponse response = khuyenMaiConvert.convertToResponse(entity);
//        ThongKeKhuyenMaiResponse thongKe = khuyenMaiRepository.thongKeKM(entity.getId());
        ThongKeKhuyenMaiResponse thongKe = getThongKe(entity.getId());

        response.setThongKe(thongKe);
        return response;
    }

    @Override
    public Map<String, Object> pagingOrSearchOrFindAllOrFilterOrCategories(Integer pageCurrent, Integer limit, String param, Map<String, Object> params, String slug) {
        updateDS();
        Map<String, Object> results = new HashMap<>();
        Boolean isAll = false;
        Page<KhuyenMaiEntity> page = null;
        List<KhuyenMaiResponse> listKhuyenMaiResponses = new ArrayList<>();
        if(pageCurrent == null && limit == null) {
            isAll = true;
            Pageable wholePage = Pageable.unpaged();
            page = khuyenMaiRepository.findAllByTrangThai("DELETE", wholePage);
        }else {
            Pageable pageable = PageRequest.of(pageCurrent - 1, limit);
            if(param != null || params != null || slug != null) {
                List<KhuyenMaiEntity> listKhuyenMaiEntity = new ArrayList<>();
                if(param != null) {
                    listKhuyenMaiEntity = khuyenMaiRepository.seachs(param);
                }else if(params != null && !params.isEmpty()){
                    List<Long> ids = khuyenMaiRepository.filters(params);
                    for (Long id : ids) {
                        KhuyenMaiEntity khuyenMaiEntity = khuyenMaiRepository.findById(id).get();
                        listKhuyenMaiEntity.add(khuyenMaiEntity);
                    }
                }else{

                }
                int sizeOfListSanPhamEntity = listKhuyenMaiEntity.size();
                int start = (int) pageable.getOffset();
                int end = Math.min((start + pageable.getPageSize()), sizeOfListSanPhamEntity);
                List<KhuyenMaiEntity> pageContent = listKhuyenMaiEntity.subList(start, end);
                page = new PageImpl<>(pageContent, pageable, sizeOfListSanPhamEntity);

            }else {
                page = khuyenMaiRepository.findAllByTrangThai("DELETE", pageable);
            }
        }
        listKhuyenMaiResponses = page.getContent().stream().map(
                item -> khuyenMaiConvert.convertToResponse(item)
        ).collect(Collectors.toList());
        results.put("data", listKhuyenMaiResponses);
        if (!isAll) {
            PageableResponse pageableResponse = new PageableResponse();
            pageableResponse.setPageCurrent(pageCurrent);
            pageableResponse.setTotalPage(page.getTotalPages());
            results.put("meta", pageableResponse);
        }
        return results;
    }

    @Override
    public Map<String, Object> searchByProduct(Integer pageCurrent, Integer limit, String param) {
        Map<String, Object> results = new HashMap<>();
        Boolean isAll = false;
        Page<KhuyenMaiEntity> page = null;
        List<KhuyenMaiResponse> listKhuyenMaiResponses = new ArrayList<>();
        Pageable pageable = PageRequest.of(pageCurrent - 1, limit);
        if (param != null) {
            List<KhuyenMaiEntity> listKhuyenMaiEntity = new ArrayList<>();
            if (param != null) {
                List<KhuyenMaiSanPhamEntity> listKMSP = khuyenMaiSanPhamRepository.seachs(param);
                for (KhuyenMaiSanPhamEntity kmsp : listKMSP){
                    listKhuyenMaiEntity.add(kmsp.getKhuyenMai());
                }
            }
            int sizeOfListSanPhamEntity = listKhuyenMaiEntity.size();
            int start = (int) pageable.getOffset();
            int end = Math.min((start + pageable.getPageSize()), sizeOfListSanPhamEntity);
            List<KhuyenMaiEntity> pageContent = listKhuyenMaiEntity.subList(start, end);
            page = new PageImpl<>(pageContent, pageable, sizeOfListSanPhamEntity);
        }
        listKhuyenMaiResponses = page.getContent().stream().map(
                item -> khuyenMaiConvert.convertToResponse(item)
        ).collect(Collectors.toList());
        results.put("data", listKhuyenMaiResponses);
        if (!isAll) {
            PageableResponse pageableResponse = new PageableResponse();
            pageableResponse.setPageCurrent(pageCurrent);
            pageableResponse.setTotalPage(page.getTotalPages());
            results.put("meta", pageableResponse);
        }
        return results;
    }

    @Override
    public String undelete(String ma) {
        KhuyenMaiEntity km = khuyenMaiRepository.findByMa(ma);
        if (km != null) {
            List<KhuyenMaiSanPhamEntity> list = km.getKhuyenMaiSanPhamEntities();
            for (KhuyenMaiSanPhamEntity kmsp : list) {
                kmsp.setTrangThai("ACTIVE");
                khuyenMaiSanPhamRepository.save(kmsp);
            }
            km.setTrangThai("ACTIVE");
            this.khuyenMaiRepository.save(km);
            return "Cập nhật thành công";
        } else {
            return "Không tìm thấy";
        }
    }

    @Override
    public void updateTrangThai(Long id, String trangThai) {
        KhuyenMaiSanPhamEntity khuyenMaiSanPhamEntity = khuyenMaiSanPhamRepository.findById(id).orElse(null);
        System.out.println("Cap nhat "+khuyenMaiSanPhamEntity.getSanPham().getTen());
        khuyenMaiSanPhamEntity.setTrangThai(trangThai);
        khuyenMaiSanPhamRepository.save(khuyenMaiSanPhamEntity);
    }

    @Override
    public void updateEXPIRED(String ma) {
        KhuyenMaiEntity khuyenMaiEntity = khuyenMaiRepository.findByMa(ma);
        if(khuyenMaiEntity != null){
            khuyenMaiEntity.setTrangThai("EXPIRED");
            khuyenMaiRepository.save(khuyenMaiEntity);
            List<KhuyenMaiSanPhamEntity> list = khuyenMaiEntity.getKhuyenMaiSanPhamEntities();
            for (KhuyenMaiSanPhamEntity kmsp: list ) {
                kmsp.setTrangThai("EXPIRED");
                khuyenMaiSanPhamRepository.save(kmsp);
            }
        }
    }

    @Override
    public KhuyenMaiEntity updateStatus(KhuyenMaiEntity khuyenMaiEntity) {
//        System.out.println("Khuyen mai 01");
        if (!(khuyenMaiEntity.getTrangThai().equals("EXPIRED"))){
            Date currentDate = new Date();
            if(khuyenMaiEntity.getNgayBatDau().compareTo(currentDate) <= 0 && !(khuyenMaiEntity.getTrangThai().equals("DELETE"))){
                khuyenMaiEntity.setTrangThai("ACTIVE");
                List<KhuyenMaiSanPhamEntity> list = khuyenMaiEntity.getKhuyenMaiSanPhamEntities();

                for (KhuyenMaiSanPhamEntity kmsp:list ) {
                    if(!(kmsp.getTrangThai().equals("INACTIVE"))){
                        kmsp.setTrangThai("ACTIVE");
                        khuyenMaiSanPhamRepository.save(kmsp);
                    }

                }
            }
            if (currentDate.after(khuyenMaiEntity.getNgayKetThuc())) {
                khuyenMaiEntity.setTrangThai("EXPIRED");
                List<KhuyenMaiSanPhamEntity> list = khuyenMaiEntity.getKhuyenMaiSanPhamEntities();
                for (KhuyenMaiSanPhamEntity kmsp:list ) {
                    kmsp.setTrangThai("EXPIRED");
                    khuyenMaiSanPhamRepository.save(kmsp);
                }
            }

            if(khuyenMaiEntity.getSoLuong() <=0){
                khuyenMaiEntity.setTrangThai("EXPIRED");
                List<KhuyenMaiSanPhamEntity> list = khuyenMaiEntity.getKhuyenMaiSanPhamEntities();
                for (KhuyenMaiSanPhamEntity kmsp:list ) {
                    kmsp.setTrangThai("EXPIRED");
                    khuyenMaiSanPhamRepository.save(kmsp);
                }
            }
        }
        return khuyenMaiEntity;
    }

    @Override
    public void updateStatusByMa(String ma) {
        KhuyenMaiEntity khuyenMaiEntity = khuyenMaiRepository.findByMa(ma);
        KhuyenMaiEntity entity = updateStatus(khuyenMaiEntity);
    }

    public ThongKeKhuyenMaiResponse getThongKe(Long id){
        List<Object[]> result = khuyenMaiRepository.thongKeKM(id);
        ThongKeKhuyenMaiResponse thongKe = new ThongKeKhuyenMaiResponse();

        if (!result.isEmpty()) {
            Object[] row = result.get(0);

            // Check for null values before casting to avoid NullPointerException
            Integer soluongsudung = (row[0] != null) ? ((Number) row[0]).intValue() : null;
            Double sotienthuduoc = (row[1] != null) ? ((Number) row[1]).doubleValue() : null;
            Double sotiengiam = (row[2] != null) ? ((Number) row[2]).doubleValue() : null;

            thongKe = new ThongKeKhuyenMaiResponse(soluongsudung, sotienthuduoc, sotiengiam);

            // Use the response as needed
        }
        return thongKe;
    }
}
