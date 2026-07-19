package com.farmtoshop.model;

import java.sql.Timestamp;

public class Payment {
    private int id;
    private int bookingId;
    private int shopkeeperId;
    private String paymentMethod;
    private double amount;
    private String cardNumber;
    private String cardHolder;
    private String expiryDate;
    private String cvv;
    private String status;
    private Timestamp createdAt;

    // Extra display fields
    private String productName;
    private String shopkeeperName;
    private int farmerId;
    private String farmerName;

    public Payment() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public int getShopkeeperId() { return shopkeeperId; }
    public void setShopkeeperId(int shopkeeperId) { this.shopkeeperId = shopkeeperId; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getCardNumber() { return cardNumber; }
    public void setCardNumber(String cardNumber) { this.cardNumber = cardNumber; }

    public String getCardHolder() { return cardHolder; }
    public void setCardHolder(String cardHolder) { this.cardHolder = cardHolder; }

    public String getExpiryDate() { return expiryDate; }
    public void setExpiryDate(String expiryDate) { this.expiryDate = expiryDate; }

    public String getCvv() { return cvv; }
    public void setCvv(String cvv) { this.cvv = cvv; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getShopkeeperName() { return shopkeeperName; }
    public void setShopkeeperName(String shopkeeperName) { this.shopkeeperName = shopkeeperName; }

    public int getFarmerId() { return farmerId; }
    public void setFarmerId(int farmerId) { this.farmerId = farmerId; }

    public String getFarmerName() { return farmerName; }
    public void setFarmerName(String farmerName) { this.farmerName = farmerName; }
}
