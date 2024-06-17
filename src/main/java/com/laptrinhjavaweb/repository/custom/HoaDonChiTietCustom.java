package com.laptrinhjavaweb.repository.custom;

import java.util.List;

public interface HoaDonChiTietCustom {

    void updateWhenUpdateProduct (List<Long> idsBienThe);

    void deleteWhenUpdateProduct (List<Long> idsBienThe);

    void updateHoaDonChoWhenUpdateProduct (List<Long> idsBienThe);

    Integer updateProduct (List<Long> idsBienThe);
}
