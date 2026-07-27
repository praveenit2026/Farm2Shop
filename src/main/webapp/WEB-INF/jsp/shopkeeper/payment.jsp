<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="form-container" style="max-width: 600px;">
    <h2 class="form-title" data-i18n="pay.checkout">Order Checkout</h2>

    <!-- Booking Summary Card -->
    <div style="background-color: #f1f8e9; padding: 20px; border-radius: var(--border-radius); border-left: 5px solid var(--primary-color); margin-bottom: 25px;">
        <h4 style="color: var(--primary-dark); font-weight: 700; margin-bottom: 8px;" data-i18n="pay.summary">Purchase Summary</h4>
        <p style="margin: 0; color: var(--text-primary);"><span data-i18n="lbl.crop">Crop:</span> <strong>${booking.productName}</strong></p>
        <p style="margin: 5px 0 0 0; color: var(--text-primary); font-size: 1.25rem;"><span data-i18n="shop.modal.total">Total Outlay:</span> <strong style="color: var(--primary-color);">₹${booking.totalPrice}</strong></p>
    </div>

    <form action="${pageContext.request.contextPath}/shopkeeper/payment" method="post" id="paymentForm">
        <input type="hidden" name="bookingId" value="${booking.id}">
        <input type="hidden" name="amount" value="${booking.totalPrice}">

        <div class="form-group">
            <label class="form-label" data-i18n="th.paymethod">Payment Method</label>
            <div style="display: flex; gap: 15px; flex-wrap: wrap;">
                <label style="display: flex; align-items: center; gap: 8px; font-weight: 600; cursor: pointer; padding: 10px 14px; border: 1px solid var(--border); border-radius: var(--radius-sm); background: var(--bg-secondary);">
                    <input type="radio" name="paymentMethod" value="Card" checked onchange="togglePayFields('Card')"> 
                    <span>💳 <span data-i18n="pay.card.radio">Credit / Debit Card</span></span>
                </label>
                <label style="display: flex; align-items: center; gap: 8px; font-weight: 600; cursor: pointer; padding: 10px 14px; border: 1px solid var(--border); border-radius: var(--radius-sm); background: var(--bg-secondary);">
                    <input type="radio" name="paymentMethod" value="GPay" onchange="togglePayFields('GPay')"> 
                    <span style="display: flex; align-items: center; gap: 6px;">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/><path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/><path d="M5.84 14.1c-.22-.66-.35-1.36-.35-2.1s.13-1.44.35-2.1V7.06H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.94l2.85-2.22.81-.62z" fill="#FBBC05"/><path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.06l3.66 2.84c.87-2.6 3.3-4.52 6.16-4.52z" fill="#EA4335"/></svg>
                        <span data-i18n="pay.gpay.radio">Google Pay (UPI)</span>
                    </span>
                </label>
                <label style="display: flex; align-items: center; gap: 8px; font-weight: 600; cursor: pointer; padding: 10px 14px; border: 1px solid var(--border); border-radius: var(--radius-sm); background: var(--bg-secondary);">
                    <input type="radio" name="paymentMethod" value="COD" onchange="togglePayFields('COD')"> 
                    <span>💵 <span data-i18n="pay.cod.radio">Cash on Delivery (COD)</span></span>
                </label>
            </div>
        </div>

        <!-- Card fields container -->
        <div id="cardFields">
            <div class="form-group">
                <label class="form-label" for="cardHolder" data-i18n="pay.cardholder">Cardholder Name</label>
                <input type="text" name="cardHolder" id="cardHolder" class="form-input" placeholder="e.g. Jerry Smith" required data-i18n="pay.cardholder.ph" data-i18n-attr="placeholder">
            </div>

            <div class="form-group">
                <label class="form-label" for="cardNumber" data-i18n="pay.cardnumber">Card Number</label>
                <input type="text" name="cardNumber" id="cardNumber" class="form-input" placeholder="e.g. 1111222233334444" pattern="\d{16}" title="16-digit card number" required data-i18n="pay.cardnumber.ph" data-i18n-attr="placeholder">
            </div>

            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                <div class="form-group">
                    <label class="form-label" for="expiryDate" data-i18n="pay.expiry">Expiry Date</label>
                    <input type="text" name="expiryDate" id="expiryDate" class="form-input" placeholder="MM/YY" pattern="\d{2}/\d{2}" title="Format: MM/YY" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="cvv" data-i18n="pay.cvv">CVV</label>
                    <input type="password" name="cvv" id="cvv" class="form-input" placeholder="•••" pattern="\d{3}" title="3-digit security code" required>
                </div>
            </div>
        </div>

        <!-- GPay / UPI fields container -->
        <div id="gpayFields" style="display: none; background: #f0f9ff; padding: 20px; border-radius: var(--radius-sm); border: 1px solid #bae6fd; margin-bottom: 20px;">
            <div class="form-group" style="margin-bottom: 10px;">
                <label class="form-label" for="upiId" style="color: #0369a1;">Google Pay VPA / UPI ID / Phone Number</label>
                <input type="text" name="upiId" id="upiId" class="form-input" placeholder="e.g. username@okaxis or 9876543210" style="background:#ffffff;">
            </div>
            <p style="margin: 0; font-size: 0.85rem; color: #0284c7; font-weight: 600;">🔒 Instant payment push notification will be sent to your Google Pay app.</p>
        </div>

        <button type="submit" class="btn btn-primary btn-block" style="margin-top: 15px;" data-i18n="btn.processpay">Process Checkout</button>
    </form>
</div>

<script>
function togglePayFields(method) {
    var cardDiv = document.getElementById("cardFields");
    var gpayDiv = document.getElementById("gpayFields");
    var cardInputs = cardDiv.querySelectorAll("input");
    var upiInput = document.getElementById("upiId");
    
    if (method === 'Card') {
        cardDiv.style.display = "block";
        gpayDiv.style.display = "none";
        cardInputs.forEach(function(inp) { inp.setAttribute("required", "required"); });
        if (upiInput) upiInput.removeAttribute("required");
    } else if (method === 'GPay') {
        cardDiv.style.display = "none";
        gpayDiv.style.display = "block";
        cardInputs.forEach(function(inp) { inp.removeAttribute("required"); });
        if (upiInput) upiInput.setAttribute("required", "required");
    } else { // COD
        cardDiv.style.display = "none";
        gpayDiv.style.display = "none";
        cardInputs.forEach(function(inp) { inp.removeAttribute("required"); });
        if (upiInput) upiInput.removeAttribute("required");
    }
}
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
