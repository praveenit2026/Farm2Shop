<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="page-intro" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 16px;">
    <div>
        <h2 class="section-title" data-i18n="farmer.pay.title">My Payments Received</h2>
        <p class="text-muted" data-i18n="farmer.pay.sub">Track payments for fulfilled orders.</p>
    </div>
    <a href="${pageContext.request.contextPath}/farmer/dashboard" class="btn btn-secondary" data-i18n="btn.back">Back</a>
</div>

<div class="table-container">
    <table>
        <thead>
            <tr>
                <th data-i18n="th.payid">Payment ID</th>
                <th data-i18n="th.orderid">Order ID</th>
                <th data-i18n="th.shopkeeper">Shopkeeper Name</th>
                <th data-i18n="th.cropitem">Crop Item</th>
                <th data-i18n="th.paymethod">Payment Method</th>
                <th data-i18n="th.amountrec">Amount Received</th>
                <th data-i18n="th.paydate">Payment Date</th>
                <th data-i18n="th.txstatus">Transaction Status</th>
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
                            <td><span class="badge badge-info" data-i18n="pay.${p.paymentMethod}">${p.paymentMethod}</span></td>
                            <td><strong>$${p.amount}</strong></td>
                            <td>${p.createdAt}</td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${p.status == 'Success' || p.status == 'Delivered' || p.status == 'Shipped'}">badge-success</c:when>
                                        <c:otherwise>badge-danger</c:otherwise>
                                    </c:choose>">
                                    <span data-i18n="status.${p.status}">${p.status}</span>
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8" style="text-align: center; color: var(--text-secondary); padding: 30px;" data-i18n="farmer.nopayments">No payments recorded yet. Fulfill orders to receive payments.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
