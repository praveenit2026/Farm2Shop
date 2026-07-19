package com.farmtoshop.util;

import java.io.*;
import java.sql.*;
import java.nio.file.*;

/**
 * Utility to initialize the Supabase database schema.
 * Run this once to create all tables and seed data.
 */
public class SchemaRunner {
    private static final String URL = "jdbc:postgresql://aws-0-ap-northeast-2.pooler.supabase.com:6543/postgres?sslmode=require";
    private static final String USER = "postgres.zunaxpncmardqhtyvije";
    private static final String PASSWORD = "Praveen@2005<>";

    public static void main(String[] args) throws Exception {
        Class.forName("org.postgresql.Driver");
        String[] hosts = {
            "aws-0-ap-northeast-2.pooler.supabase.com",
            "aws-1-ap-northeast-2.pooler.supabase.com",
            "aws-2-ap-northeast-2.pooler.supabase.com",
            "aws-3-ap-northeast-2.pooler.supabase.com"
        };
        
        String workingHost = null;
        for (String host : hosts) {
            String url = "jdbc:postgresql://" + host + ":6543/postgres?sslmode=require";
            System.out.println("Testing connection to: " + host + "...");
            try (Connection conn = DriverManager.getConnection(url, USER, PASSWORD)) {
                System.out.println("CONNECTED to " + host + " successfully!");
                workingHost = host;
                
                // Run schema statements
                System.out.println("Running schema initialization...");
                String[] statements = SCHEMA_SQL.split(";");
                for (String stmt : statements) {
                    stmt = stmt.trim();
                    if (!stmt.isEmpty() && !stmt.startsWith("--")) {
                        try (Statement s = conn.createStatement()) {
                            s.execute(stmt);
                        } catch (SQLException e) {
                            System.err.println("WARN: " + e.getMessage());
                        }
                    }
                }
                System.out.println("Database schema initialized successfully!");
                break;
            } catch (SQLException e) {
                System.out.println("FAILED on host " + host + ": " + e.getMessage());
            }
        }
        
        if (workingHost == null) {
            System.err.println("ERROR: Could not connect to any of the pooler hosts. Please check your credentials or Supabase status.");
        }
    }

    private static final String SCHEMA_SQL = 
        "DROP TABLE IF EXISTS payments CASCADE;\n" +
        "DROP TABLE IF EXISTS complaints CASCADE;\n" +
        "DROP TABLE IF EXISTS demands CASCADE;\n" +
        "DROP TABLE IF EXISTS bookings CASCADE;\n" +
        "DROP TABLE IF EXISTS products CASCADE;\n" +
        "DROP TABLE IF EXISTS shopkeepers CASCADE;\n" +
        "DROP TABLE IF EXISTS farmers CASCADE;\n" +
        "DROP TABLE IF EXISTS admin CASCADE;\n" +

        "CREATE TABLE admin (id SERIAL PRIMARY KEY, username VARCHAR(100) NOT NULL UNIQUE, password VARCHAR(100) NOT NULL, name VARCHAR(100) DEFAULT NULL, email VARCHAR(100) DEFAULT NULL, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);\n" +
        "INSERT INTO admin (username, password, name, email) VALUES ('admin', 'admin', 'System Admin', 'admin@farmtoshop.com');\n" +

        "CREATE TABLE farmers (id SERIAL PRIMARY KEY, name VARCHAR(150) NOT NULL, email VARCHAR(150) NOT NULL UNIQUE, phone VARCHAR(20) NOT NULL, password VARCHAR(255) NOT NULL, location VARCHAR(150) DEFAULT NULL, farm_name VARCHAR(150) DEFAULT NULL, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);\n" +
        "INSERT INTO farmers (id, name, email, phone, password, location, farm_name) VALUES (1, 'sam', 'sam@gmail.com', '9886764849', 'sam', 'chennai', 'sam@co.com');\n" +
        "SELECT setval('farmers_id_seq', 2, false);\n" +

        "CREATE TABLE shopkeepers (id SERIAL PRIMARY KEY, shop_name VARCHAR(100) DEFAULT NULL, owner_name VARCHAR(100) DEFAULT NULL, email VARCHAR(100) NOT NULL UNIQUE, password VARCHAR(100) NOT NULL, phone VARCHAR(20) DEFAULT NULL, location VARCHAR(100) DEFAULT NULL, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);\n" +
        "INSERT INTO shopkeepers (id, shop_name, owner_name, email, password, phone, location) VALUES (1, 'jerry@co', 'jerry', 'jerry@gmail.com', 'jerry', '8838884930', 'trichy'), (2, 'praga@co', 'praga', 'praga@gmail.com', 'praga', '9666665656', 'trichy');\n" +
        "SELECT setval('shopkeepers_id_seq', 3, false);\n" +

