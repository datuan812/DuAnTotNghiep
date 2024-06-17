package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.BienTheConverter;
import com.laptrinhjavaweb.entity.AnhSanPhamEntity;
import com.laptrinhjavaweb.entity.BienTheEntity;
import com.laptrinhjavaweb.repository.AnhSanPhamRepository;
import com.laptrinhjavaweb.repository.BienTheRepository;
import com.laptrinhjavaweb.repository.GiaTriThuocTinhBienTheRepository;
import com.laptrinhjavaweb.response.BienTheResponse;
import com.laptrinhjavaweb.resquest.BienTheRequest;
import com.laptrinhjavaweb.service.IBienTheService;
import com.laptrinhjavaweb.utils.GenerateStringUtils;
import com.laptrinhjavaweb.utils.UploadFileUtils;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BienTheService implements IBienTheService{

	@Autowired
	private GiaTriThuocTinhBienTheRepository giaTriThuocTinhBienTheRepository;
	
	@Autowired
	private BienTheRepository bienTheRepository;
	
	@Autowired
	private BienTheConverter bienTheConverter;

	@Autowired
	private AnhSanPhamRepository anhSanPhamRepository;

	@Autowired
	private UploadFileUtils uploadFileUtils;

	@Override
	public BienTheResponse findByIdGiaTriThuocTinh(List<Long> giaTriThuocTinhIds) {
		Long idBienThe = giaTriThuocTinhBienTheRepository.findBienThe(giaTriThuocTinhIds);
		if(idBienThe == null) {
			return null;
		}
		BienTheEntity bienTheEntity = bienTheRepository.findById(idBienThe).get();
		BienTheResponse bienTheResponse = bienTheConverter.convertToResponse(bienTheEntity);
		return bienTheResponse;
	}

	@Override
	@Transactional
	public BienTheResponse save(BienTheRequest request) {
		boolean isSaveImage = false;
		if(request.getBase64() != null) {
			request.setHinhAnh(GenerateStringUtils.generate(6) + ".jpg");
			saveImage(request);
			isSaveImage = true;
		}
		BienTheEntity entity = bienTheConverter.convertToEntity(request);
		entity.setMa(GenerateStringUtils.generate(8));
		bienTheRepository.save(entity);
		BienTheResponse result = bienTheConverter.convertToResponse(entity);

		if(isSaveImage) {
			AnhSanPhamEntity anhSanPhamEntity = new AnhSanPhamEntity();
			anhSanPhamEntity.setHinhAnh(request.getHinhAnh());
			anhSanPhamEntity.setSanPham(entity.getSanPham());
			anhSanPhamRepository.save(anhSanPhamEntity);
		}
		return result;
	}

	public void saveImage(BienTheRequest request) {
		String path = SystemConstant.path + "/" + request.getHinhAnh();
		if (request.getBase64() != null) {
			byte[] bytes = Base64.decodeBase64(request.getBase64().getBytes());
			uploadFileUtils.writeOrUpdate(path, bytes);
		}
	}
}
