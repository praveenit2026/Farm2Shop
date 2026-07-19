package com.farmtoshop.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Supabase Connection Pooler (IPv4 compatible on aws-1 cluster)
    private static final String URL = "jdbc:postgresql://aws-1-ap-northeast-2.pooler.supabase.com:6543/postgres?sslmode=require";
    private static final String USER = "postgres.zunaxpncmardqhtyvije";
    private static final String PASSWORD = "Praveen@2005<>";

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.err.println("PostgreSQL JDBC Driver not found in classpath.");
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}



