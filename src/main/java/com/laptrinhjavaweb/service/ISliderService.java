package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.SliderResponse;
import com.laptrinhjavaweb.resquest.SliderRequest;

import java.util.Map;

public interface ISliderService {

    Map<String, Object> pagingOrFindAll(Integer pageCurrent, Integer limit );

    SliderResponse save(SliderRequest sliderRequest);

    void delete(Long id);

}
