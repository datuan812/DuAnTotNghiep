package com.laptrinhjavaweb.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.HashSet;

@Getter
@Setter
public class MyUserResponse extends User {
    public MyUserResponse(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
    }

    public MyUserResponse() {
        super(" "," ",new HashSet<>());
        this.id = -1L;
    }

    private Long id;

    private String ten;

    private String ma;

    private String maChucVu;

    private String anh;

    private String trangThai;
}
