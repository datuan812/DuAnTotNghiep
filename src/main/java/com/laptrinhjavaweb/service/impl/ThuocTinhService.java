package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.laptrinhjavaweb.response.ThuocTinhResponse;
import com.laptrinhjavaweb.resquest.ThuocTinhRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.ThuocTinhConverter;
import com.laptrinhjavaweb.entity.ThuocTinhEntity;
import com.laptrinhjavaweb.repository.ThuocTinhRepository;
import com.laptrinhjavaweb.response.FilterResponse;
import com.laptrinhjavaweb.service.IThuocTinhService;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ThuocTinhService implements IThuocTinhService{

	@Autowired
	private ThuocTinhRepository thuocTinhRepository;
	
	@Autowired
	private ThuocTinhConverter thuocTinhConvert;
	
	@Override
	public List<FilterResponse> filter() {
		List<FilterResponse> results = new ArrayList<>();
		List<String> slugs = thuocTinhRepository.findAllDistinctSlug();
		for (String slug : slugs) {
			List<ThuocTinhEntity> thuocTinhEntities = thuocTinhRepository.findTop5BySlug(slug);
			FilterResponse filterResponse = thuocTinhConvert.convertToFilterResponse(thuocTinhEntities);
			results.add(filterResponse);
		}
		return results;
	}

	@Override
	@Transactional
	public ThuocTinhResponse save(ThuocTinhRequest request) {
		ThuocTinhEntity entity = thuocTinhConvert.convertToEntity(request);
		thuocTinhRepository.save(entity);
		ThuocTinhResponse result = thuocTinhConvert.convertToResponse(entity);
		return result;
	}

}
