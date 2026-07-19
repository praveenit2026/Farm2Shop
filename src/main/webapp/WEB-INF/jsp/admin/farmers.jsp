<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
    <div>
        <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color);">Farmers Management</h2>
        <p style="color: var(--text-secondary);">Browse active farm partners on the direct-trading network.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary" style="color: var(--primary-color); border-color: var(--primary-color);">Back to Dashboard</a>
</div>

<div class="table-container">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Farmer Name</th>
                <th>Email Address</th>
                <th>Phone</th>
                <th>Farm Name</th>
                <th>Location</th>
                <th>Registered On</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty farmers}">
                    <c:forEach var="farmer" items="${farmers}">
                        <tr>
                            <td><strong>#${farmer.id}</strong></td>
                            <td>${farmer.name}</td>
                            <td>${farmer.email}</td>
                            <td>${farmer.phone}</td>
                            <td>${farmer.farmName}</td>
                            <td><span class="badge badge-info">${farmer.location}</span></td>
                            <td>${farmer.createdAt}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/farmers" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="${farmer.id}">
                                    <button type="submit" class="btn btn-logout btn-delete-confirm" style="padding: 6px 12px; font-size: 0.85rem;">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8" style="text-align: center; color: var(--text-secondary); padding: 30px;">No registered farmers found.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
