package com.farmtoshop.servlet.farmer;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Booking;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/farmer/bookings")
public class FarmerBookingsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"farmer".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Farmer farmer = (Farmer) session.getAttribute("user");
        List<Booking> bookings = new ArrayList<>();

        String sql = "SELECT b.*, p.product_name, p.category as product_category, s.owner_name as shopkeeper_name " +
                     "FROM bookings b " +
                     "LEFT JOIN products p ON b.product_id = p.id " +
                     "LEFT JOIN shopkeepers s ON b.shopkeeper_id = s.id " +
                     "WHERE b.farmer_id = ? " +
                     "ORDER BY b.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, farmer.getId());
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
                    b.setShopkeeperName(rs.getString("shopkeeper_name"));
                    bookings.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("/WEB-INF/jsp/farmer/bookings.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"farmer".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String newStatus = request.getParameter("status"); // Approved, Rejected, Shipped, Delivered

        try (Connection conn = DBConnection.getConnection()) {
            // Update booking status
            String sql = "UPDATE bookings SET status = ? WHERE id = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, newStatus);
                ps.setInt(2, bookingId);
                ps.executeUpdate();
            }

            // Also check if there's a payment record for this booking, update the status of payment as well
            String paySql = "UPDATE payments SET status = ? WHERE booking_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(paySql)) {
                ps.setString(1, newStatus);
                ps.setInt(2, bookingId);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/farmer/bookings");
    }
}
