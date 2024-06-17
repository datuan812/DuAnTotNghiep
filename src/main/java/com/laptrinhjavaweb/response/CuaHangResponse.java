package com.laptrinhjavaweb.response;

public enum CuaHangResponse {

    SO_DIEN_THOAI("0987654321"),

    DIA_CHI("Cổng số 1, Tòa nhà FPT Polytechnic, " +
            "13 phố Trịnh Văn Bô, phường Phương Canh, quận Nam Từ Liêm, " +
            "TP Hà Nội Km12 Cầu Diễn, Phường Phúc Diễn, Quận Bắc Từ Liêm, Hà Nội"),

    EMAIL("KOC2003@gmail.com");

    private final String value;

    CuaHangResponse(String value){
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
