<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-top: -30px;">
    <!-- Hero Section -->
    <div class="hero">
        <div class="container">
            <h1>Direct Crops from Farm to Shop</h1>
            <p>Empowering farmers by cutting out middlemen. Allowing shopkeepers to procure high-quality, fresh produce directly from local farms.</p>
            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Start Trading</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">Join as Partner</a>
            </div>
        </div>
    </div>

    <!-- Marketplace Features -->
    <div class="container">
        <h2 style="text-align: center; margin-top: 60px; font-weight: 800; font-size: 2.2rem; color: var(--primary-color);">Why Choose Farm 2 Shop?</h2>
        
        <div class="grid">
            <div class="card" style="text-align: center;">
                <div style="font-size: 3rem; margin-bottom: 15px;">🚜</div>
                <h3 class="card-title">For Farmers</h3>
                <p style="color: var(--text-secondary);">Upload crops directly, set custom prices, receive direct payments without commission loss.</p>
            </div>
            
            <div class="card" style="text-align: center;">
                <div style="font-size: 3rem; margin-bottom: 15px;">🏪</div>
                <h3 class="card-title">For Shopkeepers</h3>
                <p style="color: var(--text-secondary);">Browse fresh farm listings, pay online securely, and track booking statuses easily.</p>
            </div>
            
            <div class="card" style="text-align: center;">
                <div style="font-size: 3rem; margin-bottom: 15px;">🛡️</div>
                <h3 class="card-title">Secure & Transparent</h3>
                <p style="color: var(--text-secondary);">Integrated with PostgreSQL. Resolves conflicts through direct Admin support. Complete ledger of past sales reports.</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
