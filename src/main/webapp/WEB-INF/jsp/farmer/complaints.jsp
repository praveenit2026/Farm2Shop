<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
    <div>
        <h2 style="font-weight: 800; font-size: 2rem; color: var(--primary-color);" data-i18n="farmer.complaint.title">My Support Complaints</h2>
        <p style="color: var(--text-secondary);" data-i18n="farmer.complaint.sub">Submit concerns directly to the System Administrator.</p>
    </div>
    <a href="${pageContext.request.contextPath}/farmer/dashboard" class="btn btn-secondary" style="color: var(--primary-color); border-color: var(--primary-color);" data-i18n="btn.back">Back</a>
</div>

<div class="grid">
    <!-- Complaint Log -->
    <div style="grid-column: span 2;">
        <h3 style="margin-bottom: 15px; font-weight: 700;" data-i18n="comp.history">Complaint History</h3>
        
        <div class="table-container" style="margin-top: 0;">
            <table>
                <thead>
                    <tr>
                        <th data-i18n="th.id">ID</th>
                        <th data-i18n="th.subject">Subject</th>
                        <th data-i18n="th.message">Message Details</th>
                        <th data-i18n="th.datefiled">Date Filed</th>
                        <th data-i18n="th.status">Status</th>
                        <th data-i18n="th.adminresp">Admin Response</th>
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
                                            <span data-i18n="status.${c.status}">${c.status}</span>
                                        </span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty c.solution}">
                                                <p style="color: var(--success-color); font-weight: 600;">${c.solution}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <span style="font-style: italic; color: var(--text-secondary);" data-i18n="comp.awaiting">Awaiting admin response...</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="6" style="text-align: center; color: var(--text-secondary); padding: 30px;" data-i18n="comp.nocomplaints">No complaints filed. Thank you for your cooperation!</td>
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
            <h3 style="margin-bottom: 15px; font-weight: 700; color: var(--primary-color);" data-i18n="comp.new">File New Complaint</h3>
            
            <form action="${pageContext.request.contextPath}/farmer/complaints" method="post">
                <div class="form-group">
                    <label class="form-label" for="subject" data-i18n="comp.subject.label">Subject</label>
                    <input type="text" name="subject" id="subject" class="form-input" placeholder="e.g. Payment Issue, App Bug" required data-i18n="comp.subject.ph" data-i18n-attr="placeholder">
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="message" data-i18n="comp.message.label">Detailed Message</label>
                    <textarea name="message" id="message" rows="5" class="form-input" placeholder="Describe your concern..." required data-i18n="comp.message.ph" data-i18n-attr="placeholder"></textarea>
                </div>
                
                <button type="submit" class="btn btn-primary btn-block" data-i18n="btn.submitdispute">Submit Dispute</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
