package com.laptrinhjavaweb.security;

import com.laptrinhjavaweb.security.utils.SecurityUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException {
        String targetUrl = determineTargetUrl(authentication);
        if (response.isCommitted()) {
            System.out.println("Can't redirect");
            return;
        }
        redirectStrategy.sendRedirect(request, response, targetUrl);
    }

    private String determineTargetUrl(Authentication authentication) {
        String url = null;
        List<String> roles = SecurityUtils.getAuthorities();
        if(isAdmin(roles)) {
            url = "/admin/dashboards";
        }else if(isStaff(roles)){
            url = "/admin/giao-dich/hoa-don-off";
        }
        else if(isCustomer(roles)) {
            url = "/trang-chu";
        }
        return url;
    }

    private boolean isAdmin(List<String> roles) {
        if(roles.contains("ROLE_ADMIN")) return true;
        return false;
    }

    private boolean isStaff(List<String> roles) {
        if(roles.contains("ROLE_STAFF")) return true;
        return false;
    }

    private boolean isCustomer(List<String> roles) {
        if(roles.contains("ROLE_CUSTOMER")) return true;
        return false;
    }

}
