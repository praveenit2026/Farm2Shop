package com.farmtoshop.servlet;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Admin;
import com.farmtoshop.model.Farmer;
import com.farmtoshop.model.Shopkeeper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailOrUsername = request.getParameter("emailOrUsername");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (emailOrUsername == null || emailOrUsername.trim().isEmpty()
                || password == null || password.trim().isEmpty()
                || role == null || role.trim().isEmpty()) {
            request.setAttribute("error", "All fields are required. Please select a role and enter your credentials.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        emailOrUsername = emailOrUsername.trim();
        password = password.trim();

        try (Connection conn = DBConnection.getConnection()) {
            if ("admin".equalsIgnoreCase(role)) {
                String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
                try (PreparedStatement ps = conn.prepareStatement(query)) {
                    ps.setString(1, emailOrUsername);
                    ps.setString(2, password);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            Admin admin = new Admin(
                                rs.getInt("id"),
                                rs.getString("username"),
                                rs.getString("password"),
                                rs.getString("name"),
                                rs.getString("email"),
                                rs.getTimestamp("created_at")
                            );
                            HttpSession session = request.getSession();
                            session.setAttribute("role", "admin");
                            session.setAttribute("user", admin);
                            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                            return;
                        }
                    }
                }
            } else if ("farmer".equalsIgnoreCase(role)) {
                String query = "SELECT * FROM farmers WHERE email = ? AND password = ?";
                try (PreparedStatement ps = conn.prepareStatement(query)) {
                    ps.setString(1, emailOrUsername);
                    ps.setString(2, password);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            Farmer farmer = new Farmer(
                                rs.getInt("id"),
                                rs.getString("name"),
                                rs.getString("email"),
                                rs.getString("phone"),
                                rs.getString("password"),
                                rs.getString("location"),
                                rs.getString("farm_name"),
                                rs.getTimestamp("created_at")
                            );
                            HttpSession session = request.getSession();
                            session.setAttribute("role", "farmer");
                            session.setAttribute("user", farmer);
                            response.sendRedirect(request.getContextPath() + "/farmer/dashboard");
                            return;
                        }
                    }
                }
            } else if ("shopkeeper".equalsIgnoreCase(role)) {
                String query = "SELECT * FROM shopkeepers WHERE email = ? AND password = ?";
                try (PreparedStatement ps = conn.prepareStatement(query)) {
                    ps.setString(1, emailOrUsername);
                    ps.setString(2, password);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            Shopkeeper shopkeeper = new Shopkeeper(
                                rs.getInt("id"),
                                rs.getString("shop_name"),
                                rs.getString("owner_name"),
                                rs.getString("email"),
                                rs.getString("password"),
                                rs.getString("phone"),
                                rs.getString("location"),
                                rs.getTimestamp("created_at")
                            );
                            HttpSession session = request.getSession();
                            session.setAttribute("role", "shopkeeper");
                            session.setAttribute("user", shopkeeper);
                            response.sendRedirect(request.getContextPath() + "/shopkeeper/dashboard");
                            return;
                        }
                    }
                }
            }
            request.setAttribute("error", "Invalid username/email or password.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
