package com.farmtoshop.db;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Supabase Project: Farm2Shop (ijajyrhpzcizuhftelbt) - Northeast Asia (Tokyo)
    private static final String DEFAULT_URL = "jdbc:postgresql://aws-0-ap-northeast-1.pooler.supabase.com:6543/postgres?ssl=true&sslmode=require";
    private static final String DEFAULT_USER = "postgres.ijajyrhpzcizuhftelbt";
    private static final String DEFAULT_PASSWORD = "Praveen@2005<>";

    private static HikariDataSource dataSource;

    static {
        try {
            Class.forName("org.postgresql.Driver");

            String envUrl = System.getenv("DB_URL");
            String envUser = System.getenv("DB_USER");
            String envPass = System.getenv("DB_PASSWORD");

            String url = (envUrl != null && !envUrl.trim().isEmpty()) ? envUrl : DEFAULT_URL;
            String user = (envUser != null && !envUser.trim().isEmpty()) ? envUser : DEFAULT_USER;
            String pass = (envPass != null && !envPass.trim().isEmpty()) ? envPass : DEFAULT_PASSWORD;

            HikariConfig config = new HikariConfig();
            config.setJdbcUrl(url);
            config.setUsername(user);
            config.setPassword(pass);
            config.setMaximumPoolSize(10);
            config.setMinimumIdle(2);
            config.setIdleTimeout(30000);
            config.setConnectionTimeout(10000);
            config.setMaxLifetime(1800000);

            dataSource = new HikariDataSource(config);
            System.out.println("HikariCP Connection Pool initialized successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("HikariCP initialization failed, falling back to direct connections: " + e.getMessage());
        }
    }

    public static Connection getConnection() throws SQLException {
        if (dataSource != null) {
            return dataSource.getConnection();
        }
        String envUrl = System.getenv("DB_URL");
        String envUser = System.getenv("DB_USER");
        String envPass = System.getenv("DB_PASSWORD");

        String url = (envUrl != null && !envUrl.trim().isEmpty()) ? envUrl : DEFAULT_URL;
        String user = (envUser != null && !envUser.trim().isEmpty()) ? envUser : DEFAULT_USER;
        String pass = (envPass != null && !envPass.trim().isEmpty()) ? envPass : DEFAULT_PASSWORD;

        return DriverManager.getConnection(url, user, pass);
    }
}
