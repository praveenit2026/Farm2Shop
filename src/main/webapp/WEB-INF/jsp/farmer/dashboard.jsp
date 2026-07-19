<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px;">
    <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color); margin-bottom: 10px;">Welcome Back, ${sessionScope.user.name}!</h2>
    <p style="color: var(--text-secondary);">Manage your farm and check orders from shopkeepers.</p>
</div>

<!-- Stats -->
<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-value">${totalProducts}</div>
        <div class="stat-label">Active Crops Listed</div>
    </div>
    <div class="stat-card">
        <div class="stat-value">${pendingOrders}</div>
        <div class="stat-label">Pending Orders</div>
    </div>
    <div class="stat-card">
        <div class="stat-value">$${totalEarnings}0</div>
        <div class="stat-label">Total Earnings</div>
    </div>
</div>

<div class="grid">
    <div class="card">
        <h3 class="card-title">Add / Manage Crops</h3>
        <p style="color: var(--text-secondary); margin-bottom: 20px;">List your fresh crops, update pricing, update quantity, and delete stale listings.</p>
        <a href="${pageContext.request.contextPath}/farmer/products" class="btn btn-primary">My Crop Listings</a>
    </div>

    <div class="card">
        <h3 class="card-title">Incoming Orders</h3>
        <p style="color: var(--text-secondary); margin-bottom: 20px;">View purchase orders placed by shopkeepers. Process orders to Shipped/Delivered state.</p>
        <a href="${pageContext.request.contextPath}/farmer/bookings" class="btn btn-primary">Manage Orders</a>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
