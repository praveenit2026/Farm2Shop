<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="page-intro" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 16px;">
    <div>
        <h2 class="section-title">Purchase Orders</h2>
        <p class="text-muted">Manage crop orders placed by retail shopkeepers.</p>
    </div>
    <a href="${pageContext.request.contextPath}/farmer/dashboard" class="btn btn-secondary">Back</a>
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
                                        <c:when test="${b.status == 'Shipped'}">badge-shipped</c:when>
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
                                            <button type="submit" name="status" value="Approved" class="btn btn-primary btn-sm">Approve</button>
                                            <button type="submit" name="status" value="Rejected" class="btn btn-danger btn-sm">Reject</button>
                                        </c:when>
                                        <c:when test="${b.status == 'Success' || b.status == 'Approved'}">
                                            <button type="submit" name="status" value="Shipped" class="btn btn-primary btn-sm" style="background: linear-gradient(135deg, var(--accent-purple), #8b5cf6); box-shadow: 0 0 20px rgba(167, 139, 250, 0.3);">Ship Order</button>
                                        </c:when>
                                        <c:when test="${b.status == 'Shipped'}">
                                            <button type="submit" name="status" value="Delivered" class="btn btn-primary btn-sm">Deliver Order</button>
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
