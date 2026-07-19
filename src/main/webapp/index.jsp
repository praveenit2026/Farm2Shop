<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<!-- Hero: Sits naturally inside the standard layout container -->
<section class="hero" style="border-radius: var(--radius); margin-bottom: 40px; border: 1px solid var(--border); box-shadow: var(--shadow-sm); padding: 60px 24px;">
    <div class="hero-badge">🌱 Farm-to-Shop B2B Platform</div>
    <h1 style="font-size: clamp(2rem, 5vw, 3.5rem); margin-top: 10px;">Direct Crops,<br>No Middlemen.</h1>
    <p style="margin-bottom: 30px;">Connecting local farmers with shopkeepers for transparent, commission-free agricultural trade. Fresh produce, fair prices.</p>
    <div class="hero-buttons">
        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Start Trading →</a>
        <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">Join as Partner</a>
    </div>
</section>

<!-- Feature Cards -->
<div style="text-align: center; margin: 60px 0 40px;">
    <p style="color: var(--accent-green); font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 8px;">Why Farm 2 Shop?</p>
    <h2 style="font-size: clamp(1.8rem, 3.5vw, 2.5rem); font-weight: 800; letter-spacing: -0.5px; color: var(--text-primary); line-height: 1.2;">Built for both sides of the chain</h2>
</div>

<div class="grid">
    <div class="card">
        <div class="feature-icon feature-icon-green">🚜</div>
        <h3 class="card-title">For Farmers</h3>
        <p style="color: var(--text-secondary); line-height: 1.6; font-size: 0.95rem;">List your fresh crops directly, set your own prices, manage orders, and receive payments — without commission losses or intermediaries.</p>
    </div>

    <div class="card">
        <div class="feature-icon feature-icon-purple">🏪</div>
        <h3 class="card-title">For Shopkeepers</h3>
        <p style="color: var(--text-secondary); line-height: 1.6; font-size: 0.95rem;">Browse verified farm listings, compare prices, book crops online, pay securely, and track your deliveries in real-time.</p>
    </div>

    <div class="card">
        <div class="feature-icon feature-icon-blue">🛡️</div>
        <h3 class="card-title">Secure & Transparent</h3>
        <p style="color: var(--text-secondary); line-height: 1.6; font-size: 0.95rem;">End-to-end encrypted, backed by Supabase PostgreSQL. Full audit trail of every transaction, with admin mediation for disputes.</p>
    </div>
</div>

<!-- Stats Strip -->
<div style="margin: 40px 0; padding: 32px; background: var(--bg-secondary); border: 1px solid var(--border); border-radius: 20px; display: grid; grid-template-columns: repeat(auto-fit, minmax(160px, 1fr)); gap: 24px; text-align: center; box-shadow: var(--shadow-sm);">
    <div>
        <div style="font-size: 2.2rem; font-weight: 900; color: var(--accent-green); letter-spacing: -0.5px;">0%</div>
        <div style="color: var(--text-secondary); font-size: 0.75rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-top: 4px;">Commission Fee</div>
    </div>
    <div>
        <div style="font-size: 2.2rem; font-weight: 900; color: var(--accent-purple); letter-spacing: -0.5px;">24/7</div>
        <div style="color: var(--text-secondary); font-size: 0.75rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-top: 4px;">Marketplace Access</div>
    </div>
    <div>
        <div style="font-size: 2.2rem; font-weight: 900; color: var(--accent-blue); letter-spacing: -0.5px;">100%</div>
        <div style="color: var(--text-secondary); font-size: 0.75rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-top: 4px;">Direct Trade</div>
    </div>
</div>

<!-- CTA Banner -->
<div style="margin: 40px 0 60px; padding: 48px 32px; border-radius: 24px; background: var(--accent-green-light); border: 1px solid rgba(22, 163, 74, 0.2); text-align: center; box-shadow: var(--shadow-sm);">
    <h3 style="font-size: 1.8rem; font-weight: 800; letter-spacing: -0.5px; margin-bottom: 8px;">Ready to transform your trade?</h3>
    <p style="color: var(--text-secondary); margin-bottom: 24px; font-size: 0.95rem;">Join hundreds of farmers and shopkeepers already using Farm 2 Shop.</p>
    <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Create Free Account</a>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
