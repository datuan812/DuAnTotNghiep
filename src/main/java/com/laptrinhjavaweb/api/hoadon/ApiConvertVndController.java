package com.laptrinhjavaweb.api.hoadon;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/convert")
@CrossOrigin({"*"})
public class ApiConvertVndController {

    @Autowired
    RestTemplate restTemplate;
    @GetMapping
    public Integer convertPrice() {
        final String uri = "https://free.currconv.com/api/v7/convert?q=USD_VND&compact=ultra&apiKey=0b3c3a1c2fc3e239dfbc";

        HttpHeaders headers = new HttpHeaders();
        HttpEntity<Object> requestEntity = new HttpEntity<>(headers);

        ResponseEntity<String> responseEntity = restTemplate.exchange(uri, HttpMethod.GET, requestEntity, String.class);

        String jsonResponse = responseEntity.getBody();

        try {
            ObjectMapper objectMapper = new ObjectMapper();

            // Đọc giá trị từ chuỗi JSON
            Map<String, Object> jsonMap = objectMapper.readValue(jsonResponse, new TypeReference<Map<String, Object>>() {
            });

            // Lấy giá trị USD_VND từ đối tượng Map
            Integer usdToVnd = (Integer) jsonMap.get("USD_VND");

            return usdToVnd;
        } catch (IOException e) {
            e.printStackTrace();
            return 24000;
        }
    }

    @GetMapping("/test")
    public Double test(){
            return 24000D;
    }
}
