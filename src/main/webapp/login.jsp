<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In — Farm 2 Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <style>
        /* Role selector buttons */
        .role-selector {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 8px;
            margin-bottom: 4px;
        }

        .role-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 4px;
            padding: 12px 8px;
            border: 1.5px solid var(--border);
            border-radius: var(--radius-sm);
            background: #ffffff;
            cursor: pointer;
            transition: var(--transition);
            font-size: 0.78rem;
            font-weight: 600;
            color: var(--text-secondary);
            font-family: 'Inter', sans-serif;
        }

        .role-btn .icon { font-size: 1.4rem; }

        .role-btn:hover {
            border-color: var(--accent-green);
            color: var(--accent-green);
            background: var(--accent-green-light);
        }

        .role-btn.active {
            border-color: var(--accent-green);
            background: var(--accent-green-light);
            color: var(--accent-green);
            box-shadow: 0 0 0 2px rgba(22, 163, 74, 0.15);
        }

        /* Override body for login page */
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 24px;
            background: var(--bg-primary);
        }

        .login-wrapper {
            width: 100%;
            max-width: 420px;
        }
    </style>
</head>
<body>

<div class="login-wrapper">

    <!-- Logo + Language Toggle -->
    <div style="text-align: center; margin-bottom: 28px; position: relative;">
        <!-- Language toggle top-right -->
        <div style="position: absolute; top: 0; right: 0;">
            <button id="langToggleBtn" onclick="toggleLanguage()" class="lang-btn">
                <span>🇮🇳</span> தமிழ்
            </button>
        </div>
        <a href="${pageContext.request.contextPath}/" class="logo" style="justify-content: center; display: inline-flex; gap: 10px; font-size: 1.4rem; font-weight: 800;">
            <div class="logo-icon">🌾</div>
            Farm 2 <span class="accent">Shop</span>
        </a>
        <p style="color: var(--text-secondary); font-size: 0.875rem; margin-top: 8px;" data-i18n="login.subtitle">Sign in to your account</p>
    </div>

    <div class="form-container" style="margin: 0; max-width: 100%;">

        <c:if test="${not empty error}">
            <div class="alert alert-error" style="margin-bottom: 20px;">⚠️ ${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">

            <!-- Role Selection -->
            <div class="form-group">
                <label class="form-label" data-i18n="login.signas">Sign in as</label>

                <!-- Hidden input that holds the actual role value -->
                <input type="hidden" name="role" id="roleInput" value="" required>

                <div class="role-selector">
                    <button type="button" class="role-btn" id="role-farmer" onclick="selectRole('farmer')">
                        <span class="icon">🚜</span>
                        <span data-i18n="login.farmer">Farmer</span>
                    </button>
                    <button type="button" class="role-btn" id="role-shopkeeper" onclick="selectRole('shopkeeper')">
                        <span class="icon">🏪</span>
                        <span data-i18n="login.shopkeeper">Shopkeeper</span>
                    </button>
                    <button type="button" class="role-btn" id="role-admin" onclick="selectRole('admin')">
                        <span class="icon">🛡️</span>
                        <span data-i18n="login.admin">Admin</span>
                    </button>
                </div>
                <p id="roleError" style="color:#ef4444; font-size:0.78rem; margin-top:6px; display:none;">Please select a role.</p>
            </div>

            <div class="form-group">
                <label class="form-label" data-i18n="login.email.label">Username / Email</label>
                <input type="text" name="emailOrUsername" class="form-input" placeholder="Enter username or email"
                       data-i18n="login.email.ph" data-i18n-attr="placeholder"
                       required autocomplete="username">
            </div>

            <div class="form-group">
                <label class="form-label" data-i18n="login.pass.label">Password</label>
                <input type="password" name="password" class="form-input" placeholder="Enter your password"
                       data-i18n="login.pass.ph" data-i18n-attr="placeholder"
                       required autocomplete="current-password">
            </div>

            <button type="submit" class="btn btn-primary btn-block" style="font-size: 1rem; padding: 14px; margin-top: 6px;" data-i18n="login.btn">
                Sign In →
            </button>
        </form>

        <div class="divider" style="margin: 24px 0;">or</div>

        <p style="text-align: center; color: var(--text-secondary); font-size: 0.875rem;">
            <span data-i18n="login.noacc">Don't have an account?</span>
            <a href="${pageContext.request.contextPath}/register" style="color: var(--accent-green); font-weight: 700; margin-left: 4px;" data-i18n="login.create">Create one free</a>
        </p>
    </div>

    <p style="text-align: center; color: var(--text-muted); font-size: 0.75rem; margin-top: 20px;">
        © 2025 Farm 2 Shop · All rights reserved
    </p>
</div>

<script>
function selectRole(role) {
    // Update hidden input
    document.getElementById('roleInput').value = role;

    // Reset all buttons
    document.querySelectorAll('.role-btn').forEach(function(btn) {
        btn.classList.remove('active');
    });

    // Activate selected
    document.getElementById('role-' + role).classList.add('active');

    // Hide error if shown
    document.getElementById('roleError').style.display = 'none';
}

// Validate role is selected before submit
document.getElementById('loginForm').addEventListener('submit', function(e) {
    var role = document.getElementById('roleInput').value;
    if (!role) {
        e.preventDefault();
        document.getElementById('roleError').style.display = 'block';
        document.getElementById('role-farmer').style.borderColor = '#ef4444';
        document.getElementById('role-shopkeeper').style.borderColor = '#ef4444';
        document.getElementById('role-admin').style.borderColor = '#ef4444';
    }
});
</script>

</body>
</html>
