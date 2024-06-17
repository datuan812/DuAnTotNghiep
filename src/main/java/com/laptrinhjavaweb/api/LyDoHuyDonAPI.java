package com.laptrinhjavaweb.api;


import com.laptrinhjavaweb.response.LyDoHuyDonReponse;
import com.laptrinhjavaweb.resquest.LyDoHuyDonResquest;
import com.laptrinhjavaweb.service.ILyDoHuyDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/ly-do-huy-don")
public class LyDoHuyDonAPI {

    @Autowired
    private ILyDoHuyDonService lyDoHuyDonService;

    @PostMapping
    public ResponseEntity<?> created(@RequestBody LyDoHuyDonResquest request){
        LyDoHuyDonReponse result = lyDoHuyDonService.insert(request);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }
}
