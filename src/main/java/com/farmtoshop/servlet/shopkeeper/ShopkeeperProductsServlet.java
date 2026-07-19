package com.farmtoshop.servlet.shopkeeper;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Product;
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

@WebServlet("/shopkeeper/products")
public class ShopkeeperProductsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"shopkeeper".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<Product> products = new ArrayList<>();
        String categoryFilter = request.getParameter("category");
        String search = request.getParameter("search");

        StringBuilder sql = new StringBuilder("SELECT p.*, f.name as farmer_name FROM products p JOIN farmers f ON p.farmer_id = f.id WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (categoryFilter != null && !categoryFilter.isEmpty()) {
            sql.append(" AND p.category = ?");
            params.add(categoryFilter);
        }
        if (search != null && !search.isEmpty()) {
            sql.append(" AND (LOWER(p.product_name) LIKE ? OR LOWER(p.category) LIKE ?)");
            params.add("%" + search.toLowerCase() + "%");
            params.add("%" + search.toLowerCase() + "%");
        }
        sql.append(" ORDER BY p.created_at DESC");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product(
                        rs.getInt("id"),
                        rs.getInt("farmer_id"),
                        rs.getString("product_name"),
                        rs.getString("category"),
                        rs.getString("location"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getTimestamp("created_at")
                    );
                    p.setFarmerName(rs.getString("farmer_name"));
                    products.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/jsp/shopkeeper/products.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"shopkeeper".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Shopkeeper shopkeeper = (Shopkeeper) session.getAttribute("user");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int orderQty = Integer.parseInt(request.getParameter("quantity"));

        try (Connection conn = DBConnection.getConnection()) {
            // Verify stock
            String checkSql = "SELECT * FROM products WHERE id = ?";
            try (PreparedStatement ps = conn.prepareStatement(checkSql)) {
                ps.setInt(1, productId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        int stockQty = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        int farmerId = rs.getInt("farmer_id");

                        if (orderQty > stockQty) {
                            request.setAttribute("error", "Insufficient stock. Only " + stockQty + " available.");
                            doGet(request, response);
                            return;
                        }

                        double total = price * orderQty;

                        // Create booking
                        String bookSql = "INSERT INTO bookings (product_id, shopkeeper_id, farmer_id, quantity, total_price, status) VALUES (?, ?, ?, ?, ?, 'Pending')";
                        try (PreparedStatement bookPs = conn.prepareStatement(bookSql)) {
                            bookPs.setInt(1, productId);
                            bookPs.setInt(2, shopkeeper.getId());
                            bookPs.setInt(3, farmerId);
                            bookPs.setString(4, String.valueOf(orderQty));
                            bookPs.setDouble(5, total);
                            bookPs.executeUpdate();
                        }

                        // Deduct stock
                        String updateStockSql = "UPDATE products SET quantity = quantity - ? WHERE id = ?";
                        try (PreparedStatement stockPs = conn.prepareStatement(updateStockSql)) {
                            stockPs.setInt(1, orderQty);
                            stockPs.setInt(2, productId);
                            stockPs.executeUpdate();
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error creating booking: " + e.getMessage());
            doGet(request, response);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/shopkeeper/bookings");
    }
}
