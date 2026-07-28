<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<!-- Full-Screen Edge-to-Edge Hero Banner -->
<section class="hero-fullscreen">
    <div class="hero-overlay"></div>
    <div class="hero-fullscreen-container">
        <div class="hero-fullscreen-content">
            <div class="hero-badge hero-badge-dark" data-i18n="hero.badge">🌱 Farm-to-Shop B2B Platform</div>

            <h1 data-i18n="hero.title">Direct Crops, No Middlemen.</h1>
            <p data-i18n="hero.subtitle">Connecting local farmers directly with shopkeepers for transparent, commission-free agricultural trade. Fresh produce, fair prices.</p>
            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary btn-lg" data-i18n="hero.btn1">Start Trading →</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-glass btn-lg" data-i18n="hero.btn2">Join as Partner</a>
            </div>
        </div>
    </div>
</section>


<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
