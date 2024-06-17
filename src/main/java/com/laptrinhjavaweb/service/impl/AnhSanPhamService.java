package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.AnhSanPhamConverter;
import com.laptrinhjavaweb.entity.AnhSanPhamEntity;
import com.laptrinhjavaweb.repository.AnhSanPhamRepository;
import com.laptrinhjavaweb.response.AnhSanPhamResponse;
import com.laptrinhjavaweb.resquest.AnhSanPhamRequest;
import com.laptrinhjavaweb.service.IAnhSanPhamService;
import com.laptrinhjavaweb.utils.GenerateStringUtils;
import com.laptrinhjavaweb.utils.UploadFileUtils;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AnhSanPhamService implements IAnhSanPhamService {

    @Autowired
    private AnhSanPhamRepository anhSanPhamRepository;

    @Autowired
    private AnhSanPhamConverter anhSanPhamConverter;

    @Autowired
    private UploadFileUtils uploadFileUtils;

    @Transactional
    @Override
    public AnhSanPhamResponse save(AnhSanPhamRequest request) {
        request.setHinhAnh(GenerateStringUtils.generate(6) + ".jpg");
        saveImage(request);
        AnhSanPhamEntity entity = anhSanPhamConverter.convertToEntity(request);
        anhSanPhamRepository.save(entity);
        AnhSanPhamResponse result = anhSanPhamConverter.convertToResponse(entity);
        return result;
    }

    public void saveImage(AnhSanPhamRequest request) {
        String path =  SystemConstant.path + "/"  + request.getHinhAnh();
        if (request.getBase64() != null) {
            byte[] bytes = Base64.decodeBase64(request.getBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
        }
    }
}
