package com.farmtoshop.servlet.farmer;

import com.farmtoshop.db.DBConnection;
import com.farmtoshop.model.Farmer;
import com.farmtoshop.model.Product;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/farmer/products")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class FarmerAddProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"farmer".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Farmer farmer = (Farmer) session.getAttribute("user");
        List<Product> products = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM products WHERE farmer_id = ? ORDER BY created_at DESC";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, farmer.getId());
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        products.add(new Product(
                            rs.getInt("id"),
                            rs.getInt("farmer_id"),
                            rs.getString("product_name"),
                            rs.getString("category"),
                            rs.getString("location"),
                            rs.getInt("quantity"),
                            rs.getDouble("price"),
                            rs.getString("image"),
                            rs.getTimestamp("created_at")
                        ));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/jsp/farmer/products.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"farmer".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Farmer farmer = (Farmer) session.getAttribute("user");
        String action = request.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "DELETE FROM products WHERE id = ? AND farmer_id = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setInt(1, productId);
                    ps.setInt(2, farmer.getId());
                    ps.executeUpdate();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/farmer/products");
            return;
        }

        // Add Product Flow
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        String location = request.getParameter("location");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        String imagePath = "uploads/default.png";

        // File upload handling
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = System.currentTimeMillis() + "_" + getSubmittedFileName(filePart);
            // Save in application context directory
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            filePart.write(uploadPath + File.separator + fileName);
            imagePath = "uploads/" + fileName;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO products (farmer_id, product_name, category, location, quantity, price, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, farmer.getId());
                ps.setString(2, productName);
                ps.setString(3, category);
                ps.setString(4, location);
                ps.setInt(5, quantity);
                ps.setDouble(6, price);
                ps.setString(7, imagePath);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/farmer/products");
    }

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // safe filename
            }
        }
        return "file";
    }
}
