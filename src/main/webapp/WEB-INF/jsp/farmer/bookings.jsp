<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="page-intro" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 16px;">
    <div>
        <h2 class="section-title" data-i18n="farmer.orders.title">Purchase Orders</h2>
        <p class="text-muted" data-i18n="farmer.orders.sub">Manage crop orders placed by retail shopkeepers.</p>
    </div>
    <a href="${pageContext.request.contextPath}/farmer/dashboard" class="btn btn-secondary" data-i18n="btn.back">Back</a>
</div>

<div class="table-container">
    <table>
        <thead>
            <tr>
                <th data-i18n="th.orderid">Order ID</th>
                <th data-i18n="th.shopkeeper">Shopkeeper Name</th>
                <th data-i18n="th.cropcat">Crop / Category</th>
                <th data-i18n="th.qty">Ordered Quantity</th>
                <th data-i18n="th.rev">Total Revenue</th>
                <th data-i18n="th.date">Ordered Date</th>
                <th data-i18n="th.status">Current Status</th>
                <th data-i18n="th.actions">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty bookings}">
                    <c:forEach var="b" items="${bookings}">
                        <tr>
                            <td><strong>#${b.id}</strong></td>
                            <td>${b.shopkeeperName}</td>
                            <td><strong>${b.productName}</strong> <span style="font-size: 0.8rem; color: var(--text-secondary);">(${b.productCategory})</span></td>
                            <td>${b.quantity} kg</td>
                            <td><strong>$${b.totalPrice}</strong></td>
                            <td>${b.createdAt}</td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${b.status == 'Success' || b.status == 'Approved'}">badge-success</c:when>
                                        <c:when test="${b.status == 'Shipped'}">badge-shipped</c:when>
                                        <c:when test="${b.status == 'Delivered'}">badge-success</c:when>
                                        <c:when test="${b.status == 'Pending'}">badge-pending</c:when>
                                        <c:otherwise>badge-danger</c:otherwise>
                                    </c:choose>">
                                    <span data-i18n="status.${b.status}">${b.status}</span>
                                </span>
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/farmer/bookings" method="post" style="display: flex; gap: 8px; flex-wrap: wrap;">
                                    <input type="hidden" name="bookingId" value="${b.id}">
                                    
                                    <c:choose>
                                        <c:when test="${b.status == 'Pending'}">
                                            <button type="submit" name="status" value="Approved" class="btn btn-primary btn-sm" data-i18n="btn.approve">Approve</button>
                                            <button type="submit" name="status" value="Rejected" class="btn btn-danger btn-sm" data-i18n="btn.reject">Reject</button>
                                        </c:when>
                                        <c:when test="${b.status == 'Success' || b.status == 'Approved'}">
                                            <button type="submit" name="status" value="Shipped" class="btn btn-primary btn-sm" style="background: linear-gradient(135deg, var(--accent-purple), #8b5cf6); box-shadow: 0 0 20px rgba(167, 139, 250, 0.3);" data-i18n="btn.ship">Ship Order</button>
                                        </c:when>
                                        <c:when test="${b.status == 'Shipped'}">
                                            <button type="submit" name="status" value="Delivered" class="btn btn-primary btn-sm" data-i18n="btn.deliver">Deliver Order</button>
                                        </c:when>
                                        <c:otherwise>
                                            <span style="font-size: 0.85rem; color: var(--text-secondary); font-style: italic;" data-i18n="order.noactions">No actions available</span>
                                        </c:otherwise>
                                    </c:choose>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8" style="text-align: center; color: var(--text-secondary); padding: 30px;" data-i18n="farmer.noorders">No purchase orders received yet.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
