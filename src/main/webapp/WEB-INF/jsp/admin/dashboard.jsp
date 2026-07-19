<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px;">
    <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color); margin-bottom: 10px;">Admin Dashboard</h2>
    <p style="color: var(--text-secondary);">Manage system statistics, partners, complaints, and trade sales reports.</p>
</div>

<!-- Stats Section -->
<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-value">${totalFarmers}</div>
        <div class="stat-label">Total Farmers</div>
    </div>
    <div class="stat-card">
        <div class="stat-value">${totalShopkeepers}</div>
        <div class="stat-label">Total Shopkeepers</div>
    </div>
    <div class="stat-card">
        <div class="stat-value">${totalProducts}</div>
        <div class="stat-label">Total Crop Listings</div>
    </div>
    <div class="stat-card">
        <div class="stat-value">${totalBookings}</div>
        <div class="stat-label">Completed Bookings</div>
    </div>
</div>

<!-- Actions / Quick Links Grid -->
<div class="grid">
    <div class="card">
        <h3 class="card-title">Manage Farmers</h3>
        <p style="color: var(--text-secondary); margin-bottom: 20px;">View detailed profile information of registered farmers and suspend/remove accounts if needed.</p>
        <a href="${pageContext.request.contextPath}/admin/farmers" class="btn btn-primary">Go to Farmers</a>
    </div>
    
    <div class="card">
        <h3 class="card-title">Manage Shopkeepers</h3>
        <p style="color: var(--text-secondary); margin-bottom: 20px;">View detailed business info of retail shop partners and audit system interactions.</p>
        <a href="${pageContext.request.contextPath}/admin/shopkeepers" class="btn btn-primary">Go to Shopkeepers</a>
    </div>

    <div class="card">
        <h3 class="card-title">Audit Complaints</h3>
        <p style="color: var(--text-secondary); margin-bottom: 20px;">Review disputes submitted by farmers and shopkeepers, post official system solutions.</p>
        <a href="${pageContext.request.contextPath}/admin/complaints" class="btn btn-primary">View Disputes</a>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
