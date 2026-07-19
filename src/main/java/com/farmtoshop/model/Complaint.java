package com.farmtoshop.model;

import java.sql.Timestamp;

public class Complaint {
    private int id;
    private Integer farmerId;
    private Integer shopkeeperId;
    private int adminId;
    private String userType;
    private String subject;
    private String message;
    private String solution;
    private String status;
    private Timestamp createdAt;

    // Extra display fields
    private String farmerName;
    private String shopkeeperName;

    public Complaint() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Integer getFarmerId() { return farmerId; }
    public void setFarmerId(Integer farmerId) { this.farmerId = farmerId; }

    public Integer getShopkeeperId() { return shopkeeperId; }
    public void setShopkeeperId(Integer shopkeeperId) { this.shopkeeperId = shopkeeperId; }

    public int getAdminId() { return adminId; }
    public void setAdminId(int adminId) { this.adminId = adminId; }

    public String getUserType() { return userType; }
    public void setUserType(String userType) { this.userType = userType; }

    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public String getSolution() { return solution; }
    public void setSolution(String solution) { this.solution = solution; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getFarmerName() { return farmerName; }
    public void setFarmerName(String farmerName) { this.farmerName = farmerName; }

    public String getShopkeeperName() { return shopkeeperName; }
    public void setShopkeeperName(String shopkeeperName) { this.shopkeeperName = shopkeeperName; }
}
