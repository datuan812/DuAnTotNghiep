package com.laptrinhjavaweb.api;


import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.response.SliderResponse;
import com.laptrinhjavaweb.resquest.SliderRequest;
import com.laptrinhjavaweb.service.ISliderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/slider")
public class SliderAPI {

    @Autowired
    private ISliderService sliderService;

    @PostMapping
    public ResponseEntity<?> created(@RequestBody SliderRequest request){
        SliderResponse result = sliderService.save(request);
        if(result == null){
            throw new ClientError("Ảnh này đã tồn tại");
        }
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<?> pagination(@RequestParam(name = "page", defaultValue = "1") Integer page,
                                        @RequestParam(name = "limit", required = false, defaultValue = "3") Integer limit
    ){
        Map<String, Object> results = sliderService.pagingOrFindAll(page, limit);
        return new ResponseEntity<>(results, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable(name = "id") Long id){
        sliderService.delete(id);
    }
}
