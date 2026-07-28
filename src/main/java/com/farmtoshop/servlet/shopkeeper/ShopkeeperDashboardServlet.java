package com.farmtoshop.servlet.shopkeeper;

import com.farmtoshop.db.DBConnection;
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

@WebServlet("/shopkeeper/dashboard")
public class ShopkeeperDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"shopkeeper".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Shopkeeper shopkeeper = (Shopkeeper) session.getAttribute("user");
        int totalBookings = 0;
        double totalSpent = 0.0;

        String combinedSql = "SELECT " +
            "(SELECT COUNT(*) FROM bookings WHERE shopkeeper_id = ?) as total_bookings, " +
            "(SELECT COALESCE(SUM(amount), 0) FROM payments WHERE shopkeeper_id = ? AND status != 'Failed') as total_spent";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(combinedSql)) {
            ps.setInt(1, shopkeeper.getId());
            ps.setInt(2, shopkeeper.getId());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalBookings = rs.getInt("total_bookings");
                    totalSpent = rs.getDouble("total_spent");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("totalBookings", totalBookings);
        request.setAttribute("totalSpent", totalSpent);

        request.getRequestDispatcher("/WEB-INF/jsp/shopkeeper/dashboard.jsp").forward(request, response);
    }
}
