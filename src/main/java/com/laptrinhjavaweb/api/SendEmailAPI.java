package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.response.SendMailResponse;
import com.laptrinhjavaweb.service.ISendEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.NoSuchElementException;

@RestController
@RequestMapping("/api")
public class SendEmailAPI {

    @Autowired
    private ISendEmailService NVSendEmailService;

    @Autowired
    private ISendEmailService KHSendEmailService;

    @PostMapping("/quenmatkhau")
    public ResponseEntity<?> quenmatkhau(@RequestParam String email) {
        try {
            if (NVSendEmailService.existsByEmail(email)) {
                NVSendEmailService.processPasswordReset(email);
            } else if (KHSendEmailService.existsByEmail(email)) {
                KHSendEmailService.processPasswordReset(email);
            } else {
                throw new ClientError("Người dùng không tồn tại");
            }
            return ResponseEntity.ok(SendMailResponse.builder().status("Thành công").build());
        } catch (NoSuchElementException e) {
            return ResponseEntity.badRequest().body(SendMailResponse.builder().status("Thất bại").build());
        }
    }

    @PostMapping("/resetPasswordByToken")
    public ResponseEntity<String> resetPasswordByToken(
            @RequestParam String restToken,
            @RequestParam String matKhau) {

        if (NVSendEmailService.isValidResetToken(restToken)) {
            NVSendEmailService.resetPasswordByToken(restToken, matKhau);
            return ResponseEntity.ok("Đổi mật khẩu thành công.");
        } else if (KHSendEmailService.isValidResetToken(restToken)) {
            KHSendEmailService.resetPasswordByToken(restToken, matKhau);
            return ResponseEntity.ok("Đổi mật khẩu thành công.");
        } else {
            throw new ClientError("Token không hợp lệ");
        }
    }

}

