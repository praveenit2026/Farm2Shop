package com.farmtoshop.model;

import java.sql.Timestamp;

public class Booking {
    private int id;
    private int productId;
    private int shopkeeperId;
    private int farmerId;
    private String quantity;
    private double totalPrice;
    private String status;
    private Timestamp createdAt;

    // Extra display fields
    private String productName;
    private String shopkeeperName;
    private String farmerName;
    private String productCategory;
    private String productImage;

    public Booking() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public int getShopkeeperId() { return shopkeeperId; }
    public void setShopkeeperId(int shopkeeperId) { this.shopkeeperId = shopkeeperId; }

    public int getFarmerId() { return farmerId; }
    public void setFarmerId(int farmerId) { this.farmerId = farmerId; }

    public String getQuantity() { return quantity; }
    public void setQuantity(String quantity) { this.quantity = quantity; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getShopkeeperName() { return shopkeeperName; }
    public void setShopkeeperName(String shopkeeperName) { this.shopkeeperName = shopkeeperName; }

    public String getFarmerName() { return farmerName; }
    public void setFarmerName(String farmerName) { this.farmerName = farmerName; }

    public String getProductCategory() { return productCategory; }
    public void setProductCategory(String productCategory) { this.productCategory = productCategory; }

    public String getProductImage() { return productImage; }
    public void setProductImage(String productImage) { this.productImage = productImage; }
}
