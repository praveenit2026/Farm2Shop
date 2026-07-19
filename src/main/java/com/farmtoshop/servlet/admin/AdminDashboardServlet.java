package com.farmtoshop.servlet.admin;

import com.farmtoshop.db.DBConnection;
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

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int totalFarmers = 0;
        int totalShopkeepers = 0;
        int totalProducts = 0;
        int totalBookings = 0;

        try (Connection conn = DBConnection.getConnection()) {
            // Count farmers
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM farmers");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) totalFarmers = rs.getInt(1);
            }
            // Count shopkeepers
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM shopkeepers");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) totalShopkeepers = rs.getInt(1);
            }
            // Count products
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM products");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) totalProducts = rs.getInt(1);
            }
            // Count bookings
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM bookings");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) totalBookings = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("totalFarmers", totalFarmers);
        request.setAttribute("totalShopkeepers", totalShopkeepers);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalBookings", totalBookings);

        request.getRequestDispatcher("/WEB-INF/jsp/admin/dashboard.jsp").forward(request, response);
    }
}
