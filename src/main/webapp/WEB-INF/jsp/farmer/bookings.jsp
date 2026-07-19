<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
    <div>
        <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color);">Purchase Orders</h2>
        <p style="color: var(--text-secondary);">Manage crop orders placed by retail shopkeepers.</p>
    </div>
    <a href="${pageContext.request.contextPath}/farmer/dashboard" class="btn btn-secondary" style="color: var(--primary-color); border-color: var(--primary-color);">Back</a>
</div>

<div class="table-container">
    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Shopkeeper Name</th>
                <th>Crop / Category</th>
                <th>Ordered Quantity</th>
                <th>Total Revenue</th>
                <th>Ordered Date</th>
                <th>Current Status</th>
                <th>Actions</th>
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
                                        <c:when test="${b.status == 'Shipped'}">badge-info</c:when>
                                        <c:when test="${b.status == 'Delivered'}">badge-success</c:when>
                                        <c:when test="${b.status == 'Pending'}">badge-pending</c:when>
                                        <c:otherwise>badge-danger</c:otherwise>
                                    </c:choose>">
                                    ${b.status}
                                </span>
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/farmer/bookings" method="post" style="display: flex; gap: 8px; flex-wrap: wrap;">
                                    <input type="hidden" name="bookingId" value="${b.id}">
                                    
                                    <c:choose>
                                        <c:when test="${b.status == 'Pending'}">
                                            <button type="submit" name="status" value="Approved" class="btn btn-primary" style="padding: 6px 12px; font-size: 0.85rem; background-color: var(--primary-color);">Approve</button>
                                            <button type="submit" name="status" value="Rejected" class="btn btn-logout" style="padding: 6px 12px; font-size: 0.85rem;">Reject</button>
                                        </c:when>
                                        <c:when test="${b.status == 'Success' || b.status == 'Approved'}">
                                            <button type="submit" name="status" value="Shipped" class="btn btn-primary" style="padding: 6px 12px; font-size: 0.85rem; background-color: var(--secondary-color);">Ship Order</button>
                                        </c:when>
                                        <c:when test="${b.status == 'Shipped'}">
                                            <button type="submit" name="status" value="Delivered" class="btn btn-primary" style="padding: 6px 12px; font-size: 0.85rem; background-color: #2e7d32;">Deliver Order</button>
                                        </c:when>
                                        <c:otherwise>
                                            <span style="font-size: 0.85rem; color: var(--text-secondary); font-style: italic;">No actions available</span>
                                        </c:otherwise>
                                    </c:choose>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8" style="text-align: center; color: var(--text-secondary); padding: 30px;">No purchase orders received yet.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
