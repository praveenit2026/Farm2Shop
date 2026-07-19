<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="form-container" style="max-width: 600px;">
    <h2 class="form-title">Order Checkout</h2>

    <!-- Booking Summary Card -->
    <div style="background-color: #f1f8e9; padding: 20px; border-radius: var(--border-radius); border-left: 5px solid var(--primary-color); margin-bottom: 25px;">
        <h4 style="color: var(--primary-dark); font-weight: 700; margin-bottom: 8px;">Purchase Summary</h4>
        <p style="margin: 0; color: var(--text-primary);">Crop: <strong>${booking.productName}</strong></p>
        <p style="margin: 5px 0 0 0; color: var(--text-primary); font-size: 1.25rem;">Total Outlay: <strong style="color: var(--primary-color);">$${booking.totalPrice}</strong></p>
    </div>

    <form action="${pageContext.request.contextPath}/shopkeeper/payment" method="post" id="paymentForm">
        <input type="hidden" name="bookingId" value="${booking.id}">
        <input type="hidden" name="amount" value="${booking.totalPrice}">

        <div class="form-group">
            <label class="form-label">Payment Method</label>
            <div style="display: flex; gap: 20px;">
                <label style="display: flex; align-items: center; gap: 8px; font-weight: 600; cursor: pointer;">
                    <input type="radio" name="paymentMethod" value="Card" checked onchange="togglePayFields(true)"> Credit / Debit Card
                </label>
                <label style="display: flex; align-items: center; gap: 8px; font-weight: 600; cursor: pointer;">
                    <input type="radio" name="paymentMethod" value="COD" onchange="togglePayFields(false)"> Cash on Delivery (COD)
                </label>
            </div>
        </div>

        <!-- Card fields container -->
        <div id="cardFields">
            <div class="form-group">
                <label class="form-label" for="cardHolder">Cardholder Name</label>
                <input type="text" name="cardHolder" id="cardHolder" class="form-input" placeholder="e.g. Jerry Smith" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="cardNumber">Card Number</label>
                <input type="text" name="cardNumber" id="cardNumber" class="form-input" placeholder="e.g. 1111222233334444" pattern="\d{16}" title="16-digit card number" required>
            </div>

            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                <div class="form-group">
                    <label class="form-label" for="expiryDate">Expiry Date</label>
                    <input type="text" name="expiryDate" id="expiryDate" class="form-input" placeholder="MM/YY" pattern="\d{2}/\d{2}" title="Format: MM/YY" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="cvv">CVV</label>
                    <input type="password" name="cvv" id="cvv" class="form-input" placeholder="•••" pattern="\d{3}" title="3-digit security code" required>
                </div>
            </div>
        </div>

        <button type="submit" class="btn btn-primary btn-block" style="margin-top: 15px;">Process Checkout</button>
    </form>
</div>

<script>
function togglePayFields(isCard) {
    var cardDiv = document.getElementById("cardFields");
    var inputs = cardDiv.querySelectorAll("input");
    
    if (isCard) {
        cardDiv.style.display = "block";
        inputs.forEach(function(inp) {
            inp.setAttribute("required", "required");
        });
    } else {
        cardDiv.style.display = "none";
        inputs.forEach(function(inp) {
            inp.removeAttribute("required");
        });
    }
}
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
