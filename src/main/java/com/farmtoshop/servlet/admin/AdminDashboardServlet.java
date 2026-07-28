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

        String combinedSql = "SELECT " +
            "(SELECT COUNT(*) FROM farmers) as total_farmers, " +
            "(SELECT COUNT(*) FROM shopkeepers) as total_shopkeepers, " +
            "(SELECT COUNT(*) FROM products) as total_products, " +
            "(SELECT COUNT(*) FROM bookings) as total_bookings";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(combinedSql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                totalFarmers = rs.getInt("total_farmers");
                totalShopkeepers = rs.getInt("total_shopkeepers");
                totalProducts = rs.getInt("total_products");
                totalBookings = rs.getInt("total_bookings");
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
