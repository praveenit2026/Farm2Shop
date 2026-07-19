<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account — Farm 2 Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="display: flex; align-items: flex-start; justify-content: center; min-height: 100vh; padding: 40px 20px;">

<div style="width: 100%; max-width: 520px; animation: fade-in-up 0.5s ease both; position: relative;">

    <!-- Logo + Language Toggle -->
    <div style="text-align: center; margin-bottom: 32px; position: relative;">
        <!-- Language toggle top-right -->
        <div style="position: absolute; top: 0; right: 0;">
            <button id="langToggleBtn" onclick="toggleLanguage()" class="lang-btn">
                <span>🇮🇳</span> தமிழ்
            </button>
        </div>
        <a href="${pageContext.request.contextPath}/" class="logo" style="justify-content: center; display: inline-flex; margin-bottom: 8px;">
            <div class="logo-icon">🌾</div>
            Farm 2 <span class="accent">Shop</span>
        </a>
        <p style="color: var(--text-secondary); font-size: 0.9rem; margin-top: 8px;" data-i18n="reg.subtitle">Create your free partner account</p>
    </div>

    <div class="form-container" style="margin: 0; max-width: 100%;">

        <c:if test="${not empty error}">
            <div class="alert alert-error">⚠️ ${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="post">

            <!-- Role Toggle -->
            <div class="form-group">
                <label class="form-label" data-i18n="reg.iama">I am a</label>
                <select name="role" id="roleSelect" class="form-input" onchange="toggleFields()" required>
                    <option value="farmer" data-i18n="login.farmer">🚜 Farmer</option>
                    <option value="shopkeeper" data-i18n="login.shopkeeper">🏪 Shopkeeper</option>
                </select>
            </div>

            <!-- Farmer Fields -->
            <div id="farmerFields">
                <div class="form-group">
                    <label class="form-label" data-i18n="reg.fullname">Full Name</label>
                    <input type="text" name="name" id="name" class="form-input" placeholder="e.g. Ravi Kumar" data-i18n="reg.fullname.ph" data-i18n-attr="placeholder">
                </div>
                <div class="form-group">
                    <label class="form-label" data-i18n="reg.farmname">Farm / Organization Name</label>
                    <input type="text" name="farmName" id="farmName" class="form-input" placeholder="e.g. Green Fields Farm" data-i18n="reg.farmname.ph" data-i18n-attr="placeholder">
                </div>
            </div>

            <!-- Shopkeeper Fields -->
            <div id="shopkeeperFields" style="display: none;">
                <div class="form-group">
                    <label class="form-label" data-i18n="reg.ownername">Owner Name</label>
                    <input type="text" name="ownerName" id="ownerName" class="form-input" placeholder="e.g. Jerry Thomas" data-i18n="reg.ownername.ph" data-i18n-attr="placeholder">
                </div>
                <div class="form-group">
                    <label class="form-label" data-i18n="reg.shopname">Shop Name</label>
                    <input type="text" name="shopName" id="shopName" class="form-input" placeholder="e.g. Jerry Retail Store" data-i18n="reg.shopname.ph" data-i18n-attr="placeholder">
                </div>
            </div>

            <!-- Common Fields -->
            <div class="form-group">
                <label class="form-label" data-i18n="reg.email">Email Address</label>
                <input type="email" name="email" id="email" class="form-input" placeholder="name@domain.com" required autocomplete="email">
            </div>

            <div class="form-group">
                <label class="form-label" data-i18n="reg.phone">Phone Number</label>
                <input type="text" name="phone" id="phone" class="form-input" placeholder="e.g. 9886764849" required data-i18n="reg.phone.ph" data-i18n-attr="placeholder">
            </div>

            <div class="form-group">
                <label class="form-label" data-i18n="reg.location">Location / City</label>
                <input type="text" name="location" id="location" class="form-input" placeholder="e.g. Trichy, Chennai" required data-i18n="reg.location.ph" data-i18n-attr="placeholder">
            </div>

            <div class="form-group">
                <label class="form-label" data-i18n="reg.password">Password</label>
                <input type="password" name="password" id="password" class="form-input" placeholder="Create a strong password" required autocomplete="new-password" data-i18n="reg.password.ph" data-i18n-attr="placeholder">
            </div>

            <button type="submit" class="btn btn-primary btn-block" style="margin-top: 8px; font-size: 1rem; padding: 14px;" data-i18n="reg.btn">
                Create Account →
            </button>
        </form>

        <div class="divider" style="margin: 24px 0;">or</div>

        <p style="text-align: center; color: var(--text-secondary); font-size: 0.88rem;">
            <span data-i18n="reg.haveacc">Already have an account?</span>
            <a href="${pageContext.request.contextPath}/login" style="color: var(--accent-green); font-weight: 600; margin-left: 4px;" data-i18n="reg.signin">Sign In</a>
        </p>
    </div>

    <p style="text-align: center; color: var(--text-muted); font-size: 0.75rem; margin-top: 24px;">
        © 2025 Farm 2 Shop · All rights reserved
    </p>
</div>

<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script>
function toggleFields() {
    var role = document.getElementById("roleSelect").value;
    var farmerFields = document.getElementById("farmerFields");
    var shopkeeperFields = document.getElementById("shopkeeperFields");
    var nameInput = document.getElementById("name");
    var farmNameInput = document.getElementById("farmName");
    var ownerNameInput = document.getElementById("ownerName");
    var shopNameInput = document.getElementById("shopName");

    if (role === "farmer") {
        farmerFields.style.display = "block";
        shopkeeperFields.style.display = "none";
        nameInput.setAttribute("required", "required");
        farmNameInput.setAttribute("required", "required");
        ownerNameInput.removeAttribute("required");
        shopNameInput.removeAttribute("required");
    } else {
        farmerFields.style.display = "none";
        shopkeeperFields.style.display = "block";
        nameInput.removeAttribute("required");
        farmNameInput.removeAttribute("required");
        ownerNameInput.setAttribute("required", "required");
        shopNameInput.setAttribute("required", "required");
    }
}
window.onload = toggleFields;
</script>

</body>
</html>
