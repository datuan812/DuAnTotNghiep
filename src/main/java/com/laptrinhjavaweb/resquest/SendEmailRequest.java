package com.laptrinhjavaweb.resquest;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SendEmailRequest {
    private String recipient;

    private String message;

    private String subject;

    private String email;

    private String trangThai = "ACTIVE";
}
