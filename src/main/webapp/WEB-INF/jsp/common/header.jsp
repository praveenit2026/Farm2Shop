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
            <!-- Language Toggle - always visible -->
            <li>
                <button id="langToggleBtn" onclick="toggleLanguage()" class="lang-btn">
                    <span style="font-size:1rem;">🇮🇳</span> தமிழ்
                </button>
            </li>

            <!-- Not logged in -->
            <c:if test="${empty sessionScope.role}">
                <li><a href="${pageContext.request.contextPath}/login" class="nav-link" data-i18n="nav.signin">Sign In</a></li>
                <li><a href="${pageContext.request.contextPath}/register" class="btn btn-primary btn-sm" data-i18n="nav.getstarted">Get Started</a></li>
            </c:if>

            <!-- Admin -->
            <c:if test="${sessionScope.role == 'admin'}">
                <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link" data-i18n="nav.dashboard">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/farmers" class="nav-link" data-i18n="nav.farmers">Farmers</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/shopkeepers" class="nav-link" data-i18n="nav.shopkeepers">Shopkeepers</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/complaints" class="nav-link" data-i18n="nav.complaints">Complaints</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/sales" class="nav-link" data-i18n="nav.sales">Sales</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="btn-logout" data-i18n="nav.logout">Logout</a></li>
            </c:if>

            <!-- Farmer -->
            <c:if test="${sessionScope.role == 'farmer'}">
                <li><a href="${pageContext.request.contextPath}/farmer/dashboard" class="nav-link" data-i18n="nav.dashboard">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/farmer/products" class="nav-link" data-i18n="nav.mycrops">My Crops</a></li>
                <li><a href="${pageContext.request.contextPath}/farmer/bookings" class="nav-link" data-i18n="nav.orders">Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/farmer/payments" class="nav-link" data-i18n="nav.payments">Payments</a></li>
                <li><a href="${pageContext.request.contextPath}/farmer/complaints" class="nav-link" data-i18n="nav.support">Support</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="btn-logout" data-i18n="nav.logout">Logout</a></li>
            </c:if>

            <!-- Shopkeeper -->
            <c:if test="${sessionScope.role == 'shopkeeper'}">
                <li><a href="${pageContext.request.contextPath}/shopkeeper/dashboard" class="nav-link" data-i18n="nav.dashboard">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/shopkeeper/products" class="nav-link" data-i18n="nav.marketplace">Marketplace</a></li>
                <li><a href="${pageContext.request.contextPath}/shopkeeper/bookings" class="nav-link" data-i18n="nav.myorders">My Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/shopkeeper/complaints" class="nav-link" data-i18n="nav.support">Support</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="btn-logout" data-i18n="nav.logout">Logout</a></li>
            </c:if>
        </ul>
    </div>
</nav>

<div class="container main-content">
