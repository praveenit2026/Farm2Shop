package com.farmtoshop.servlet.farmer;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Farmer;
import com.farmtoshop.model.Payment;
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

@WebServlet("/farmer/payments")
public class FarmerPaymentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"farmer".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Farmer farmer = (Farmer) session.getAttribute("user");
        List<Payment> payments = new ArrayList<>();

        String sql = "SELECT p.*, pr.product_name, s.owner_name as shopkeeper_name " +
                     "FROM payments p " +
                     "JOIN bookings b ON p.booking_id = b.id " +
                     "JOIN products pr ON b.product_id = pr.id " +
                     "JOIN shopkeepers s ON p.shopkeeper_id = s.id " +
                     "WHERE b.farmer_id = ? " +
                     "ORDER BY p.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, farmer.getId());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Payment pay = new Payment();
                    pay.setId(rs.getInt("id"));
                    pay.setBookingId(rs.getInt("booking_id"));
                    pay.setShopkeeperId(rs.getInt("shopkeeper_id"));
                    pay.setPaymentMethod(rs.getString("payment_method"));
                    pay.setAmount(rs.getDouble("amount"));
                    pay.setCardNumber(rs.getString("card_number"));
                    pay.setCardHolder(rs.getString("card_holder"));
                    pay.setExpiryDate(rs.getString("expiry_date"));
                    pay.setCvv(rs.getString("cvv"));
                    pay.setStatus(rs.getString("status"));
                    pay.setCreatedAt(rs.getTimestamp("created_at"));
                    pay.setProductName(rs.getString("product_name"));
                    pay.setShopkeeperName(rs.getString("shopkeeper_name"));
                    payments.add(pay);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("payments", payments);
        request.getRequestDispatcher("/WEB-INF/jsp/farmer/payments.jsp").forward(request, response);
    }
}
