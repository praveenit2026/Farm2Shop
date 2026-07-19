<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
    <div>
        <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color);">My Support Complaints</h2>
        <p style="color: var(--text-secondary);">Submit concerns directly to the System Administrator.</p>
    </div>
    <a href="${pageContext.request.contextPath}/shopkeeper/dashboard" class="btn btn-secondary" style="color: var(--primary-color); border-color: var(--primary-color);">Dashboard</a>
</div>

<div class="grid">
    <!-- Complaint Log -->
    <div style="grid-column: span 2;">
        <h3 style="margin-bottom: 15px; font-weight: 700;">Complaint History</h3>
        
        <div class="table-container" style="margin-top: 0;">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Subject</th>
                        <th>Message Details</th>
                        <th>Date Filed</th>
                        <th>Status</th>
                        <th>Admin Response</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty complaints}">
                            <c:forEach var="c" items="${complaints}">
                                <tr>
                                    <td><strong>#${c.id}</strong></td>
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
                                            <c:when test="${not empty c.solution}">
                                                <p style="color: var(--success-color); font-weight: 600;">${c.solution}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <span style="font-style: italic; color: var(--text-secondary);">Awaiting admin response...</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="6" style="text-align: center; color: var(--text-secondary); padding: 30px;">No complaints filed. Thank you for your cooperation!</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Submit Complaint Form -->
    <div>
        <div class="card" style="padding: 24px;">
            <h3 style="margin-bottom: 15px; font-weight: 700; color: var(--primary-color);">File New Complaint</h3>
            
            <form action="${pageContext.request.contextPath}/shopkeeper/complaints" method="post">
                <div class="form-group">
                    <label class="form-label" for="subject">Subject</label>
                    <input type="text" name="subject" id="subject" class="form-input" placeholder="e.g. Payment Issue, App Bug" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="message">Detailed Message</label>
                    <textarea name="message" id="message" rows="5" class="form-input" placeholder="Describe your concern..." required></textarea>
                </div>
                
                <button type="submit" class="btn btn-primary btn-block">Submit Dispute</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
