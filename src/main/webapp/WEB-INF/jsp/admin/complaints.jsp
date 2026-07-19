<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
    <div>
        <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color);">Partner Complaints & Disputes</h2>
        <p style="color: var(--text-secondary);">Respond to complaints submitted by farmers or shopkeepers.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary" style="color: var(--primary-color); border-color: var(--primary-color);">Back to Dashboard</a>
</div>

<div class="table-container">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Author Type</th>
                <th>User Name</th>
                <th>Subject</th>
                <th>Message</th>
                <th>Submitted Date</th>
                <th>Status</th>
                <th>Solution / Action</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty complaints}">
                    <c:forEach var="c" items="${complaints}">
                        <tr>
                            <td><strong>#${c.id}</strong></td>
                            <td>
                                <span class="badge ${c.userType == 'farmer' ? 'badge-info' : 'badge-warning'}">
                                    ${c.userType}
                                </span>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${c.userType == 'farmer'}">
                                        ${c.farmerName}
                                    </c:when>
                                    <c:otherwise>
                                        ${c.shopkeeperName}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><strong>${c.subject}</strong></td>
                            <td>${c.message}</td>
                            <td>${c.createdAt}</td>
                            <td>
                                <span class="badge ${c.status == 'Solved' ? 'badge-success' : 'badge-pending'}">
                                    ${c.status}
                                </span>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${c.status == 'Solved'}">
                                        <p style="font-size: 0.85rem; color: var(--success-color);">
                                            <strong>Solution:</strong> ${c.solution}
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Post Solution Form -->
                                        <form action="${pageContext.request.contextPath}/admin/complaints" method="post" style="display: flex; gap: 8px;">
                                            <input type="hidden" name="id" value="${c.id}">
                                            <input type="text" name="solution" placeholder="Enter solution..." class="form-input" style="padding: 6px 12px; font-size: 0.85rem; min-width: 150px;" required>
                                            <button type="submit" class="btn btn-primary" style="padding: 6px 12px; font-size: 0.85rem;">Resolve</button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8" style="text-align: center; color: var(--text-secondary); padding: 30px;">No complaints found. System running smoothly!</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
