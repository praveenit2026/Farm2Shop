<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="form-container" style="max-width: 600px;">
    <h2 class="form-title">Create Partner Account</h2>
    
    <c:if test="${not empty error}">
        <div class="alert alert-error">
            ${error}
        </div>
    </c:if>
    
    <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="form-group">
            <label class="form-label" for="roleSelect">Register As</label>
            <select name="role" id="roleSelect" class="form-input" onchange="toggleFields()" required>
                <option value="farmer">Farmer</option>
                <option value="shopkeeper">Shopkeeper</option>
            </select>
        </div>

        <!-- Common fields -->
        <div class="form-group">
            <label class="form-label" for="email">Email Address</label>
            <input type="email" name="email" id="email" class="form-input" placeholder="name@domain.com" required>
        </div>

        <div class="form-group">
            <label class="form-label" for="phone">Phone Number</label>
            <input type="text" name="phone" id="phone" class="form-input" placeholder="e.g. 9886764849" required>
        </div>

        <div class="form-group">
            <label class="form-label" for="location">Location / City</label>
            <input type="text" name="location" id="location" class="form-input" placeholder="e.g. Trichy, Chennai" required>
        </div>

        <!-- Farmer specific fields -->
        <div id="farmerFields">
            <div class="form-group">
                <label class="form-label" for="name">Farmer Name</label>
                <input type="text" name="name" id="name" class="form-input" placeholder="Full Name">
            </div>
            <div class="form-group">
                <label class="form-label" for="farmName">Farm / Organization Name</label>
                <input type="text" name="farmName" id="farmName" class="form-input" placeholder="e.g. Green Fields Farm">
            </div>
        </div>

        <!-- Shopkeeper specific fields -->
        <div id="shopkeeperFields" style="display: none;">
            <div class="form-group">
                <label class="form-label" for="ownerName">Owner Name</label>
                <input type="text" name="ownerName" id="ownerName" class="form-input" placeholder="Owner Full Name">
            </div>
            <div class="form-group">
                <label class="form-label" for="shopName">Shop Name</label>
                <input type="text" name="shopName" id="shopName" class="form-input" placeholder="e.g. Jerry Retail Store">
            </div>
        </div>

        <div class="form-group">
            <label class="form-label" for="password">Password</label>
            <input type="password" name="password" id="password" class="form-input" placeholder="••••••••" required>
        </div>
        
        <button type="submit" class="btn btn-primary btn-block" style="margin-top: 15px;">Register Now</button>
    </form>
    
    <div style="margin-top: 20px; text-align: center; font-size: 0.9rem; color: var(--text-secondary);">
        Already have an account? <a href="${pageContext.request.contextPath}/login" style="color: var(--primary-color); font-weight: 600;">Login Here</a>
    </div>
</div>

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
// Run once on load
window.onload = toggleFields;
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
