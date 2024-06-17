package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.entity.BienTheEntity;
import com.laptrinhjavaweb.entity.GioHangChiTietEntity;
import com.laptrinhjavaweb.entity.KhuyenMaiSanPhamEntity;
import com.laptrinhjavaweb.repository.BienTheRepository;
import com.laptrinhjavaweb.repository.GioHangRepository;
import com.laptrinhjavaweb.repository.KhuyenMaiSanPhamRepository;
import com.laptrinhjavaweb.repository.SanPhamRepository;
import com.laptrinhjavaweb.response.GioHangChiTietResponse;
import com.laptrinhjavaweb.response.SanPhamResponse;
import com.laptrinhjavaweb.response.ThuocTinhResponse;
import com.laptrinhjavaweb.resquest.GioHangChiTietRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class GioHangChiTietConveter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private BienTheRepository bienTheRepository;

    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private SanPhamConverter sanPhamConverter;

    @Autowired
    private KhuyenMaiSanPhamRepository khuyenMaiSanPhamRepository;

    public GioHangChiTietEntity convertToEntity (GioHangChiTietRequest request){
        GioHangChiTietEntity entity = modelMapper.map(request, GioHangChiTietEntity.class);
        entity.setGioHang(gioHangRepository.findById(request.getIdGioHang()).get());
        entity.setSanPham(sanPhamRepository.findById(request.getIdSanPham()).get());
        entity.setBienThe(bienTheRepository.findById(request.getIdBienThe()).get());
        return entity;
    }

    public GioHangChiTietResponse convertToResponse(GioHangChiTietEntity gioHangChiTietEntity){
        GioHangChiTietResponse response = modelMapper.map(gioHangChiTietEntity, GioHangChiTietResponse.class);
        SanPhamResponse sanPhamResponse = sanPhamConverter.convertToResponse(gioHangChiTietEntity.getSanPham());
        String image = sanPhamResponse.getAnh().get(0).getHinhAnh();
        BienTheEntity bienTheEntity = gioHangChiTietEntity.getBienThe();
        if(bienTheEntity.getHinhAnh() != null){
            image = bienTheEntity.getHinhAnh();
        }
        List<ThuocTinhResponse> thuocTinh = sanPhamResponse.getThuocTinh();
        List<Long> giaTriThuocTinhChecked = bienTheEntity.getGiaTriThuocTinhBienTheEntities().stream().map(
                item -> item.getGiaTriThuocTinh().getId()
        ).collect(Collectors.toList());

        Double giaMua = 0.0;
        KhuyenMaiSanPhamEntity khuyenMaiSanPhamEntity =
                khuyenMaiSanPhamRepository.
                        findBySanPham_idAndTrangThaiOrSanPham_idAndTrangThai
                                (gioHangChiTietEntity.getSanPham().getId(), SystemConstant.ACTICE, gioHangChiTietEntity.getSanPham().getId(), SystemConstant.UPCOMING);
        if (khuyenMaiSanPhamEntity != null && khuyenMaiSanPhamEntity.getTrangThai().equals(SystemConstant.ACTICE)) {
            Double giaTri = khuyenMaiSanPhamEntity.getKhuyenMai().getGiaTri();
            if(khuyenMaiSanPhamEntity.getKhuyenMai().getLoai().equals("1")){
                giaMua = bienTheEntity.getGia() * ((100 - giaTri) / 100);
            }else{
                giaMua = bienTheEntity.getGia() - giaTri;
            }
        }else{
            giaMua = bienTheEntity.getGia();
        }

        response.setSlug(sanPhamResponse.getSlug());
        response.setTenSanPham(sanPhamResponse.getTen());
        response.setImage(image);
        response.setThuocTinh(thuocTinh);
        response.setDonGia(bienTheEntity.getGia());
        response.setGiaMua(giaMua);
        response.setSoTien(giaMua * response.getSoLuong());
        response.setGiaTriThuocTinhChecked(giaTriThuocTinhChecked);
        response.setIdBienThe(bienTheEntity.getId());
        response.setTrangThaiSanPham(sanPhamResponse.getTrangThai().equals("ACTIVE"));
        response.setSoLuongConLaiBienThe(bienTheEntity.getSoLuong());
        return response;
    }
}
