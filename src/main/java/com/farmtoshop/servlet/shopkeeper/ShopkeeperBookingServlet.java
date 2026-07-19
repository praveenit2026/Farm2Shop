package com.farmtoshop.servlet.shopkeeper;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Booking;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/shopkeeper/bookings")
public class ShopkeeperBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"shopkeeper".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Shopkeeper shopkeeper = (Shopkeeper) session.getAttribute("user");
        List<Booking> bookings = new ArrayList<>();

        String sql = "SELECT b.*, p.product_name, p.category as product_category, p.image as product_image, f.name as farmer_name " +
                     "FROM bookings b " +
                     "LEFT JOIN products p ON b.product_id = p.id " +
                     "LEFT JOIN farmers f ON b.farmer_id = f.id " +
                     "WHERE b.shopkeeper_id = ? " +
                     "ORDER BY b.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, shopkeeper.getId());
            try (ResultSet rs = ps.executeQuery()) {
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
                    b.setProductImage(rs.getString("product_image"));
                    b.setFarmerName(rs.getString("farmer_name"));
                    bookings.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("/WEB-INF/jsp/shopkeeper/bookings.jsp").forward(request, response);
    }
}
