package com.laptrinhjavaweb.utils;

import java.util.Map;

public class MapUtils {

    public static final void deleteKeyFromMap(Map<String, Object> filters){
        filters.remove("page");
        filters.remove("limit");
        filters.remove("q");
    }
}
