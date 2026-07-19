<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px;">
    <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color); margin-bottom: 10px;">Welcome Back, Owner of ${sessionScope.user.shopName}!</h2>
    <p style="color: var(--text-secondary);">Browse crop listings directly from farmers, and check your orders.</p>
</div>

<!-- Stats -->
<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-value">${totalBookings}</div>
        <div class="stat-label">Crops Ordered</div>
    </div>
    <div class="stat-card">
        <div class="stat-value">$${totalSpent}0</div>
        <div class="stat-label">Total Outlay</div>
    </div>
</div>

<div class="grid">
    <div class="card">
        <h3 class="card-title">Procure Fresh Crops</h3>
        <p style="color: var(--text-secondary); margin-bottom: 20px;">Browse local listings, filter by categories, compare farmer prices, and place direct bookings.</p>
        <a href="${pageContext.request.contextPath}/shopkeeper/products" class="btn btn-primary">Browse Marketplace</a>
    </div>

    <div class="card">
        <h3 class="card-title">Manage Bookings</h3>
        <p style="color: var(--text-secondary); margin-bottom: 20px;">Review your orders, pay online for pending orders, and track your active delivery status.</p>
        <a href="${pageContext.request.contextPath}/shopkeeper/bookings" class="btn btn-primary">My Bookings</a>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
