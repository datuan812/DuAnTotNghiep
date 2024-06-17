package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.SendMailResponse;

public interface ISendEmailService {
    void sendPasswordResetEmail(String recipient, String password);

    String generateRandomPassword();

    SendMailResponse processPasswordReset(String email);

    String resetPasswordByToken(String restToken, String matKhau);

    boolean existsByEmail(String email);

    boolean isValidResetToken(String resetToken);
}
