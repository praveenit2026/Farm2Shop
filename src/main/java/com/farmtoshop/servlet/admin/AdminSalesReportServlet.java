package com.farmtoshop.servlet.admin;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Booking;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/sales")
public class AdminSalesReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.*, p.product_name, p.category as product_category, " +
                     "s.owner_name as shopkeeper_name, f.name as farmer_name " +
                     "FROM bookings b " +
                     "LEFT JOIN products p ON b.product_id = p.id " +
                     "LEFT JOIN shopkeepers s ON b.shopkeeper_id = s.id " +
                     "LEFT JOIN farmers f ON b.farmer_id = f.id " +
                     "ORDER BY b.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Booking b = new Booking();
                b.setId(rs.getInt("id"));
                b.setProductId(rs.getInt("product_id"));
                b.setShopkeeperId(rs.getInt("shopkeeper_id"));
                b.setFarmerId(rs.getInt("farmer_id"));
                b.setQuantity(rs.getString("quantity"));
                b.setTotalPrice(rs.getDouble("total_price"));
                b.setStatus(rs.getString("status"));
                b.setCreatedAt(rs.getTimestamp("created_at"));
                b.setProductName(rs.getString("product_name"));
                b.setProductCategory(rs.getString("product_category"));
                b.setShopkeeperName(rs.getString("shopkeeper_name"));
                b.setFarmerName(rs.getString("farmer_name"));
                bookings.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("/WEB-INF/jsp/admin/sales.jsp").forward(request, response);
    }
}
