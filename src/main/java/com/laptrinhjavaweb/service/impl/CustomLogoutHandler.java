package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.response.MyUserResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
public class CustomLogoutHandler implements LogoutHandler {

    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        try{
            String url = "";
            if (authentication != null) {
                MyUserResponse myUserResponse = (MyUserResponse) authentication.getPrincipal();
                if(myUserResponse.getMaChucVu().equals("STAFF") || myUserResponse.getMaChucVu().equals("ADMIN")){
                    url = "/login?is_logout";
                }else if(myUserResponse.getMaChucVu().equals("CUSTOMER")){
                    url = "/trang-chu";
                }
                new SecurityContextLogoutHandler().logout(request, response, authentication);
            }
            response.sendRedirect(url);
        }catch (IOException e){
            e.printStackTrace();
        }

    }
}
