<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
    <div>
        <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color);">My Crop Listings</h2>
        <p style="color: var(--text-secondary);">Manage and list fresh farm produce for shopkeepers to buy.</p>
    </div>
    <div style="display: flex; gap: 10px;">
        <button onclick="openModal('addProductModal')" class="btn btn-primary">+ Add New Crop</button>
        <a href="${pageContext.request.contextPath}/farmer/dashboard" class="btn btn-secondary" style="color: var(--primary-color); border-color: var(--primary-color);">Back</a>
    </div>
</div>

<!-- Crop Listings Cards -->
<div class="grid">
    <c:choose>
        <c:when test="${not empty products}">
            <c:forEach var="p" items="${products}">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/${p.image}" alt="${p.productName}" class="product-image">
                    <div class="product-details">
                        <div class="product-title">${p.productName}</div>
                        <div class="product-price">$${p.price} <span style="font-size: 0.9rem; font-weight: normal; color: var(--text-secondary);">/ kg</span></div>
                        
                        <div class="product-meta">
                            <span>Category: <strong>${p.category}</strong></span>
                            <span>Stock: <strong>${p.quantity} kg</strong></span>
                        </div>
                        
                        <div style="margin-top: auto; display: flex; gap: 10px;">
                            <form action="${pageContext.request.contextPath}/farmer/products" method="post" style="width: 100%;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${p.id}">
                                <button type="submit" class="btn btn-logout btn-delete-confirm btn-block" style="padding: 10px;">Remove Listing</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div style="grid-column: 1 / -1; text-align: center; color: var(--text-secondary); padding: 50px 0;">
                <div style="font-size: 3.5rem; margin-bottom: 15px;">🌾</div>
                <h3>No crops listed yet</h3>
                <p>Click "+ Add New Crop" to publish your first produce listing.</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Add Crop Modal -->
<div id="addProductModal" class="modal">
    <div class="modal-content">
        <button onclick="closeModal('addProductModal')" class="modal-close">&times;</button>
        <h3 class="form-title" style="margin-bottom: 20px;">List New Produce</h3>
        
        <form action="${pageContext.request.contextPath}/farmer/products" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label class="form-label" for="productName">Crop / Product Name</label>
                <input type="text" name="productName" id="productName" class="form-input" placeholder="e.g. Red Apples, Organic Tomatoes" required>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="category">Category</label>
                <select name="category" id="category" class="form-input" required>
                    <option value="Fruits">Fruits</option>
                    <option value="Vegetables">Vegetables</option>
                    <option value="Grains">Grains & Cereals</option>
                    <option value="Pulses">Pulses & Beans</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="location">Farming Location</label>
                <input type="text" name="location" id="location" class="form-input" value="${sessionScope.user.location}" required>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="quantity">Quantity (in kg)</label>
                <input type="number" name="quantity" id="quantity" class="form-input" min="1" placeholder="e.g. 100" required>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="price">Price (per kg)</label>
                <input type="number" step="0.01" name="price" id="price" class="form-input" min="0.01" placeholder="e.g. 2.50" required>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="image">Crop Image</label>
                <input type="file" name="image" id="image" class="form-input" accept="image/*" required>
            </div>
            
            <button type="submit" class="btn btn-primary btn-block">Publish Listing</button>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