        "CREATE TABLE products (id SERIAL PRIMARY KEY, farmer_id INT NOT NULL REFERENCES farmers(id) ON DELETE CASCADE, product_name VARCHAR(200) DEFAULT NULL, category VARCHAR(100) DEFAULT NULL, location VARCHAR(150) DEFAULT NULL, quantity INT DEFAULT NULL, price DECIMAL(10,2) DEFAULT NULL, image VARCHAR(255) DEFAULT NULL, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);\n" +
        "INSERT INTO products (id, farmer_id, product_name, category, location, quantity, price, image) VALUES (1,1,'Apple','Fruits','chennai',50,100.00,'uploads/apple.jpg'),(2,1,'Tomato','Vegetables','chennai',30,20.00,'uploads/tomato.jpg'),(3,1,'Carrot','Vegetables','Chennai',40,20.00,'uploads/carrot.jpg'),(4,1,'Banana','Fruits','trichy',20,100.00,'uploads/banana.jpg'),(5,1,'Banana','Fruits','trichy',12,10.00,'uploads/banana2.jpg');\n" +
        "SELECT setval('products_id_seq', 6, false);\n" +

        "CREATE TABLE bookings (id SERIAL PRIMARY KEY, product_id INT REFERENCES products(id) ON DELETE SET NULL, shopkeeper_id INT REFERENCES shopkeepers(id) ON DELETE SET NULL, farmer_id INT REFERENCES farmers(id) ON DELETE SET NULL, quantity VARCHAR(50) DEFAULT NULL, total_price DECIMAL(10,2) DEFAULT NULL, status VARCHAR(50) DEFAULT 'Pending', created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);\n" +
        "INSERT INTO bookings (id, product_id, shopkeeper_id, farmer_id, quantity, total_price, status) VALUES (1,1,1,1,'9',900.00,'Pending'),(2,2,2,1,'10',100.00,'Pending'),(3,1,2,1,'2',200.00,'Pending'),(4,1,1,1,'12',240.00,'Pending'),(5,2,1,1,'2',40.00,'Pending'),(6,1,1,1,'4',400.00,'Pending'),(7,1,1,1,'10',180.00,'Pending'),(8,5,1,1,'10',100.00,'Pending');\n" +
        "SELECT setval('bookings_id_seq', 9, false);\n" +

        "CREATE TABLE demands (id SERIAL PRIMARY KEY, shopkeeper_id INT REFERENCES shopkeepers(id) ON DELETE SET NULL, farmer_id INT REFERENCES farmers(id) ON DELETE SET NULL, product_name VARCHAR(100) DEFAULT NULL, quantity VARCHAR(50) DEFAULT NULL, message TEXT, status VARCHAR(50) DEFAULT 'Pending', created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, product_id INT DEFAULT 0);\n" +
        "INSERT INTO demands (id, shopkeeper_id, farmer_id, product_name, quantity, message, status, product_id) VALUES (1,2,1,'Tomato','10','rs 10','Booked',2),(2,1,1,'Apple','20','I want 20 rupees per kg','Rejected',1),(3,1,1,'Apple','10','I want 20 per kg','Booked',1),(4,1,1,'Apple','10','rs 18','Booked',1),(5,1,1,'banana','10','i want rs 10 per kg','Booked',5);\n" +
        "SELECT setval('demands_id_seq', 6, false);\n" +

        "CREATE TABLE payments (id SERIAL PRIMARY KEY, booking_id INT NOT NULL REFERENCES bookings(id) ON DELETE CASCADE, shopkeeper_id INT NOT NULL REFERENCES shopkeepers(id) ON DELETE CASCADE, payment_method VARCHAR(50) NOT NULL, amount DECIMAL(10,2) NOT NULL, card_number VARCHAR(30) DEFAULT NULL, card_holder VARCHAR(100) DEFAULT NULL, expiry_date VARCHAR(10) DEFAULT NULL, cvv VARCHAR(10) DEFAULT NULL, status VARCHAR(50) DEFAULT 'Success', created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);\n" +
        "INSERT INTO payments (id, booking_id, shopkeeper_id, payment_method, amount, card_number, card_holder, expiry_date, cvv, status) VALUES (1,1,1,'Card',900.00,'6595659595995959','jerry','29/25','250','Delivered'),(2,2,2,'Card',100.00,'9494656261646161','praga','29/27','258','Success'),(3,3,2,'COD',200.00,NULL,'Cash Customer',NULL,NULL,'Delivered'),(4,4,1,'COD',240.00,NULL,'Cash Customer',NULL,NULL,'Success'),(5,5,1,'Card',40.00,'6464646161699966','jerry','11/26','258','Success'),(6,7,1,'Card',180.00,'9999999665666666','samn','20/23','258','Delivered'),(7,8,1,'Card',100.00,'8496464646565665','jerry','09/23','548','Shipped');\n" +
        "SELECT setval('payments_id_seq', 8, false);\n" +

        "CREATE TABLE complaints (id SERIAL PRIMARY KEY, farmer_id INT REFERENCES farmers(id) ON DELETE SET NULL, shopkeeper_id INT REFERENCES shopkeepers(id) ON DELETE SET NULL, admin_id INT DEFAULT 1, user_type VARCHAR(20) DEFAULT NULL, subject VARCHAR(255) DEFAULT NULL, message TEXT, solution TEXT DEFAULT NULL, status VARCHAR(50) DEFAULT 'Pending', created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);\n" +
        "INSERT INTO complaints (id, farmer_id, shopkeeper_id, admin_id, user_type, subject, message, status) VALUES (1,1,NULL,1,'farmer','i want this','okay','Pending');\n" +
        "SELECT setval('complaints_id_seq', 2, false)";
}
