package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.entity.NhanVienEntity;
import com.laptrinhjavaweb.exception.ClientError;
import com.laptrinhjavaweb.exception.EntityNotFoundException;
import com.laptrinhjavaweb.repository.KhachHangRepository;
import com.laptrinhjavaweb.response.SendMailResponse;
import com.laptrinhjavaweb.service.ISendEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.NoSuchElementException;
import java.util.Random;

@Service
public class KHSendEmailService implements ISendEmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("datnnhom@gmail.com") private String sender;


    @Override
    public void sendPasswordResetEmail(String recipient, String password) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(sender);
        mailMessage.setTo(recipient);
        mailMessage.setSubject("Yêu cầu đặt lại mật khẩu");
        mailMessage.setText("Sử dụng mã sau để khôi phục mật khẩu của bạn: " + password);

        javaMailSender.send(mailMessage);
    }

    @Override
    public String generateRandomPassword() {
        Random random = new Random();
        int password = 100000 + random.nextInt(900000);
        return String.valueOf(password);
    }

    @Override
    public SendMailResponse processPasswordReset(String email) {
        KhachHangEntity khachHangEntity = khachHangRepository.findByEmail(email);

        if (khachHangEntity != null) {
            String newPassword = generateRandomPassword();
            LocalDateTime now = LocalDateTime.now();
            LocalDateTime expireTime = now.plusMinutes(1);
            khachHangEntity.setRestToken(newPassword);
            khachHangEntity.setExpireTime(expireTime);
            khachHangRepository.save(khachHangEntity);
            sendPasswordResetEmail(khachHangEntity.getEmail(), newPassword);
            return SendMailResponse.builder().status("Thành công").build();
        } else {
            throw new NoSuchElementException("Không tìm thấy người dùng với email: " + email);
        }
    }


    @Override
    public String resetPasswordByToken(String restToken, String matKhau) {
        KhachHangEntity khachHangEntity = khachHangRepository.findByRestToken(restToken);

        if (khachHangEntity != null) {
            LocalDateTime now = LocalDateTime.now();
            if (khachHangEntity.getExpireTime() != null && khachHangEntity.getExpireTime().isBefore(now)) {
                throw new ClientError("Mã code không hợp lệ hoặc đã hết hạn. Vui lòng kiểm tra lại..!");
            }
            String newPassword = passwordEncoder.encode(matKhau);
            khachHangEntity.setMatKhau(newPassword);
            khachHangEntity.setRestToken(null);
            khachHangEntity.setExpireTime(null);
            khachHangRepository.save(khachHangEntity);

            return "Đổi mật khẩu thành công.";
        } else {
            throw new ClientError("Không tìm thấy thông tin khôi phục mật khẩu.");
        }
    }

    @Override
    public boolean existsByEmail(String email) {
        return khachHangRepository.existsByEmail(email);
    }

    @Override
    public boolean isValidResetToken(String resetToken) {
        KhachHangEntity khachHangEntity = khachHangRepository.findByRestToken(resetToken);
        return khachHangEntity != null;
    }
}
