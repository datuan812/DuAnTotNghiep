package com.laptrinhjavaweb.converter;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.laptrinhjavaweb.entity.SanPhamEntity;
import com.laptrinhjavaweb.repository.SanPhamRepository;
import com.laptrinhjavaweb.resquest.ThuocTinhRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.entity.GiaTriThuocTinhEntity;
import com.laptrinhjavaweb.entity.ThuocTinhEntity;
import com.laptrinhjavaweb.response.FilterResponse;
import com.laptrinhjavaweb.response.GiaTriThuocTinhResponse;
import com.laptrinhjavaweb.response.ThuocTinhResponse;

@Component
public class ThuocTinhConverter {

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private GiaTriThuocTinhConverter giaTriThuocTinhConverter;

	@Autowired
	private SanPhamRepository sanPhamRepository;

	public ThuocTinhResponse convertToResponse(ThuocTinhEntity entity) {
		ThuocTinhResponse response = modelMapper.map(entity, ThuocTinhResponse.class);
		List<GiaTriThuocTinhResponse> giaTriThuocTinhResponses = entity.getGiaTriThuocTinhEntities().stream().map(
				item -> giaTriThuocTinhConverter.convertToResponse(item)
				).collect(Collectors.toList());
		response.setGiaTriThuocTinh(giaTriThuocTinhResponses);
		return response;
	}

	public ThuocTinhEntity convertToEntity(ThuocTinhRequest resquest){
		ThuocTinhEntity entity = modelMapper.map(resquest, ThuocTinhEntity.class);
		SanPhamEntity sanPhamEntity = sanPhamRepository.findById(resquest.getIdSanPham()).get();
		entity.setSanPham(sanPhamEntity);
		return entity;
	}

	public FilterResponse convertToFilterResponse(List<ThuocTinhEntity> entities) {
		FilterResponse filterResponse = new FilterResponse();
		filterResponse.setMa(entities.get(0).getSlug());
		filterResponse.setTen(entities.get(0).getTen());
		Set<String> giaTris = new HashSet<>();
		entities.forEach(item -> {
			List<GiaTriThuocTinhEntity> giaTriThuocTinhEntities = item.getGiaTriThuocTinhEntities();
			giaTriThuocTinhEntities.forEach(itemGiaTriThuocTinh -> giaTris.add(itemGiaTriThuocTinh.getGiaTri()));
		});
		filterResponse.setGiaTri(giaTris);
		return filterResponse;
	}
}
