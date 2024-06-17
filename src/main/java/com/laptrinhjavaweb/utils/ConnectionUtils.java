package com.laptrinhjavaweb.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtils {

    public static final String DB_URL = "jdbc:mysql://localhost:3306/duantotnghiep";

    public static final String USER = "root";

    public static final String PASS = "anhtuan123";

    public static final Connection getConection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return con;
    }
}
