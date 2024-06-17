package com.laptrinhjavaweb.security;

import com.laptrinhjavaweb.response.MyUserResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        MyUserResponse myUserResponse = (MyUserResponse) auth.getPrincipal();
        if (myUserResponse.getMaChucVu().equals("STAFF")) {
            response.sendRedirect(request.getContextPath() + "/admin/403");
        }
        else if (myUserResponse.getMaChucVu().equals("CUSTOMER")) {
            response.sendRedirect(request.getContextPath() + "/403");
        }
    }
}
