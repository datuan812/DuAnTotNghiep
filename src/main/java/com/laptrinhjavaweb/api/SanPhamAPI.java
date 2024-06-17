package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.exception.EntityNotFoundException;
import com.laptrinhjavaweb.response.SanPhamResponse;
import com.laptrinhjavaweb.resquest.SanPhamRequest;
import com.laptrinhjavaweb.service.ISanPhamService;
import com.laptrinhjavaweb.utils.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/san-pham")
public class SanPhamAPI {

	@Autowired
	private ISanPhamService sanPhamService;
	
	@GetMapping("/{slug}")
	public ResponseEntity<?> findBySlug(@PathVariable("slug") String slug){
		SanPhamResponse result = sanPhamService.findBySlug(slug);
		if(result == null){
			throw new EntityNotFoundException("Không tồn tại slug này!");
		}
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@GetMapping("/pagination")
	public ResponseEntity<?> pagination(@RequestParam(name = "page", defaultValue = "1") Integer page,
										@RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit
	){
		Map<String, Object> results = sanPhamService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit, null, null, null);
		return new ResponseEntity<>(results, HttpStatus.OK);
	}

	@GetMapping("/discount")
	public ResponseEntity<?> discount(@RequestParam(name = "page", defaultValue = "1") Integer page,
										@RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit
	){
		Map<String, Object> results = sanPhamService.discountProduct(page, limit);
		return new ResponseEntity<>(results, HttpStatus.OK);
	}

	@GetMapping
	public ResponseEntity<?> findAll(@RequestParam(name = "page", defaultValue = "1") Integer page,
									 @RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit){
		Map<String, Object> results = sanPhamService.findÁll(page, limit);
		return new ResponseEntity<>(results, HttpStatus.OK);
	}

	@GetMapping("/search")
	public ResponseEntity<?> search(
			@RequestParam(name = "q") String param,
			@RequestParam(name = "page", defaultValue = "1") Integer page,
			@RequestParam(name = "limit", required = false, defaultValue = "5") Integer limit,
			@RequestParam Map<String, Object> filters){
		MapUtils.deleteKeyFromMap(filters);
		Map<String, Object> results = sanPhamService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit, param, filters, null);
		return new ResponseEntity<>(results, HttpStatus.OK);
	}

	@GetMapping("/danh-muc/{slug}")
	public ResponseEntity<?> categories(
			@PathVariable(name = "slug") String slug,
			@RequestParam(name = "page", defaultValue = "1") Integer page,
			@RequestParam(name = "limit", required = false, defaultValue = "2") Integer limit,
			@RequestParam Map<String, Object> filters){
		MapUtils.deleteKeyFromMap(filters);
		Map<String, Object> results = new HashMap<>();
		if(filters == null || filters.isEmpty()){
			results = sanPhamService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit, null, null, null);
		}else{
			results = sanPhamService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit, null, filters, null);
		}
		return new ResponseEntity<>(results, HttpStatus.OK);
	}

	@GetMapping("/filter")
	public ResponseEntity<?> filter(
			@RequestParam Map<String, Object> filters,
			@RequestParam(name = "page", defaultValue = "1") Integer page,
			@RequestParam(name = "limit", required = false, defaultValue = "2") Integer limit){
		Map<String, Object> results = sanPhamService.pagingOrSearchOrFindAllOrFilterOrCategories(page, limit, null, filters, null);
		return new ResponseEntity<>(results, HttpStatus.OK);
	}

	@PostMapping
	public ResponseEntity<?> createdSanPham(@RequestBody SanPhamRequest request){
		SanPhamResponse result = sanPhamService.save(request);
		return new ResponseEntity<>(result, HttpStatus.CREATED);
	}

	@PutMapping
	public ResponseEntity<?> updated(@RequestBody SanPhamRequest request){
		SanPhamResponse result = sanPhamService.update(request);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@DeleteMapping("/{slug}")
	public ResponseEntity<?> delete(@PathVariable(name = "slug") String slug){
		sanPhamService.delete(slug);
		return new ResponseEntity<>("Xóa thành công", HttpStatus.OK);
	}

	@GetMapping("/random")
	public ResponseEntity<?> randomProduct(){
		List<SanPhamResponse> results = sanPhamService.random(null,null, null, 1, null, 6);
		return new ResponseEntity<>(results, HttpStatus.OK);
	}

	@PostMapping("/update/{slug}")
	public void updatedTrangThai(@PathVariable("slug") String slug, @RequestBody String trangThai){
		sanPhamService.updateTrangThai(slug, trangThai);
	}

	@GetMapping("/find-all")
	public ResponseEntity<?> findAll(){
		List<SanPhamResponse> results = sanPhamService.findAll();
		return new ResponseEntity<>(results, HttpStatus.OK);
	}

	@PutMapping("/updateStatus/{id}")
	public void updateProductStatus(@PathVariable Long id) {
		sanPhamService.updateProductStatus(id);
	}
}
