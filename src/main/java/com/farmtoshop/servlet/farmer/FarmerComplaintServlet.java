package com.farmtoshop.servlet.farmer;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Complaint;
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

@WebServlet("/farmer/complaints")
public class FarmerComplaintServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"farmer".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Farmer farmer = (Farmer) session.getAttribute("user");
        List<Complaint> complaints = new ArrayList<>();

        String sql = "SELECT * FROM complaints WHERE farmer_id = ? AND user_type = 'farmer' ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, farmer.getId());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Complaint c = new Complaint();
                    c.setId(rs.getInt("id"));
                    c.setFarmerId(rs.getInt("farmer_id"));
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
        request.getRequestDispatcher("/WEB-INF/jsp/farmer/complaints.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"farmer".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Farmer farmer = (Farmer) session.getAttribute("user");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        String sql = "INSERT INTO complaints (farmer_id, user_type, subject, message, status) VALUES (?, 'farmer', ?, ?, 'Pending')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, farmer.getId());
            ps.setString(2, subject);
            ps.setString(3, message);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/farmer/complaints");
    }
}
