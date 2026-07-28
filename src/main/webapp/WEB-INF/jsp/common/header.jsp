<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farm 2 Shop — B2B Agricultural Marketplace</title>
    <meta name="description" content="Direct farm-to-shop agricultural marketplace. Buy fresh crops directly from farmers without middlemen.">
    <link rel="preload" as="image" href="${pageContext.request.contextPath}/images/hero-banner.webp" type="image/webp" fetchpriority="high">
    <link rel="preload" as="image" href="${pageContext.request.contextPath}/images/hero-banner.jpg" type="image/jpeg" fetchpriority="high">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=16">
    <link rel="preconnect" href="https://fonts.googleapis.com">
</head>
<body>

<nav class="navbar ${empty sessionScope.role ? 'navbar-hero-overlay' : ''}">
    <div class="navbar-container">
        <a href="${pageContext.request.contextPath}/" class="logo">
            <div class="logo-icon">🌾</div>
            Farm 2 <span class="accent">Shop</span>
        </a>

        <div class="nav-right">
            <!-- Language Toggle - Outside on top bar for both Desktop & Mobile -->
            <button id="langToggleBtn" onclick="toggleLanguage()" class="lang-btn">
                <span style="font-size:1rem;">🇮🇳</span> தமிழ்
            </button>

            <!-- Desktop Nav Menu -->
            <ul class="nav-menu" id="navMenu">
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

            <!-- Hamburger Button (mobile only) -->
            <button class="hamburger" id="hamburgerBtn" onclick="toggleMobileMenu()" aria-label="Toggle menu">
                <span></span>
                <span></span>
                <span></span>
            </button>
        </div>
    </div>
</nav>

<!-- Mobile Drawer Menu -->
<div class="mobile-menu-overlay" id="mobileOverlay" onclick="closeMobileMenu()"></div>
<div class="mobile-drawer" id="mobileDrawer">
    <div class="mobile-drawer-header">
        <a href="${pageContext.request.contextPath}/" class="logo" style="color:#0f172a;">
            <div class="logo-icon">🌾</div>
            Farm 2 <span class="accent">Shop</span>
        </a>
        <button onclick="closeMobileMenu()" class="mobile-close-btn">✕</button>
    </div>

    <div class="mobile-drawer-body">
        <!-- Not logged in -->
        <c:if test="${empty sessionScope.role}">
            <a href="${pageContext.request.contextPath}/login" class="mobile-nav-link" data-i18n="nav.signin">Sign In</a>
            <a href="${pageContext.request.contextPath}/register" class="mobile-nav-link mobile-nav-primary" data-i18n="nav.getstarted">Get Started</a>
        </c:if>

        <!-- Admin -->
        <c:if test="${sessionScope.role == 'admin'}">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="mobile-nav-link" data-i18n="nav.dashboard">📊 Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/farmers" class="mobile-nav-link" data-i18n="nav.farmers">🌾 Farmers</a>
            <a href="${pageContext.request.contextPath}/admin/shopkeepers" class="mobile-nav-link" data-i18n="nav.shopkeepers">🏪 Shopkeepers</a>
            <a href="${pageContext.request.contextPath}/admin/complaints" class="mobile-nav-link" data-i18n="nav.complaints">📋 Complaints</a>
            <a href="${pageContext.request.contextPath}/admin/sales" class="mobile-nav-link" data-i18n="nav.sales">💰 Sales</a>
            <a href="${pageContext.request.contextPath}/logout" class="mobile-nav-link mobile-nav-danger" data-i18n="nav.logout">🚪 Logout</a>
        </c:if>

        <!-- Farmer -->
        <c:if test="${sessionScope.role == 'farmer'}">
            <a href="${pageContext.request.contextPath}/farmer/dashboard" class="mobile-nav-link" data-i18n="nav.dashboard">📊 Dashboard</a>
            <a href="${pageContext.request.contextPath}/farmer/products" class="mobile-nav-link" data-i18n="nav.mycrops">🌿 My Crops</a>
            <a href="${pageContext.request.contextPath}/farmer/bookings" class="mobile-nav-link" data-i18n="nav.orders">📦 Orders</a>
            <a href="${pageContext.request.contextPath}/farmer/payments" class="mobile-nav-link" data-i18n="nav.payments">💳 Payments</a>
            <a href="${pageContext.request.contextPath}/farmer/complaints" class="mobile-nav-link" data-i18n="nav.support">🛟 Support</a>
            <a href="${pageContext.request.contextPath}/logout" class="mobile-nav-link mobile-nav-danger" data-i18n="nav.logout">🚪 Logout</a>
        </c:if>

        <!-- Shopkeeper -->
        <c:if test="${sessionScope.role == 'shopkeeper'}">
            <a href="${pageContext.request.contextPath}/shopkeeper/dashboard" class="mobile-nav-link" data-i18n="nav.dashboard">📊 Dashboard</a>
            <a href="${pageContext.request.contextPath}/shopkeeper/products" class="mobile-nav-link" data-i18n="nav.marketplace">🛒 Marketplace</a>
            <a href="${pageContext.request.contextPath}/shopkeeper/bookings" class="mobile-nav-link" data-i18n="nav.myorders">📦 My Orders</a>
            <a href="${pageContext.request.contextPath}/shopkeeper/complaints" class="mobile-nav-link" data-i18n="nav.support">🛟 Support</a>
            <a href="${pageContext.request.contextPath}/logout" class="mobile-nav-link mobile-nav-danger" data-i18n="nav.logout">🚪 Logout</a>
        </c:if>
    </div>
</div>

<div class="container main-content">
