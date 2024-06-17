package com.laptrinhjavaweb.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.response.FilterResponse;
import com.laptrinhjavaweb.service.IThuocTinhService;

@RestController
@RequestMapping("/api/filter")
public class FilterAPI {

	@Autowired
	private IThuocTinhService thuocTinhService;
	
	@GetMapping
	public ResponseEntity<?> filter(){
		List<FilterResponse> results = thuocTinhService.filter();
		return new ResponseEntity<>(results, HttpStatus.OK);
	}
}
