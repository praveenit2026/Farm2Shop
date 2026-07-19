<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

</div><!-- close inner container -->

<!-- Hero: Full viewport, outside the container -->
<div style="margin-top: -40px;">
    <section class="hero">
        <div class="container">
            <div class="hero-badge">🌱 Farm-to-Shop B2B Platform</div>
            <h1>Direct Crops,<br>No Middlemen.</h1>
            <p>Connecting local farmers with shopkeepers for transparent, commission-free agricultural trade. Fresh produce, fair prices.</p>
            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Start Trading →</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">Join as Partner</a>
            </div>
        </div>
    </section>

    <!-- Feature Cards -->
    <div class="container" style="padding-top: 80px; padding-bottom: 80px;">
        <div style="text-align: center; margin-bottom: 56px;">
            <p style="color: var(--accent-green); font-size: 0.8rem; font-weight: 700; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 12px;">Why Farm 2 Shop?</p>
            <h2 style="font-size: clamp(2rem, 4vw, 3rem); font-weight: 800; letter-spacing: -1px; color: var(--text-primary);">Built for both sides<br>of the chain</h2>
        </div>

        <div class="grid">
            <div class="card" style="animation: fade-in-up 0.5s ease 0.1s both;">
                <div class="feature-icon feature-icon-green">🚜</div>
                <h3 class="card-title">For Farmers</h3>
                <p style="color: var(--text-secondary); line-height: 1.7;">List your fresh crops directly, set your own prices, manage orders, and receive payments — without commission losses or intermediaries.</p>
            </div>

            <div class="card" style="animation: fade-in-up 0.5s ease 0.2s both;">
                <div class="feature-icon feature-icon-purple">🏪</div>
                <h3 class="card-title">For Shopkeepers</h3>
                <p style="color: var(--text-secondary); line-height: 1.7;">Browse verified farm listings, compare prices, book crops online, pay securely, and track your deliveries in real-time.</p>
            </div>

            <div class="card" style="animation: fade-in-up 0.5s ease 0.3s both;">
                <div class="feature-icon feature-icon-blue">🛡️</div>
                <h3 class="card-title">Secure & Transparent</h3>
                <p style="color: var(--text-secondary); line-height: 1.7;">End-to-end encrypted, backed by Supabase PostgreSQL. Full audit trail of every transaction, with admin mediation for disputes.</p>
            </div>
        </div>

        <!-- Stats Strip -->
        <div style="margin-top: 60px; padding: 36px; background: var(--bg-card); border: 1px solid var(--border); border-radius: 20px; display: grid; grid-template-columns: repeat(auto-fit, minmax(160px, 1fr)); gap: 32px; text-align: center;">
            <div>
                <div style="font-size: 2.5rem; font-weight: 900; color: var(--accent-green); letter-spacing: -1px;">0%</div>
                <div style="color: var(--text-secondary); font-size: 0.82rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; margin-top: 4px;">Commission Fee</div>
            </div>
            <div>
                <div style="font-size: 2.5rem; font-weight: 900; color: var(--accent-purple); letter-spacing: -1px;">24/7</div>
                <div style="color: var(--text-secondary); font-size: 0.82rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; margin-top: 4px;">Marketplace Access</div>
            </div>
            <div>
                <div style="font-size: 2.5rem; font-weight: 900; color: var(--accent-blue); letter-spacing: -1px;">100%</div>
                <div style="color: var(--text-secondary); font-size: 0.82rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; margin-top: 4px;">Direct Trade</div>
            </div>
        </div>

        <!-- CTA Banner -->
        <div style="margin-top: 60px; padding: 60px 40px; border-radius: 24px; background: linear-gradient(135deg, rgba(0,230,118,0.08) 0%, rgba(167,139,250,0.06) 100%); border: 1px solid rgba(0,230,118,0.15); text-align: center; position: relative; overflow: hidden;">
            <div style="position: absolute; inset: 0; background: radial-gradient(ellipse 60% 80% at 50% 50%, rgba(0,230,118,0.04) 0%, transparent 70%);"></div>
            <div style="position: relative; z-index: 1;">
                <h3 style="font-size: 2rem; font-weight: 800; letter-spacing: -0.5px; margin-bottom: 12px;">Ready to transform your trade?</h3>
                <p style="color: var(--text-secondary); margin-bottom: 28px;">Join hundreds of farmers and shopkeepers already using Farm 2 Shop.</p>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Create Free Account</a>
            </div>
        </div>
    </div>
</div>

<div class="container"><!-- Reopen container for footer.jsp to close cleanly -->
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
