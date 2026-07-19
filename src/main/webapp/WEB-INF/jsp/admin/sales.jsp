<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
    <div>
        <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color);">Sales Ledger & Tracking</h2>
        <p style="color: var(--text-secondary);">Audit global B2B transactions and delivery status.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary" style="color: var(--primary-color); border-color: var(--primary-color);">Back to Dashboard</a>
</div>

<div class="table-container">
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Shopkeeper Name</th>
                <th>Farmer Name</th>
                <th>Crop / Category</th>
                <th>Ordered Quantity</th>
                <th>Total Price</th>
                <th>Ordered Date</th>
                <th>Delivery Status</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty bookings}">
                    <c:forEach var="b" items="${bookings}">
                        <tr>
                            <td><strong>#${b.id}</strong></td>
                            <td>${b.shopkeeperName}</td>
                            <td>${b.farmerName}</td>
                            <td>
                                <strong>${b.productName}</strong> 
                                <span style="font-size: 0.8rem; color: var(--text-secondary);">(${b.productCategory})</span>
                            </td>
                            <td>${b.quantity} kg</td>
                            <td><strong>$${b.totalPrice}</strong></td>
                            <td>${b.createdAt}</td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${b.status == 'Success'}">badge-success</c:when>
                                        <c:when test="${b.status == 'Shipped'}">badge-info</c:when>
                                        <c:when test="${b.status == 'Delivered'}">badge-success</c:when>
                                        <c:when test="${b.status == 'Pending'}">badge-pending</c:when>
                                        <c:otherwise>badge-danger</c:otherwise>
                                    </c:choose>">
                                    ${b.status}
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8" style="text-align: center; color: var(--text-secondary); padding: 30px;">No transactions recorded.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
