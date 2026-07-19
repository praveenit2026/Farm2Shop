package com.farmtoshop.servlet;

import com.farmtoshop.db.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");

        try (Connection conn = DBConnection.getConnection()) {
            if ("farmer".equalsIgnoreCase(role)) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String location = request.getParameter("location");
                String farmName = request.getParameter("farmName");

                String query = "INSERT INTO farmers (name, email, phone, password, location, farm_name) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(query)) {
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, phone);
                    ps.setString(4, password);
                    ps.setString(5, location);
                    ps.setString(6, farmName);
                    ps.executeUpdate();
                }
            } else if ("shopkeeper".equalsIgnoreCase(role)) {
                String shopName = request.getParameter("shopName");
                String ownerName = request.getParameter("ownerName");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String phone = request.getParameter("phone");
                String location = request.getParameter("location");

                String query = "INSERT INTO shopkeepers (shop_name, owner_name, email, password, phone, location) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(query)) {
                    ps.setString(1, shopName);
                    ps.setString(2, ownerName);
                    ps.setString(3, email);
                    ps.setString(4, password);
                    ps.setString(5, phone);
                    ps.setString(6, location);
                    ps.executeUpdate();
                }
            } else {
                request.setAttribute("error", "Invalid registration role.");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
            }

            request.setAttribute("success", "Registration successful! Please login.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Registration failed. Email might already be in use. Error: " + e.getMessage());
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
