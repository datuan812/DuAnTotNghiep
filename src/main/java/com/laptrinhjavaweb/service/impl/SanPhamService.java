package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.BienTheConverter;
import com.laptrinhjavaweb.converter.SanPhamConverter;
import com.laptrinhjavaweb.entity.*;
import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.repository.*;
import com.laptrinhjavaweb.response.*;
import com.laptrinhjavaweb.resquest.*;
import com.laptrinhjavaweb.service.*;
import com.laptrinhjavaweb.service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class SanPhamService implements ISanPhamService {

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private SanPhamConverter sanPhamConvert;

    @Autowired
    private IAnhSanPhamService anhSanPhamService;

    @Autowired
    private IThuocTinhService thuocTinhService;

    @Autowired
    private IGiaTriThuocTinhService giaTriThuocTinhService;

    @Autowired
    private IBienTheService bienTheService;

    @Autowired
    private GiaTriThuocTinhRepository giaTriThuocTinhRepository;

    @Autowired
    private ThuocTinhRepository thuocTinhRepository;

    @Autowired
    private GiaTriThuocTinhBienTheRepository giaTriThuocTinhBienTheRepository;

    @Autowired
    private BienTheRepository bienTheRepository;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private BienTheConverter bienTheConverter;

    @Autowired
    private XoaBienTheRepository xoaBienTheRepository;

    @Autowired
    private KhuyenMaiSanPhamRepository khuyenMaiSanPhamRepository;

    @Autowired
    private GioHangService configCheckout;

    @Override
    public Map<String, Object> pagingOrSearchOrFindAllOrFilterOrCategories(Integer pageCurrent, Integer limit, String param, Map<String, Object> fliters, String slug) {
        Map<String, Object> results = new HashMap<>();
        Boolean isAll = false;
        Page<SanPhamEntity> page = null;
        List<SanPhamResponse> listSanPhamResponse = new ArrayList<>();
        if (pageCurrent == null && limit == null) {
            isAll = true;
            Pageable wholePage = Pageable.unpaged();
            page = sanPhamRepository.findByTrangThaiOrderByNgayTaoDesc(SystemConstant.ACTICE, wholePage);
        } else {
            Pageable pageable = PageRequest.of(pageCurrent - 1, limit);
            if (param != null || fliters != null || slug != null) {
                List<SanPhamEntity> listSanPhamEntity = new ArrayList<>();
                if (param != null) {
                    listSanPhamEntity = sanPhamRepository.seachs(param, fliters);
                } else if (slug != null) {
                    listSanPhamEntity = sanPhamRepository.categories(slug, fliters);
                } else {
                    listSanPhamEntity = sanPhamRepository.filters(fliters);
                }
                int sizeOfListSanPhamEntity = listSanPhamEntity.size();
                int start = (int) pageable.getOffset();
                int end = Math.min((start + pageable.getPageSize()), sizeOfListSanPhamEntity);
                List<SanPhamEntity> pageContent = listSanPhamEntity.subList(start, end);
                page = new PageImpl<>(pageContent, pageable, sizeOfListSanPhamEntity);

            } else {
                page = sanPhamRepository.findByTrangThaiOrderByNgayTaoDesc(SystemConstant.ACTICE, pageable);
            }
        }
        listSanPhamResponse = page.getContent().stream().map(
                item -> sanPhamConvert.convertToResponse(item)
        ).collect(Collectors.toList());
        results.put("data", listSanPhamResponse);
        if (!isAll) {
            PageableResponse pageableResponse = new PageableResponse();
            pageableResponse.setPageCurrent(pageCurrent);
            pageableResponse.setTotalPage(page.getTotalPages());
            results.put("meta", pageableResponse);
        }
        return results;
    }

    @Override
    public Map<String, Object> discountProduct(Integer pageCurrent, Integer limit) {
        Map<String, Object> results = new HashMap<>();
        Boolean isAll = false;
        Page<SanPhamEntity> page = null;
        List<SanPhamResponse> listSanPhamResponse = new ArrayList<>();
        Pageable pageable = PageRequest.of(pageCurrent - 1, limit);
            List<SanPhamEntity> listSanPhamEntity = new ArrayList<>();
                List<KhuyenMaiSanPhamEntity> listKMSP = khuyenMaiSanPhamRepository.allActivate();
                for (KhuyenMaiSanPhamEntity kmsp : listKMSP){
                    listSanPhamEntity.add(kmsp.getSanPham());
                }
            int sizeOfListSanPhamEntity = listSanPhamEntity.size();
            int start = (int) pageable.getOffset();
            int end = Math.min((start + pageable.getPageSize()), sizeOfListSanPhamEntity);
            List<SanPhamEntity> pageContent = listSanPhamEntity.subList(start, end);
            page = new PageImpl<>(pageContent, pageable, sizeOfListSanPhamEntity);

        listSanPhamResponse = page.getContent().stream().map(
                item -> sanPhamConvert.convertToResponse(item)
        ).collect(Collectors.toList());


        results.put("data", listSanPhamResponse);
        if (!isAll) {
            PageableResponse pageableResponse = new PageableResponse();
            pageableResponse.setPageCurrent(pageCurrent);
            pageableResponse.setTotalPage(page.getTotalPages());
            results.put("meta", pageableResponse);
        }
        return results;
    }


    @Override
    public SanPhamResponse findBySlug(String slug) {
        SanPhamEntity sanPhamEntity = sanPhamRepository.findBySlug(slug);
        if (sanPhamEntity == null) {
            return null;
        }
        SanPhamResponse result = sanPhamConvert.convertToResponse(sanPhamEntity);
        return result;
    }

    @Override
    public SanPhamEntity findEntityBySlug(String slug) {
        SanPhamEntity sanPhamEntity = sanPhamRepository.findBySlug(slug);
        if (sanPhamEntity == null) {
            return null;
        }
        return sanPhamEntity;
    }

    @SuppressWarnings("unused")
    @Transactional
    @Override
    public SanPhamResponse save(SanPhamRequest sanPhamRequest) {
        try {
            SanPhamEntity sanPhamEntity = sanPhamRepository.findBySlug(sanPhamRequest.getSlug());
            if (sanPhamEntity != null && sanPhamRequest.getId() == null) {
                throw new ClientError("Slug này đã tồn tại. Xin kiểm tra lại!");
            }
            sanPhamEntity = sanPhamConvert.convertToEntity(sanPhamRequest);
            sanPhamRepository.save(sanPhamEntity);
            final Long idSanPham = sanPhamEntity.getId();
            List<AnhSanPhamRequest> listAnh = sanPhamRequest.getAnh().stream().map(
                    item -> {
                        item.setIdSanPham(idSanPham);
                        anhSanPhamService.save(item);
                        return item;
                    }
            ).collect(Collectors.toList());

            List<ThuocTinhRequest> listThuocTinh = sanPhamRequest.getThuocTinh().stream().map(
                    item -> {
                        item.setIdSanPham(idSanPham);
                        ThuocTinhResponse thuocTinhResponse = thuocTinhService.save(item);
                        Long idThuocTinh = thuocTinhResponse.getId();
                        for (String giaTri : item.getGiaTris()) {
                            GiaTriThuocTinhRequest giaTriThuocTinhRequest = new GiaTriThuocTinhRequest(idThuocTinh, idSanPham, giaTri);
                            giaTriThuocTinhService.save(giaTriThuocTinhRequest);
                        }
                        return item;
                    }
            ).collect(Collectors.toList());

            List<BienTheRequest> listBienThe = sanPhamRequest.getBienThe().stream().map(
                    item -> {
                        item.setIdSanPham(idSanPham);
                        bienTheService.save(item);
                        return item;
                    }
            ).collect(Collectors.toList());

            SanPhamResponse result = sanPhamConvert.convertToResponse(sanPhamEntity);
            return result;
        } catch (Exception ex) {
            throw new RuntimeException("Error");
        }
    }

    @Override
    public List<SanPhamResponse> random(Integer sanPhamBanChay, Integer sanPhamMoi, Integer sanPhamNhieuLuotXem, Integer sanPhamNoiBat, Integer sanPhamPhoBien,
                                        Integer limit) {
        List<SanPhamResponse> results = sanPhamRepository.random(sanPhamBanChay, sanPhamMoi, sanPhamNhieuLuotXem, sanPhamNoiBat, sanPhamPhoBien, limit)
                .stream().map(item -> sanPhamConvert.convertToResponse(item))
                .collect(Collectors.toList());
        return results;
    }

    @Override
    public List<SanPhamResponse> same(String slug) {
        List<SanPhamResponse> results = sanPhamRepository.same(slug)
                .stream().map(item -> sanPhamConvert.convertToResponse(item))
                .collect(Collectors.toList());
        return results;
    }

    @Override
    @Transactional
    public void delete(String slug) {
        SanPhamEntity sanPhamEntity = sanPhamRepository.findBySlug(slug);
        sanPhamEntity.setTrangThai("INACTIVE");
        sanPhamRepository.save(sanPhamEntity);
    }

    @Override
    @Transactional
    public void updateTrangThai(String slug, String trangThai) {
        SanPhamEntity sanPhamEntity = sanPhamRepository.findBySlug(slug);
        sanPhamEntity.setTrangThai(trangThai);
        gioHangChiTietRepository.updateInActive(trangThai, sanPhamEntity.getId());
        sanPhamRepository.save(sanPhamEntity);
    }

    @Override
    public Map<String, Object> findÁll(Integer pageCurrent, Integer limit) {
        Map<String, Object> results = new HashMap<>();
        Pageable pageable = PageRequest.of(pageCurrent - 1, limit);
        Page<SanPhamEntity> page = sanPhamRepository.findAllByOrderByNgayTaoDesc(pageable);

        List<SanPhamResponse> listSanPhamResponse = page.getContent().stream().map(
                item -> sanPhamConvert.convertToResponse(item)
        ).collect(Collectors.toList());

        PageableResponse pageableResponse = new PageableResponse();
        pageableResponse.setPageCurrent(pageCurrent);
        pageableResponse.setTotalPage(page.getTotalPages());
        results.put("meta", pageableResponse);
        results.put("data", listSanPhamResponse);
        return results;
    }

    @Override
    public List<SanPhamResponse> findAll() {
        List<SanPhamResponse> results = sanPhamRepository.findAll().stream().map(
                item -> sanPhamConvert.convertToResponse(item)
        ).collect(Collectors.toList());
        return results;
    }

    @Transactional
    public void remove(Long id) {
        SanPhamEntity sanPhamEntity = sanPhamRepository.findById(id).orElse(null);
        List<Long> idsBienThe = sanPhamEntity.getBienTheEntities().stream().map(
                item -> item.getId()
        ).collect(Collectors.toList());

        String hinhAnh = sanPhamEntity.getAnhSanPhamEntities().get(0).getHinhAnh();
        updateGioHangChiTiet(idsBienThe, hinhAnh);
        updateHoaDonChiTiet(idsBienThe, hinhAnh);

        giaTriThuocTinhBienTheRepository.deleteByBienThe_IdIn(idsBienThe);
        giaTriThuocTinhRepository.deleteAllBySanPham_Id(id);
        bienTheRepository.deleteAllBySanPham_Id(id);
        thuocTinhRepository.deleteAllBySanPham_Id(id);
    }

    @Transactional
    public void updateGioHangChiTiet(List<Long> idsBienThe, String hinhAnh) {
        List<GioHangChiTietEntity> results = gioHangChiTietRepository.findAllByBienThe_IdInAndTrangThai(idsBienThe, SystemConstant.ACTICE);
        for (GioHangChiTietEntity item : results) {
            BienTheEntity bienTheEntity = item.getBienThe();
            BienTheResponse bienTheResponse = bienTheConverter.convertToResponse(bienTheEntity);

            XoaBienTheEntity xoaBienTheEntity = XoaBienTheEntity.builder()
                    .ten(bienTheEntity.getSanPham().getTen())
                    .anh(bienTheResponse.getHinhAnh() == null ? hinhAnh : bienTheResponse.getHinhAnh())
                    .soLuong(item.getSoLuong())
                    .giaTriBienThe(bienTheResponse.getTen())
                    .giaGoc(bienTheResponse.getGia())
                    .giaMua(bienTheResponse.getGiaBan())
                    .maKhachHang(item.getGioHang().getKhachHang().getMa())
                    .build();
            xoaBienTheRepository.save(xoaBienTheEntity);
        }
        gioHangChiTietRepository.updateVariant(idsBienThe);
    }

    @Transactional
    public void updateHoaDonChiTiet(List<Long> idsBienThe, String hinhAnh) {
        List<HoaDonChiTietEntity> results = hoaDonChiTietRepository.findAllByBienThe_IdIn(idsBienThe);
        for (HoaDonChiTietEntity item : results) {
            BienTheEntity bienTheEntity = item.getBienThe();
            BienTheResponse bienTheResponse = bienTheConverter.convertToResponse(bienTheEntity);

            XoaBienTheEntity xoaBienTheEntity = XoaBienTheEntity.builder()
                    .ten(bienTheEntity.getSanPham().getTen())
                    .anh(bienTheResponse.getHinhAnh() == null ? hinhAnh : bienTheResponse.getHinhAnh())
                    .soLuong(item.getSoLuong())
                    .giaTriBienThe(bienTheResponse.getTen())
                    .giaGoc(bienTheResponse.getGia())
                    .giaMua(bienTheResponse.getGiaBan())
                    .maHoaDon(item.getHoaDon().getMa())
                    .url(bienTheEntity.getSanPham().getSlug())
                    .build();
            xoaBienTheRepository.save(xoaBienTheEntity);
        }
        hoaDonChiTietRepository.deleteWhenUpdateProduct(idsBienThe);
        hoaDonChiTietRepository.updateWhenUpdateProduct(idsBienThe);
    }

    @Override
    @Transactional
    public SanPhamResponse update(SanPhamRequest sanPhamRequest) {
        Long idSanPham = sanPhamRequest.getId();
        SanPhamEntity sanPhamEntity = sanPhamRepository.findById(sanPhamRequest.getId()).get();
        List<String> listThuocTinhCurrent = sanPhamRequest.getThuocTinh().stream().map(
                item -> item.getGiaTris()
        ).flatMap(item -> item.stream()).collect(Collectors.toList());

        List<String> listThuocTinhOrigin = sanPhamEntity.getThuocTinhEntities().stream()
                .flatMap(item -> item.getGiaTriThuocTinhEntities().stream())
                .map(item -> item.getGiaTri())
                .collect(Collectors.toList());

        List<String> listThuocTinhThem = listThuocTinhCurrent.stream().filter(
                item -> !listThuocTinhOrigin.contains(item)
        ).collect(Collectors.toList());

        List<String> listThuocTinhXoa = listThuocTinhOrigin.stream().filter(
                item -> !listThuocTinhCurrent.contains(item)
        ).collect(Collectors.toList());

        List<String> listBienTheCurrent = sanPhamRequest.getBienThe().stream()
                .map(item -> item.getTen()).collect(Collectors.toList());

        List<String> listBienTheOrigin = sanPhamEntity.getBienTheEntities().stream().map(item -> item.getTen()).collect(Collectors.toList());

        List<String> listBienTheThem = listBienTheCurrent.stream().filter(
                item -> !listBienTheOrigin.contains(item)
        ).collect(Collectors.toList());

        List<String> listBienTheXoa = listBienTheOrigin.stream().filter(
                item -> !listBienTheCurrent.contains(item)
        ).collect(Collectors.toList());

        List<ThuocTinhRequest> listThuocTinhRequestThem = sanPhamRequest.getThuocTinh().stream()
                .map(item -> {
                    List<String> updatedGiaTris = item.getGiaTris().stream()
                            .filter(giaTri -> listThuocTinhThem.contains(giaTri))
                            .collect(Collectors.toList());
                            return new ThuocTinhRequest(null, item.getSlug(),
                                    item.getTen(), updatedGiaTris, null, "ACTIVE");
                        }
                ).collect(Collectors.toList());

        List<BienTheRequest> listBienTheRequestThem = sanPhamRequest.getBienThe().stream().
                filter(
                        item -> listBienTheThem.stream().anyMatch(bienThe -> bienThe.equals(item.getTen()))
                ).collect(Collectors.toList());

        List<BienTheEntity> listBienTheRequestBanDau = sanPhamEntity.getBienTheEntities();

        List<BienTheRequest> listBienTheRequestHienTai = sanPhamRequest.getBienThe();

        List<BienTheRequest> listBienTheRequestThayDoi = listBienTheRequestHienTai.stream()
                .filter(
                        item ->
                                listBienTheRequestBanDau.stream().anyMatch(
                                        bienTheEntity -> (bienTheEntity.getTen().equals(item.getTen()) &&
                                                (!bienTheEntity.getSoLuong().equals(item.getSoLuong()) || !bienTheEntity.getGia().equals(item.getGia())))
                                )
                ).collect(Collectors.toList());

        List<Long> idsBienThe = listBienTheXoa.stream().map(
                item -> bienTheRepository.findByTenAndSanPham_Id(item, idSanPham).getId()
        ).collect(Collectors.toList());

        List<Long> idsGiaTriThuocTinh = listThuocTinhXoa.stream().map(
                item -> giaTriThuocTinhRepository.findByGiaTriAndSanPham_Id(item, idSanPham).getId()
        ).collect(Collectors.toList());

        if (idsBienThe.size() > 0) {
            Integer row = hoaDonChiTietRepository.updateProduct(idsBienThe);
            if (row > 0) {
                if (sanPhamEntity.getThuocTinhEntities().size() != sanPhamRequest.getThuocTinh().size()) {
                    throw new ClientError("Hiện tại do đang có sản phẩm nằm trong hóa đơn treo hoặc chờ xác nhận nên bạn không được thêm thuộc tính." +
                            " Xin lỗi vì sự bất tiện này");
                }
                String nameProducts = listThuocTinhXoa.stream().map(
                        item -> item
                ).collect(Collectors.joining(","));
                throw new ClientError("Do có các sản phẩm có thuộc tính bắt đầu bằng " + nameProducts + " nằm trong hóa đơn treo hoặc chờ xác nhận. Vui lòng không xóa các" +
                        " thuộc tính kể trên. Xin lỗi vì sự bất tiện này");
            }
        }
        if (sanPhamEntity.getThuocTinhEntities().size() == sanPhamRequest.getThuocTinh().size()) {
            //Update lại checkout cho khách mua lại sản phẩm
            configCheckout.deleteHoaDonChuanBiDat(sanPhamEntity.getId());
            //End
            if (idsBienThe.size() > 0) {
                updateGioHangChiTiet(idsBienThe, sanPhamEntity.getAnhSanPhamEntities().get(0).getHinhAnh());
                updateHoaDonChiTiet(idsBienThe, sanPhamEntity.getAnhSanPhamEntities().get(0).getHinhAnh());
                giaTriThuocTinhBienTheRepository.deleteByBienThe_IdIn(idsBienThe);
                bienTheRepository.deleteByIdIn(idsBienThe);
            }
            if (idsGiaTriThuocTinh.size() > 0) {
                giaTriThuocTinhRepository.deleteByIdIn(idsGiaTriThuocTinh);
            }
            listThuocTinhRequestThem.forEach(
                    item -> {
                        item.setIdSanPham(idSanPham);
                        Long idThuocTinh = thuocTinhRepository.findByTenAndSanPham_Id(item.getTen(), idSanPham).getId();
                        for (String giaTri : item.getGiaTris()) {
                            GiaTriThuocTinhRequest giaTriThuocTinhRequest = new GiaTriThuocTinhRequest(idThuocTinh, idSanPham, giaTri);
                            giaTriThuocTinhService.save(giaTriThuocTinhRequest);
                        }
                    }
            );

            listBienTheRequestThem.forEach(
                    item -> {
                        item.setIdSanPham(idSanPham);
                        bienTheService.save(item);
                    }
            );

            listBienTheRequestThayDoi.forEach(
                    item -> {
                        item.setId(bienTheRepository.findByTenAndSanPham_Id(item.getTen(), idSanPham).getId());
                        item.setIdSanPham(idSanPham);
                        bienTheService.save(item);
                    }
            );
        } else {
            remove(sanPhamRequest.getId());
            sanPhamRepository.save(sanPhamEntity);
            List<ThuocTinhRequest> listThuocTinh = sanPhamRequest.getThuocTinh().stream().map(
                    item -> {
                        item.setIdSanPham(idSanPham);
                        ThuocTinhResponse thuocTinhResponse = thuocTinhService.save(item);
                        Long idThuocTinh = thuocTinhResponse.getId();
                        for (String giaTri : item.getGiaTris()) {
                            GiaTriThuocTinhRequest giaTriThuocTinhRequest = new GiaTriThuocTinhRequest(idThuocTinh, idSanPham, giaTri);
                            giaTriThuocTinhService.save(giaTriThuocTinhRequest);
                        }
                        return item;
                    }
            ).collect(Collectors.toList());

            List<BienTheRequest> listBienThe = sanPhamRequest.getBienThe().stream().map(
                    item -> {
                        item.setIdSanPham(idSanPham);
                        bienTheService.save(item);
                        return item;
                    }
            ).collect(Collectors.toList());
        }
        sanPhamRepository.save(sanPhamConvert.convertToEntity(sanPhamRequest));
        SanPhamResponse result = sanPhamConvert.convertToResponse(sanPhamEntity);
        return result;
    }

    public void updateProductStatus(Long id) {
        SanPhamEntity sanPhamEntity = sanPhamRepository.findById(id).orElse(null);
        if(sanPhamEntity != null){
            sanPhamEntity.setSanPhamMoi(0);
            sanPhamRepository.save(sanPhamEntity);
        }
    }
}
