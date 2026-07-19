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

@WebServlet("/shopkeeper/payment")
public class ShopkeeperPaymentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"shopkeeper".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        Booking booking = null;

        String sql = "SELECT b.*, p.product_name FROM bookings b JOIN products p ON b.product_id = p.id WHERE b.id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    booking = new Booking();
                    booking.setId(rs.getInt("id"));
                    booking.setTotalPrice(rs.getDouble("total_price"));
                    booking.setProductName(rs.getString("product_name"));
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
        request.getRequestDispatcher("/WEB-INF/jsp/shopkeeper/payment.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"shopkeeper".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Shopkeeper shopkeeper = (Shopkeeper) session.getAttribute("user");
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String paymentMethod = request.getParameter("paymentMethod"); // Card or COD
        double amount = Double.parseDouble(request.getParameter("amount"));

        String cardNumber = request.getParameter("cardNumber");
        String cardHolder = request.getParameter("cardHolder");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");

        if ("COD".equalsIgnoreCase(paymentMethod)) {
            cardNumber = "NULL";
            cardHolder = "Cash Customer";
            expiryDate = "NULL";
            cvv = "NULL";
        }

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);
            try {
                // Insert payment record
                String paySql = "INSERT INTO payments (booking_id, shopkeeper_id, payment_method, amount, card_number, card_holder, expiry_date, cvv, status) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'Success')";
                try (PreparedStatement ps = conn.prepareStatement(paySql)) {
                    ps.setInt(1, bookingId);
                    ps.setInt(2, shopkeeper.getId());
                    ps.setString(3, paymentMethod);
                    ps.setDouble(4, amount);
                    ps.setString(5, cardNumber);
                    ps.setString(6, cardHolder);
                    ps.setString(7, expiryDate);
                    ps.setString(8, cvv);
                    ps.executeUpdate();
                }

                // Update booking status to 'Success' or 'Paid' or 'Ordered'
                String bookSql = "UPDATE bookings SET status = 'Success' WHERE id = ?";
                try (PreparedStatement ps = conn.prepareStatement(bookSql)) {
                    ps.setInt(1, bookingId);
                    ps.executeUpdate();
                }

                conn.commit();
            } catch (Exception e) {
                conn.rollback();
                throw e;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/shopkeeper/bookings?error=PaymentFailed");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/shopkeeper/bookings?success=Paid");
    }
}
