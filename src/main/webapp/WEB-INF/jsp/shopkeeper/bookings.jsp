<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
    <div>
        <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color);" data-i18n="shop.bookings.title">My Purchase Bookings</h2>
        <p style="color: var(--text-secondary);" data-i18n="shop.bookings.sub">Manage payments and track delivery progress of your crops.</p>
    </div>
    <a href="${pageContext.request.contextPath}/shopkeeper/dashboard" class="btn btn-secondary" style="color: var(--primary-color); border-color: var(--primary-color);" data-i18n="btn.dashboard">Dashboard</a>
</div>

<c:if test="${param.success == 'Paid'}">
    <div class="alert alert-success" data-i18n="alert.payment.success">Payment received! Your order is being processed by the farmer.</div>
</c:if>
<c:if test="${param.error == 'PaymentFailed'}">
    <div class="alert alert-error" data-i18n="alert.payment.fail">Transaction declined. Please check details and try again.</div>
</c:if>

<div class="table-container">
    <table>
        <thead>
            <tr>
                <th data-i18n="th.bookingid">Booking ID</th>
                <th data-i18n="th.farmername">Farmer Name</th>
                <th data-i18n="th.cropordered">Crop ordered</th>
                <th data-i18n="th.qty">Quantity</th>
                <th data-i18n="shop.modal.total">Total Outlay</th>
                <th data-i18n="th.bookingdate">Booking Date</th>
                <th data-i18n="th.progress">Order Progress</th>
                <th data-i18n="th.payaction">Payment Action</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty bookings}">
                    <c:forEach var="b" items="${bookings}">
                        <tr>
                            <td><strong>#${b.id}</strong></td>
                            <td>${b.farmerName}</td>
                            <td><strong>${b.productName}</strong> <span style="font-size: 0.85rem; color: var(--text-secondary);">(${b.productCategory})</span></td>
                            <td>${b.quantity} kg</td>
                            <td><strong>$${b.totalPrice}</strong></td>
                            <td>${b.createdAt}</td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${b.status == 'Success' || b.status == 'Approved'}">badge-success</c:when>
                                        <c:when test="${b.status == 'Shipped'}">badge-info</c:when>
                                        <c:when test="${b.status == 'Delivered'}">badge-success</c:when>
                                        <c:when test="${b.status == 'Pending'}">badge-pending</c:when>
                                        <c:otherwise>badge-danger</c:otherwise>
                                    </c:choose>">
                                    <span data-i18n="status.${b.status}">${b.status}</span>
                                </span>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${b.status == 'Pending'}">
                                        <a href="${pageContext.request.contextPath}/shopkeeper/payment?bookingId=${b.id}" class="btn btn-primary" style="padding: 6px 14px; font-size: 0.85rem; background-color: var(--secondary-color);" data-i18n="btn.paynow">Pay Now</a>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="color: var(--success-color); font-weight: 600; font-size: 0.9rem;" data-i18n="lbl.fullypaid">✓ Fully Paid</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8" style="text-align: center; color: var(--text-secondary); padding: 30px;" data-i18n="shop.nobookings">No bookings found. Visit the marketplace to order crops.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
