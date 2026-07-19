package com.farmtoshop.servlet.shopkeeper;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Complaint;
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

@WebServlet("/shopkeeper/complaints")
public class ShopkeeperComplaintServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"shopkeeper".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Shopkeeper shopkeeper = (Shopkeeper) session.getAttribute("user");
        List<Complaint> complaints = new ArrayList<>();

        String sql = "SELECT * FROM complaints WHERE shopkeeper_id = ? AND user_type = 'shopkeeper' ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, shopkeeper.getId());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Complaint c = new Complaint();
                    c.setId(rs.getInt("id"));
                    c.setShopkeeperId(rs.getInt("shopkeeper_id"));
                    c.setAdminId(rs.getInt("admin_id"));
                    c.setUserType(rs.getString("user_type"));
                    c.setSubject(rs.getString("subject"));
                    c.setMessage(rs.getString("message"));
                    c.setSolution(rs.getString("solution"));
                    c.setStatus(rs.getString("status"));
                    c.setCreatedAt(rs.getTimestamp("created_at"));
                    complaints.add(c);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("complaints", complaints);
        request.getRequestDispatcher("/WEB-INF/jsp/shopkeeper/complaints.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"shopkeeper".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Shopkeeper shopkeeper = (Shopkeeper) session.getAttribute("user");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        String sql = "INSERT INTO complaints (shopkeeper_id, user_type, subject, message, status) VALUES (?, 'shopkeeper', ?, ?, 'Pending')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, shopkeeper.getId());
            ps.setString(2, subject);
            ps.setString(3, message);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/shopkeeper/complaints");
    }
}
