package com.farmtoshop.model;

import java.sql.Timestamp;

public class Product {
    private int id;
    private int farmerId;
    private String productName;
    private String category;
    private String location;
    private int quantity;
    private double price;
    private String image;
    private Timestamp createdAt;
    
    // Extra display fields
    private String farmerName;

    public Product() {}

    public Product(int id, int farmerId, String productName, String category, String location, int quantity, double price, String image, Timestamp createdAt) {
        this.id = id;
        this.farmerId = farmerId;
        this.productName = productName;
        this.category = category;
        this.location = location;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.createdAt = createdAt;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getFarmerId() { return farmerId; }
    public void setFarmerId(int farmerId) { this.farmerId = farmerId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getFarmerName() { return farmerName; }
    public void setFarmerName(String farmerName) { this.farmerName = farmerName; }
}
