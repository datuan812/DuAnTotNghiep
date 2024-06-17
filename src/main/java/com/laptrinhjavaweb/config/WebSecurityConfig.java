package com.laptrinhjavaweb.config;

import com.laptrinhjavaweb.security.CustomAccessDeniedHandler;
import com.laptrinhjavaweb.security.CustomSuccessHandler;
import com.laptrinhjavaweb.service.impl.CustomLogoutHandler;
import com.laptrinhjavaweb.service.impl.CustomUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.HttpStatusReturningLogoutSuccessHandler;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private JwtAuthenticationEntryPoint unauthorizedHandler;

    @Autowired
    private CustomLogoutHandler logoutHandler;

    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserDetailService();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
                http.csrf().disable()
                .authorizeRequests()
                        .antMatchers("/admin/dashboards").hasRole("ADMIN")
                        .antMatchers("/admin/setting/profile").hasAnyRole("ADMIN", "STAFF")
                        .antMatchers("/admin/setting/tich-diem").hasAnyRole("ADMIN", "STAFF")
                        .antMatchers("/admin/dashboards").hasRole("ADMIN")
                        .antMatchers("/admin/nhan-vien/**").hasRole("ADMIN")
                        .antMatchers("/admin/san-pham/**").hasRole("ADMIN")
                        .antMatchers("/admin/khuyen-mai/**").hasRole("ADMIN")
                        .antMatchers("/admin/khach-hang/**").hasAnyRole("ADMIN", "STAFF")
                        .antMatchers("/admin/giao-dich/**").hasAnyRole("ADMIN", "STAFF")
                        .antMatchers("/cart").hasAnyRole("ADMIN", "STAFF", "CUSTOMER")
                        .antMatchers("/web/**").hasAnyRole("ADMIN", "STAFF", "CUSTOMER")
                        .antMatchers("/vi-dien-tu/**").hasAnyRole("ADMIN", "STAFF", "CUSTOMER")
                        .antMatchers("/doi-mat-khau").hasAnyRole("ADMIN", "STAFF", "CUSTOMER")
                        .antMatchers("/trang-chu").permitAll()
                        .antMatchers("/login").permitAll()
                .and()
                .formLogin().loginPage("/login").usernameParameter("j_username").passwordParameter("j_password").permitAll()
                .loginProcessingUrl("/j_spring_security_check")
                .successHandler(myAuthenticationSuccessHandler())
                .failureUrl("/login?incorrectAccount").and()
                .logout()
                        .logoutUrl("/logout")
                        .addLogoutHandler(logoutHandler)
                        .logoutSuccessHandler(new HttpStatusReturningLogoutSuccessHandler(HttpStatus.OK))
                        .permitAll().deleteCookies("JSESSIONID")
                .and().exceptionHandling()
                        .accessDeniedHandler(accessDeniedHandler())
                        .authenticationEntryPoint(unauthorizedHandler).and()
                .sessionManagement().maximumSessions(1).expiredUrl("/login?sessionTimeout");
    }

    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return new CustomSuccessHandler();
    }

    @Bean
    public AccessDeniedHandler accessDeniedHandler(){
        return new CustomAccessDeniedHandler();
    }
}
