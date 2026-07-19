<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="form-container">
    <h2 class="form-title">Login to Account</h2>
    
    <c:if test="${not empty error}">
        <div class="alert alert-error">
            ${error}
        </div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="alert alert-success">
            ${success}
        </div>
    </c:if>
    
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label class="form-label" for="role">User Role</label>
            <select name="role" id="role" class="form-input" required>
                <option value="farmer">Farmer</option>
                <option value="shopkeeper">Shopkeeper</option>
                <option value="admin">Administrator</option>
            </select>
        </div>
        
        <div class="form-group">
            <label class="form-label" for="emailOrUsername">Email or Username</label>
            <input type="text" name="emailOrUsername" id="emailOrUsername" class="form-input" placeholder="e.g. sam@gmail.com or admin" required>
        </div>
        
        <div class="form-group">
            <label class="form-label" for="password">Password</label>
            <input type="password" name="password" id="password" class="form-input" placeholder="••••••••" required>
        </div>
        
        <button type="submit" class="btn btn-primary btn-block">Log In</button>
    </form>
    
    <div style="margin-top: 20px; text-align: center; font-size: 0.9rem; color: var(--text-secondary);">
        Don't have an account? <a href="${pageContext.request.contextPath}/register" style="color: var(--primary-color); font-weight: 600;">Register Here</a>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
