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

@WebServlet("/shopkeeper/track")
public class ShopkeeperTrackOrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"shopkeeper".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String bookingIdParam = request.getParameter("bookingId");
        if (bookingIdParam == null || bookingIdParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/shopkeeper/bookings");
            return;
        }

        int bookingId;
        try {
            bookingId = Integer.parseInt(bookingIdParam.trim());
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/shopkeeper/bookings");
            return;
        }

        Shopkeeper shopkeeper = (Shopkeeper) session.getAttribute("user");

        String sql = "SELECT b.*, " +
                     "p.product_name, p.category AS product_category, p.image AS product_image, p.location AS farmer_location, " +
                     "f.name AS farmer_name, " +
                     "s.shop_name AS shopkeeper_shop, s.location AS shopkeeper_location " +
                     "FROM bookings b " +
                     "LEFT JOIN products p ON b.product_id = p.id " +
                     "LEFT JOIN farmers f ON b.farmer_id = f.id " +
                     "LEFT JOIN shopkeepers s ON b.shopkeeper_id = s.id " +
                     "WHERE b.id = ? AND b.shopkeeper_id = ?";

        Booking booking = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            ps.setInt(2, shopkeeper.getId());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    booking = new Booking();
                    booking.setId(rs.getInt("id"));
                    booking.setProductId(rs.getInt("product_id"));
                    booking.setShopkeeperId(rs.getInt("shopkeeper_id"));
                    booking.setFarmerId(rs.getInt("farmer_id"));
                    booking.setQuantity(rs.getString("quantity"));
                    booking.setTotalPrice(rs.getDouble("total_price"));
                    booking.setStatus(rs.getString("status"));
                    booking.setCreatedAt(rs.getTimestamp("created_at"));
                    booking.setProductName(rs.getString("product_name"));
                    booking.setProductCategory(rs.getString("product_category"));
                    booking.setProductImage(rs.getString("product_image"));
                    booking.setFarmerName(rs.getString("farmer_name"));
                    booking.setFarmerLocation(rs.getString("farmer_location"));
                    booking.setShopkeeperLocation(rs.getString("shopkeeper_location"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (booking == null) {
            response.sendRedirect(request.getContextPath() + "/shopkeeper/bookings");
            return;
        }

        request.setAttribute("booking", booking);
        request.setAttribute("viewerRole", "shopkeeper");
        request.getRequestDispatcher("/WEB-INF/jsp/common/trackOrder.jsp").forward(request, response);
    }
}
