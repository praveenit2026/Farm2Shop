package com.farmtoshop.model;

import java.sql.Timestamp;

public class Shopkeeper {
    private int id;
    private String shopName;
    private String ownerName;
    private String email;
    private String password;
    private String phone;
    private String location;
    private Timestamp createdAt;

    public Shopkeeper() {}

    public Shopkeeper(int id, String shopName, String ownerName, String email, String password, String phone, String location, Timestamp createdAt) {
        this.id = id;
        this.shopName = shopName;
        this.ownerName = ownerName;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.location = location;
        this.createdAt = createdAt;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getShopName() { return shopName; }
    public void setShopName(String shopName) { this.shopName = shopName; }

    public String getOwnerName() { return ownerName; }
    public void setOwnerName(String ownerName) { this.ownerName = ownerName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
