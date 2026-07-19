<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In — Farm 2 Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="display: flex; align-items: center; justify-content: center; min-height: 100vh; padding: 20px;">

<div style="width: 100%; max-width: 440px; animation: fade-in-up 0.5s ease both;">

    <!-- Logo -->
    <div style="text-align: center; margin-bottom: 32px;">
        <a href="${pageContext.request.contextPath}/" class="logo" style="justify-content: center; margin-bottom: 8px; display: inline-flex;">
            <div class="logo-icon">🌾</div>
            Farm 2 <span class="accent">Shop</span>
        </a>
        <p style="color: var(--text-secondary); font-size: 0.9rem; margin-top: 8px;">Sign in to your account</p>
    </div>

    <div class="form-container" style="margin: 0; max-width: 100%;">

        <c:if test="${not empty error}">
            <div class="alert alert-error">⚠️ ${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label class="form-label">Role</label>
                <select name="role" class="form-input" required>
                    <option value="" disabled selected>Select your role</option>
                    <option value="admin">Admin</option>
                    <option value="farmer">Farmer</option>
                    <option value="shopkeeper">Shopkeeper</option>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label">Username / Email</label>
                <input type="text" name="username" class="form-input" placeholder="Enter username or email" required autocomplete="username">
            </div>

            <div class="form-group">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-input" placeholder="Enter your password" required autocomplete="current-password">
            </div>

            <button type="submit" class="btn btn-primary btn-block" style="margin-top: 8px; font-size: 1rem; padding: 14px;">
                Sign In →
            </button>
        </form>

        <div class="divider" style="margin: 24px 0;">or</div>

        <p style="text-align: center; color: var(--text-secondary); font-size: 0.88rem;">
            Don't have an account?
            <a href="${pageContext.request.contextPath}/register" style="color: var(--accent-green); font-weight: 600; margin-left: 4px;">Create one free</a>
        </p>
    </div>

    <p style="text-align: center; color: var(--text-muted); font-size: 0.75rem; margin-top: 24px;">
        © 2025 Farm 2 Shop · All rights reserved
    </p>
</div>

</body>
</html>
