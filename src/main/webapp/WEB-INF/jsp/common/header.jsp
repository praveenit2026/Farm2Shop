<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farm 2 Shop — B2B Agricultural Marketplace</title>
    <meta name="description" content="Direct farm-to-shop agricultural marketplace. Buy fresh crops directly from farmers without middlemen.">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
</head>
<body>

<nav class="navbar">
    <div class="navbar-container">
        <a href="${pageContext.request.contextPath}/" class="logo">
            <div class="logo-icon">🌾</div>
            Farm 2 <span class="accent">Shop</span>
        </a>

        <ul class="nav-menu">
            <!-- Not logged in -->
            <c:if test="${empty sessionScope.role}">
                <li><a href="${pageContext.request.contextPath}/login" class="nav-link">Sign In</a></li>
                <li><a href="${pageContext.request.contextPath}/register" class="btn btn-primary btn-sm">Get Started</a></li>
            </c:if>

            <!-- Admin -->
            <c:if test="${sessionScope.role == 'admin'}">
                <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/farmers" class="nav-link">Farmers</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/shopkeepers" class="nav-link">Shopkeepers</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/complaints" class="nav-link">Complaints</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/sales" class="nav-link">Sales</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a></li>
            </c:if>

            <!-- Farmer -->
            <c:if test="${sessionScope.role == 'farmer'}">
                <li><a href="${pageContext.request.contextPath}/farmer/dashboard" class="nav-link">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/farmer/products" class="nav-link">My Crops</a></li>
                <li><a href="${pageContext.request.contextPath}/farmer/bookings" class="nav-link">Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/farmer/payments" class="nav-link">Payments</a></li>
                <li><a href="${pageContext.request.contextPath}/farmer/complaints" class="nav-link">Support</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a></li>
            </c:if>

            <!-- Shopkeeper -->
            <c:if test="${sessionScope.role == 'shopkeeper'}">
                <li><a href="${pageContext.request.contextPath}/shopkeeper/dashboard" class="nav-link">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/shopkeeper/products" class="nav-link">Marketplace</a></li>
                <li><a href="${pageContext.request.contextPath}/shopkeeper/bookings" class="nav-link">My Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/shopkeeper/complaints" class="nav-link">Support</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a></li>
            </c:if>
        </ul>
    </div>
</nav>

<div class="container" style="margin-top: 40px; min-height: 80vh;">
