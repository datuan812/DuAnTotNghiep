package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.entity.KhachHangEntity;
import com.laptrinhjavaweb.entity.NhanVienEntity;
import com.laptrinhjavaweb.repository.KhachHangRepository;
import com.laptrinhjavaweb.repository.NhanVienRepository;
import com.laptrinhjavaweb.response.KhacHangResponse;
import com.laptrinhjavaweb.response.MyUserResponse;
import com.laptrinhjavaweb.response.NhanVienResponse;
import com.laptrinhjavaweb.service.IKhachHangService;
import com.laptrinhjavaweb.service.INhanVienService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailService implements UserDetailsService {

    @Autowired
    private INhanVienService nhanVienService;

    @Autowired
    private IKhachHangService khachHangService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MyUserResponse myUserResponse = null;
        List<GrantedAuthority> authorities = new ArrayList<>();
        NhanVienResponse nhanVienResponse = nhanVienService.findByMaAndTrangThai(username, SystemConstant.ACTICE);
        if(nhanVienResponse != null){
            authorities.add(new SimpleGrantedAuthority("ROLE_"+nhanVienResponse.getChucVu().getMa()));
            myUserResponse = new MyUserResponse(username, nhanVienResponse.getMatKhau(), true, true, true, true, authorities);
            myUserResponse.setMaChucVu(nhanVienResponse.getChucVu().getMa());
            myUserResponse.setId(nhanVienResponse.getId());
            BeanUtils.copyProperties(nhanVienResponse, myUserResponse);
        }

        KhacHangResponse khacHangResponse = khachHangService.findBySoDienThoaiOrEmailAndTrangThai(username, username, SystemConstant.ACTICE);
        if(khacHangResponse != null){
            authorities.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
            myUserResponse = new MyUserResponse(username, khacHangResponse.getMatKhau(), true, true, true, true, authorities);
            myUserResponse.setMaChucVu("CUSTOMER");
            myUserResponse.setId(khacHangResponse.getId());
            BeanUtils.copyProperties(khacHangResponse, myUserResponse);
        }
        if(myUserResponse == null){
            throw new UsernameNotFoundException("User name not found");
        }
        return myUserResponse;
    }
}
