package com.farmtoshop.servlet.farmer;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Farmer;
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

@WebServlet("/farmer/dashboard")
public class FarmerDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"farmer".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Farmer farmer = (Farmer) session.getAttribute("user");
        int totalProducts = 0;
        int pendingOrders = 0;
        double totalEarnings = 0.0;

        try (Connection conn = DBConnection.getConnection()) {
            // Count products
            String q1 = "SELECT COUNT(*) FROM products WHERE farmer_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(q1)) {
                ps.setInt(1, farmer.getId());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) totalProducts = rs.getInt(1);
                }
            }

            // Pending orders count
            String q2 = "SELECT COUNT(*) FROM bookings WHERE farmer_id = ? AND status = 'Pending'";
            try (PreparedStatement ps = conn.prepareStatement(q2)) {
                ps.setInt(1, farmer.getId());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) pendingOrders = rs.getInt(1);
                }
            }

            // Earnings
            String q3 = "SELECT SUM(amount) FROM payments p " +
                        "JOIN bookings b ON p.booking_id = b.id " +
                        "WHERE b.farmer_id = ? AND p.status IN ('Success', 'Delivered', 'Shipped')";
            try (PreparedStatement ps = conn.prepareStatement(q3)) {
                ps.setInt(1, farmer.getId());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) totalEarnings = rs.getDouble(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("pendingOrders", pendingOrders);
        request.setAttribute("totalEarnings", totalEarnings);

        request.getRequestDispatcher("/WEB-INF/jsp/farmer/dashboard.jsp").forward(request, response);
    }
}
