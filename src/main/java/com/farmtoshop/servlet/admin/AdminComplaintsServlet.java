package com.farmtoshop.servlet.admin;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Complaint;
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

@WebServlet("/admin/complaints")
public class AdminComplaintsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT c.*, f.name as farmer_name, s.owner_name as shopkeeper_name " +
                     "FROM complaints c " +
                     "LEFT JOIN farmers f ON c.farmer_id = f.id " +
                     "LEFT JOIN shopkeepers s ON c.shopkeeper_id = s.id " +
                     "ORDER BY c.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setFarmerId((Integer) rs.getObject("farmer_id"));
                c.setShopkeeperId((Integer) rs.getObject("shopkeeper_id"));
                c.setAdminId(rs.getInt("admin_id"));
                c.setUserType(rs.getString("user_type"));
                c.setSubject(rs.getString("subject"));
                c.setMessage(rs.getString("message"));
                c.setSolution(rs.getString("solution"));
                c.setStatus(rs.getString("status"));
                c.setCreatedAt(rs.getTimestamp("created_at"));
                c.setFarmerName(rs.getString("farmer_name"));
                c.setShopkeeperName(rs.getString("shopkeeper_name"));
                complaints.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("complaints", complaints);
        request.getRequestDispatcher("/WEB-INF/jsp/admin/complaints.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int complaintId = Integer.parseInt(request.getParameter("id"));
        String solution = request.getParameter("solution");

        String sql = "UPDATE complaints SET solution = ?, status = 'Solved' WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, solution);
            ps.setInt(2, complaintId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/admin/complaints");
    }
}
