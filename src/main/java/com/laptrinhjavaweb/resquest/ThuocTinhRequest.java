package com.laptrinhjavaweb.resquest;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ThuocTinhRequest implements Cloneable {

    private Long id;

    private String slug;

    private String ten;

    private List<String> giaTris;

    private Long idSanPham;

    private String trangThai = "ACTIVE";
}
