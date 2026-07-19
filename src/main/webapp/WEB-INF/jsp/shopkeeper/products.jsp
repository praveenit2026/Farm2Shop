<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
    <div>
        <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color);" data-i18n="shop.market.title">Farm Marketplace</h2>
        <p style="color: var(--text-secondary);" data-i18n="shop.market.sub">Procure fresh crops directly from local farmers.</p>
    </div>
    <a href="${pageContext.request.contextPath}/shopkeeper/dashboard" class="btn btn-secondary" style="color: var(--primary-color); border-color: var(--primary-color);" data-i18n="btn.dashboard">Dashboard</a>
</div>

<!-- Search and Filter Bar -->
<div class="card" style="padding: 20px; margin-bottom: 30px;">
    <form action="${pageContext.request.contextPath}/shopkeeper/products" method="get" style="display: flex; gap: 15px; flex-wrap: wrap; align-items: center;">
        <div style="flex-grow: 1; min-width: 250px;">
            <input type="text" name="search" value="${param.search}" placeholder="Search crop names or categories..." class="form-input" style="padding: 10px 15px;" data-i18n="shop.search.ph" data-i18n-attr="placeholder">
        </div>
        
        <div style="min-width: 150px;">
            <select name="category" class="form-input" style="padding: 10px 15px;">
                <option value="" data-i18n="cat.all">All Categories</option>
                <option value="Fruits" ${param.category == 'Fruits' ? 'selected' : ''} data-i18n="cat.fruits">Fruits</option>
                <option value="Vegetables" ${param.category == 'Vegetables' ? 'selected' : ''} data-i18n="cat.vegetables">Vegetables</option>
                <option value="Grains" ${param.category == 'Grains' ? 'selected' : ''} data-i18n="cat.grains">Grains & Cereals</option>
                <option value="Pulses" ${param.category == 'Pulses' ? 'selected' : ''} data-i18n="cat.pulses">Pulses</option>
            </select>
        </div>
        
        <button type="submit" class="btn btn-primary" style="padding: 10px 20px;" data-i18n="btn.search">Search Marketplace</button>
    </form>
</div>

<c:if test="${not empty error}">
    <div class="alert alert-error">${error}</div>
</c:if>

<!-- Products Cards Grid -->
<div class="grid">
    <c:choose>
        <c:when test="${not empty products}">
            <c:forEach var="p" items="${products}">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/${p.image}" alt="${p.productName}" class="product-image">
                    <div class="product-details">
                        <span class="badge badge-info" style="align-self: flex-start; margin-bottom: 10px;">${p.category}</span>
                        <div class="product-title">${p.productName}</div>
                        <div class="product-price">$${p.price} <span style="font-size: 0.9rem; font-weight: normal; color: var(--text-secondary);">/ kg</span></div>
                        
                        <div class="product-meta">
                            <span><span data-i18n="lbl.farmer">Farmer:</span> <strong>${p.farmerName}</strong></span>
                            <span><span data-i18n="lbl.stock">Stock:</span> <strong>${p.quantity} kg</strong></span>
                        </div>
                        <div class="product-meta" style="margin-top: -10px; margin-bottom: 20px;">
                            <span><span data-i18n="lbl.location">Location:</span> <strong>${p.location}</strong></span>
                        </div>

                        <c:choose>
                            <c:when test="${p.quantity > 0}">
                                <button onclick="openBookingModal('${p.id}', '${p.productName}', '${p.price}', '${p.quantity}')" class="btn btn-primary btn-block" data-i18n="btn.ordercrop">Order Crop</button>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-logout btn-block" style="background-color: var(--text-secondary); cursor: not-allowed;" disabled data-i18n="btn.outofstock">Out of Stock</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div style="grid-column: 1 / -1; text-align: center; color: var(--text-secondary); padding: 50px 0;">
                <div style="font-size: 3.5rem; margin-bottom: 15px;">🔍</div>
                <h3 data-i18n="shop.nocrops">No crops found</h3>
                <p data-i18n="shop.nocrops.sub">Try searching for a different keyword or category.</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Booking Quantity Modal -->
<div id="bookingModal" class="modal">
    <div class="modal-content">
        <button onclick="closeModal('bookingModal')" class="modal-close">&times;</button>
        <h3 class="form-title" style="margin-bottom: 20px;" data-i18n="shop.modal.title">Configure Crop Order</h3>
        
        <form action="${pageContext.request.contextPath}/shopkeeper/products" method="post">
            <input type="hidden" name="productId" id="modalProductId">
            
            <div style="margin-bottom: 20px; background-color: #f1f8e9; padding: 15px; border-radius: var(--border-radius); border-left: 5px solid var(--primary-color);">
                <p style="margin: 0; color: var(--primary-dark);"><span data-i18n="lbl.crop">Crop:</span> <strong id="modalCropName">Tomato</strong></p>
                <p style="margin: 5px 0 0 0; color: var(--primary-dark);"><span data-i18n="lbl.price">Price:</span> <strong id="modalCropPrice">$1.00</strong> / kg</p>
            </div>

            <div class="form-group">
                <label class="form-label" for="orderQuantity" data-i18n="shop.modal.qty">Required Quantity (in kg)</label>
                <input type="number" name="quantity" id="orderQuantity" class="form-input" min="1" oninput="calculateTotal()" required>
                <span id="stockWarn" style="font-size: 0.85rem; color: var(--danger-color); display: none;" data-i18n="shop.modal.warn">Quantity exceeds available stock!</span>
            </div>
            
            <div style="margin-bottom: 25px; display: flex; justify-content: space-between; align-items: center;">
                <span style="font-weight: 700; color: var(--text-secondary);" data-i18n="shop.modal.total">Total Outlay:</span>
                <span style="font-size: 1.5rem; font-weight: 800; color: var(--primary-color);" id="modalTotalCost">$0.00</span>
            </div>

            <button type="submit" id="bookBtn" class="btn btn-primary btn-block" data-i18n="btn.confirm">Confirm Order</button>
        </form>
    </div>
</div>

<script>
var currentPrice = 0;
var maxStock = 0;

function openBookingModal(id, name, price, stock) {
    document.getElementById("modalProductId").value = id;
    document.getElementById("modalCropName").innerText = name;
    document.getElementById("modalCropPrice").innerText = price;
    currentPrice = parseFloat(price);
    maxStock = parseInt(stock);
    document.getElementById("orderQuantity").value = "";
    document.getElementById("orderQuantity").setAttribute("max", stock);
    document.getElementById("modalTotalCost").innerText = "$0.00";
    document.getElementById("stockWarn").style.display = "none";
    document.getElementById("bookBtn").disabled = false;
    openModal("bookingModal");
}

function calculateTotal() {
    var qty = parseInt(document.getElementById("orderQuantity").value);
    var warn = document.getElementById("stockWarn");
    var btn = document.getElementById("bookBtn");
    
    if (isNaN(qty) || qty <= 0) {
        document.getElementById("modalTotalCost").innerText = "$0.00";
        warn.style.display = "none";
        btn.disabled = false;
        return;
    }
    
    if (qty > maxStock) {
        warn.style.display = "block";
        btn.disabled = true;
    } else {
        warn.style.display = "none";
        btn.disabled = false;
    }
    
    var total = qty * currentPrice;
    document.getElementById("modalTotalCost").innerText = "$" + total.toFixed(2);
}
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
