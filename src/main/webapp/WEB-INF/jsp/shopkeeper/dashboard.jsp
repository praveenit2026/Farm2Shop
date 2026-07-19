<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px;">
    <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color); margin-bottom: 10px;"><span data-i18n="sd.welcome">Welcome Back, Owner of </span>${sessionScope.user.shopName}!</h2>
    <p style="color: var(--text-secondary);" data-i18n="sd.subtitle">Browse crop listings directly from farmers, and check your orders.</p>
</div>

<!-- Stats -->
<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-value">${totalBookings}</div>
        <div class="stat-label" data-i18n="stat.ordered">Crops Ordered</div>
    </div>
    <div class="stat-card">
        <div class="stat-value">$${totalSpent}0</div>
        <div class="stat-label" data-i18n="shop.modal.total">Total Outlay</div>
    </div>
</div>

<div class="grid">
    <div class="card">
        <h3 class="card-title" data-i18n="sd.procure.title">Procure Fresh Crops</h3>
        <p style="color: var(--text-secondary); margin-bottom: 20px;" data-i18n="sd.procure.desc">Browse local listings, filter by categories, compare farmer prices, and place direct bookings.</p>
        <a href="${pageContext.request.contextPath}/shopkeeper/products" class="btn btn-primary" data-i18n="sd.procure.btn">Browse Marketplace</a>
    </div>

    <div class="card">
        <h3 class="card-title" data-i18n="sd.bookings.title">Manage Bookings</h3>
        <p style="color: var(--text-secondary); margin-bottom: 20px;" data-i18n="sd.bookings.desc">Review your orders, pay online for pending orders, and track your active delivery status.</p>
        <a href="${pageContext.request.contextPath}/shopkeeper/bookings" class="btn btn-primary" data-i18n="sd.bookings.btn">My Bookings</a>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
