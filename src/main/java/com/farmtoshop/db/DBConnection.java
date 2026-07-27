package com.farmtoshop.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String DEFAULT_URL = "jdbc:postgresql://db.zunaxpncmardqhtyvije.supabase.co:5432/postgres?sslmode=require";
    private static final String DEFAULT_USER = "postgres";
    private static final String DEFAULT_PASSWORD = "Praveen@2005<>";

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.err.println("PostgreSQL JDBC Driver not found in classpath.");
        }
    }

    public static Connection getConnection() throws SQLException {
        String envUrl = System.getenv("DB_URL");
        String envUser = System.getenv("DB_USER");
        String envPass = System.getenv("DB_PASSWORD");

        String url = (envUrl != null && !envUrl.trim().isEmpty()) ? envUrl : DEFAULT_URL;
        String user = (envUser != null && !envUser.trim().isEmpty()) ? envUser : DEFAULT_USER;
        String pass = (envPass != null && !envPass.trim().isEmpty()) ? envPass : DEFAULT_PASSWORD;

        return DriverManager.getConnection(url, user, pass);
    }
}



