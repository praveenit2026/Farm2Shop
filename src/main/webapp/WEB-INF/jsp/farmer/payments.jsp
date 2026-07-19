<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="page-intro" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 16px;">
    <div>
        <h2 class="section-title">My Payments Received</h2>
        <p class="text-muted">Track payments for fulfilled orders.</p>
    </div>
    <a href="${pageContext.request.contextPath}/farmer/dashboard" class="btn btn-secondary">Back</a>
</div>

<div class="table-container">
    <table>
        <thead>
            <tr>
                <th>Payment ID</th>
                <th>Order ID</th>
                <th>Shopkeeper Name</th>
                <th>Crop Item</th>
                <th>Payment Method</th>
                <th>Amount Received</th>
                <th>Payment Date</th>
                <th>Transaction Status</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty payments}">
                    <c:forEach var="p" items="${payments}">
                        <tr>
                            <td><strong>#${p.id}</strong></td>
                            <td>#${p.bookingId}</td>
                            <td>${p.shopkeeperName}</td>
                            <td><strong>${p.productName}</strong></td>
                            <td><span class="badge badge-info">${p.paymentMethod}</span></td>
                            <td><strong>$${p.amount}</strong></td>
                            <td>${p.createdAt}</td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${p.status == 'Success' || p.status == 'Delivered' || p.status == 'Shipped'}">badge-success</c:when>
                                        <c:otherwise>badge-danger</c:otherwise>
                                    </c:choose>">
                                    ${p.status}
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8" style="text-align: center; color: var(--text-secondary); padding: 30px;">No payments recorded yet. Fulfill orders to receive payments.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
