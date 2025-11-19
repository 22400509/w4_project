package org.example.w4_project01.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
    private static Connection conn = null;
    public static Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("org.mariadb.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/MyMariaDB", "root", "1234");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        
        return conn;
    }
    public static void main(String[] args) {
        Connection conn = getConnection();
        if(conn != null) {
            System.out.println("DB 연결 성공!");
        }
    }
}
