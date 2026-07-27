<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<style>
/* ======== Track Order Page Styles ======== */
.track-page { max-width: 900px; margin: 0 auto; }

/* ---- Page Header ---- */
.track-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 14px;
    margin-bottom: 28px;
}
.track-consignment {
    font-size: 0.8rem;
    font-weight: 600;
    color: var(--text-secondary);
    text-transform: uppercase;
    letter-spacing: 0.06em;
    margin-bottom: 4px;
}
.track-order-id {
    font-size: 1.55rem;
    font-weight: 800;
    color: var(--accent-green);
    letter-spacing: -0.02em;
}
.btn-print {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    padding: 10px 20px;
    border: 1.5px solid var(--border);
    border-radius: var(--radius-sm);
    background: var(--bg-secondary);
    color: var(--text-primary);
    font-weight: 600;
    font-size: 0.88rem;
    cursor: pointer;
    transition: var(--transition);
}
.btn-print:hover {
    background: var(--accent-green);
    color: #fff;
    border-color: var(--accent-green);
    box-shadow: 0 4px 14px rgba(22,163,74,0.25);
}

/* ---- Progress Bar (5 steps) ---- */
.track-card {
    background: var(--bg-secondary);
    border-radius: var(--radius);
    border: 1px solid var(--border);
    box-shadow: var(--shadow-md);
    margin-bottom: 20px;
    overflow: hidden;
}
.progress-section {
    padding: 32px 36px 24px;
    border-bottom: 1px solid var(--border);
}
.progress-steps {
    display: flex;
    align-items: flex-start;
    position: relative;
}
.progress-steps::before {
    content: '';
    position: absolute;
    top: 17px;
    left: 0;
    right: 0;
    height: 3px;
    background: var(--border);
    z-index: 0;
}
.progress-fill {
    position: absolute;
    top: 17px;
    left: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--accent-green), #22c55e);
    border-radius: 2px;
    z-index: 1;
    transition: width 0.8s cubic-bezier(0.4, 0, 0.2, 1);
}
.step-item {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    z-index: 2;
}
.step-circle {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    border: 3px solid var(--border);
    background: var(--bg-secondary);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1rem;
    transition: var(--transition);
    position: relative;
}
.step-circle.done {
    border-color: var(--accent-green);
    background: var(--accent-green);
    color: #fff;
    box-shadow: 0 0 0 4px rgba(22,163,74,0.15);
}
.step-circle.active {
    border-color: var(--accent-green);
    background: var(--accent-green);
    color: #fff;
    box-shadow: 0 0 0 6px rgba(22,163,74,0.18), 0 0 20px rgba(22,163,74,0.3);
    animation: pulse-step 1.8s ease-in-out infinite;
}
.step-circle.rejected {
    border-color: #ef4444;
    background: #ef4444;
    color: #fff;
}
@keyframes pulse-step {
    0%, 100% { box-shadow: 0 0 0 4px rgba(22,163,74,0.18), 0 0 15px rgba(22,163,74,0.2); }
    50% { box-shadow: 0 0 0 8px rgba(22,163,74,0.12), 0 0 25px rgba(22,163,74,0.35); }
}
.step-label {
    margin-top: 10px;
    font-size: 0.73rem;
    font-weight: 600;
    color: var(--text-muted);
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    line-height: 1.3;
}
.step-label.active-label { color: var(--accent-green); }
.step-label.done-label   { color: var(--accent-green); }
.step-label.rej-label    { color: #ef4444; }

/* ---- Journey bar (origin → dest) ---- */
.journey-section {
    padding: 20px 36px;
    display: flex;
    align-items: center;
    gap: 0;
    border-bottom: 1px solid var(--border);
}
.journey-node {
    display: flex;
    flex-direction: column;
    gap: 3px;
}
.journey-node-dot {
    width: 10px; height: 10px;
    border-radius: 50%;
    background: var(--accent-green);
    margin-bottom: 4px;
}
.journey-node-label {
    font-size: 0.7rem;
    font-weight: 700;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: 0.07em;
}
.journey-node-city {
    font-size: 0.95rem;
    font-weight: 700;
    color: var(--text-primary);
}
.journey-line {
    flex: 1;
    height: 2px;
    background: linear-gradient(90deg, var(--accent-green), #e2e8f0);
    margin: 0 18px;
    position: relative;
}
.journey-line::after {
    content: '🚚';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 1.2rem;
    background: var(--bg-secondary);
    padding: 0 8px;
}

/* ---- Detail grid ---- */
.detail-section {
    padding: 24px 36px;
}
.detail-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
}
.detail-item label {
    display: block;
    font-size: 0.72rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    color: var(--text-muted);
    margin-bottom: 4px;
}
.detail-item span {
    font-size: 0.95rem;
    font-weight: 600;
    color: var(--text-primary);
}
.detail-value-highlight {
    display: inline-block;
    background: var(--accent-green-light);
    color: var(--accent-green) !important;
    padding: 3px 10px;
    border-radius: 6px;
    font-weight: 700 !important;
}

/* ---- Routing Steps timeline ---- */
.timeline-card {
    background: var(--bg-secondary);
    border-radius: var(--radius);
    border: 1px solid var(--border);
    box-shadow: var(--shadow-sm);
    margin-bottom: 28px;
    overflow: hidden;
}
.timeline-header {
    padding: 18px 28px;
    border-bottom: 1px solid var(--border);
    background: linear-gradient(135deg, var(--accent-green-light), #fff);
}
.timeline-header h3 {
    font-size: 1rem;
    font-weight: 800;
    color: var(--accent-green);
    text-transform: uppercase;
    letter-spacing: 0.07em;
}
.timeline-list { padding: 8px 0; }
.timeline-item {
    display: flex;
    gap: 0;
    align-items: stretch;
    padding: 0 28px;
    position: relative;
}
.timeline-item:not(:last-child)::after {
    content: '';
    position: absolute;
    left: 50px;
    top: 46px;
    bottom: 0;
    width: 2px;
    background: linear-gradient(to bottom, var(--accent-green), var(--border));
    z-index: 0;
}
.timeline-left {
    min-width: 90px;
    padding: 16px 12px 16px 0;
    text-align: right;
    flex-shrink: 0;
}
.timeline-date {
    font-size: 0.72rem;
    font-weight: 700;
    color: var(--text-secondary);
    display: block;
}
.timeline-time {
    font-size: 0.8rem;
    font-weight: 600;
    color: var(--text-muted);
    display: block;
    margin-top: 2px;
}
.timeline-icon-col {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    z-index: 1;
    padding: 12px 0;
}
.timeline-dot {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: var(--accent-green);
    border: 3px solid var(--bg-secondary);
    box-shadow: 0 0 0 2px var(--accent-green);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.7rem;
    color: #fff;
    flex-shrink: 0;
}
.timeline-dot.pending-dot {
    background: #f59e0b;
    box-shadow: 0 0 0 2px #f59e0b;
}
.timeline-dot.rejected-dot {
    background: #ef4444;
    box-shadow: 0 0 0 2px #ef4444;
}
.timeline-right {
    padding: 14px 0 14px 16px;
    flex: 1;
}
.timeline-title {
    font-size: 0.92rem;
    font-weight: 700;
    color: var(--text-primary);
}
.timeline-sub {
    font-size: 0.8rem;
    color: var(--text-secondary);
    margin-top: 3px;
}
.timeline-divider {
    border: none;
    border-top: 1px solid var(--border);
    margin: 0 28px;
}

/* ---- Back button row ---- */
.track-footer {
    display: flex;
    justify-content: flex-start;
    margin-bottom: 40px;
}

/* ---- Print ---- */
@media print {
    .navbar, .btn-print, .track-footer, footer { display: none !important; }
    .track-page { max-width: 100%; }
    body { background: white !important; background-image: none !important; }
    .track-card, .timeline-card { box-shadow: none; border: 1px solid #ccc; }
}

/* ---- Responsive ---- */
@media (max-width: 640px) {
    .detail-grid { grid-template-columns: 1fr 1fr; }
    .progress-section, .detail-section, .journey-section { padding-left: 18px; padding-right: 18px; }
    .step-label { font-size: 0.62rem; }
    .timeline-left { min-width: 72px; font-size: 0.68rem; }
    .timeline-item { padding: 0 14px; }
    .timeline-item:not(:last-child)::after { left: 34px; }
}
</style>

<%-- ======================================================
     Determine step level from booking status
     Levels: 0=Pending, 1=Approved, 2=Shipped, 3=OutForDelivery(not stored—skip), 4=Delivered, -1=Rejected
     We map: Pending->1, Approved->2, Shipped->3, Delivered->4, Rejected->-1
     ====================================================== --%>
<c:set var="statusVal" value="${booking.status}" />
<c:choose>
    <c:when test="${statusVal == 'Rejected'}"><c:set var="stepNum" value="-1" /></c:when>
    <c:when test="${statusVal == 'Delivered'}"><c:set var="stepNum" value="5" /></c:when>
    <c:when test="${statusVal == 'Shipped'}"><c:set var="stepNum" value="3" /></c:when>
    <c:when test="${statusVal == 'Approved' || statusVal == 'Success'}"><c:set var="stepNum" value="2" /></c:when>
    <c:otherwise><c:set var="stepNum" value="1" /></c:otherwise>
</c:choose>

<div class="track-page">

    <%-- ---- Page Header ---- --%>
    <div class="track-header">
        <div>
            <p class="track-consignment" data-i18n="track.consignment">Order Tracking</p>
            <h1 class="track-order-id">Order #${booking.id}</h1>
        </div>
        <button class="btn-print" onclick="window.print()" id="printReportBtn">
            🖨️ <span data-i18n="track.print">Print Report</span>
        </button>
    </div>

    <%-- ---- Main Tracking Card ---- --%>
    <div class="track-card">

        <%-- Progress Steps --%>
        <div class="progress-section">
            <div class="progress-steps" id="progressSteps">
                <%-- Fill bar width is set by JS below --%>
                <div class="progress-fill" id="progressFill"></div>

                <%-- Step 1: Booked / Pending --%>
                <div class="step-item">
                    <div class="step-circle
                        <c:choose>
                            <c:when test="${stepNum == -1}">rejected</c:when>
                            <c:when test="${stepNum >= 1}">done</c:when>
                        </c:choose>" id="step1">
                        <c:choose>
                            <c:when test="${stepNum >= 1}">✓</c:when>
                            <c:otherwise>1</c:otherwise>
                        </c:choose>
                    </div>
                    <span class="step-label
                        <c:choose>
                            <c:when test="${stepNum == -1}">rej-label</c:when>
                            <c:when test="${stepNum >= 1}">done-label</c:when>
                        </c:choose>" data-i18n="track.step.booked">Booked</span>
                </div>

                <%-- Step 2: Approved --%>
                <div class="step-item">
                    <div class="step-circle
                        <c:choose>
                            <c:when test="${stepNum == -1}">rejected</c:when>
                            <c:when test="${stepNum > 2}">done</c:when>
                            <c:when test="${stepNum == 2}">active</c:when>
                        </c:choose>" id="step2">
                        <c:choose>
                            <c:when test="${stepNum == -1}">✕</c:when>
                            <c:when test="${stepNum >= 2}">✓</c:when>
                            <c:otherwise>2</c:otherwise>
                        </c:choose>
                    </div>
                    <span class="step-label
                        <c:choose>
                            <c:when test="${stepNum == -1}">rej-label</c:when>
                            <c:when test="${stepNum == 2}">active-label</c:when>
                            <c:when test="${stepNum > 2}">done-label</c:when>
                        </c:choose>" data-i18n="track.step.approved">Approved</span>
                </div>

                <%-- Step 3: Dispatched / Shipped --%>
                <div class="step-item">
                    <div class="step-circle
                        <c:choose>
                            <c:when test="${stepNum > 3}">done</c:when>
                            <c:when test="${stepNum == 3}">active</c:when>
                        </c:choose>" id="step3">
                        <c:choose>
                            <c:when test="${stepNum > 3}">✓</c:when>
                            <c:when test="${stepNum == 3}">✓</c:when>
                            <c:otherwise>3</c:otherwise>
                        </c:choose>
                    </div>
                    <span class="step-label
                        <c:choose>
                            <c:when test="${stepNum == 3}">active-label</c:when>
                            <c:when test="${stepNum > 3}">done-label</c:when>
                        </c:choose>" data-i18n="track.step.shipped">Dispatched</span>
                </div>

                <%-- Step 4: Out for Delivery --%>
                <div class="step-item">
                    <div class="step-circle
                        <c:choose>
                            <c:when test="${stepNum == 5}">done</c:when>
                        </c:choose>" id="step4">
                        <c:choose>
                            <c:when test="${stepNum == 5}">✓</c:when>
                            <c:otherwise>4</c:otherwise>
                        </c:choose>
                    </div>
                    <span class="step-label
                        <c:choose>
                            <c:when test="${stepNum == 5}">done-label</c:when>
                        </c:choose>" data-i18n="track.step.outfordelivery">Out for Delivery</span>
                </div>

                <%-- Step 5: Delivered --%>
                <div class="step-item">
                    <div class="step-circle
                        <c:choose>
                            <c:when test="${stepNum == 5}">done</c:when>
                        </c:choose>" id="step5">
                        <c:choose>
                            <c:when test="${stepNum == 5}">✓</c:when>
                            <c:otherwise>5</c:otherwise>
                        </c:choose>
                    </div>
                    <span class="step-label
                        <c:choose>
                            <c:when test="${stepNum == 5}">done-label</c:when>
                        </c:choose>" data-i18n="track.step.delivered">Delivered</span>
                </div>
            </div>
        </div>

        <%-- Journey bar --%>
        <div class="journey-section">
            <div class="journey-node">
                <div class="journey-node-dot"></div>
                <span class="journey-node-label" data-i18n="track.origin">Origin (Farm)</span>
                <span class="journey-node-city">${not empty booking.farmerLocation ? booking.farmerLocation : booking.farmerName}</span>
            </div>
            <div class="journey-line"></div>
            <div class="journey-node" style="text-align:right;">
                <div class="journey-node-dot" style="margin-left:auto; background: var(--accent-purple);"></div>
                <span class="journey-node-label" data-i18n="track.destination">Destination (Shop)</span>
                <span class="journey-node-city">${not empty booking.shopkeeperLocation ? booking.shopkeeperLocation : 'Shopkeeper'}</span>
            </div>
        </div>

        <%-- Detail grid --%>
        <div class="detail-section">
            <div class="detail-grid">
                <div class="detail-item">
                    <label data-i18n="track.detail.orderid">Order Number</label>
                    <span>#${booking.id}</span>
                </div>
                <div class="detail-item">
                    <label data-i18n="track.detail.type">Article Type</label>
                    <span class="detail-value-highlight">${booking.productCategory}</span>
                </div>
                <div class="detail-item">
                    <label data-i18n="track.detail.crop">Crop / Product</label>
                    <span>${booking.productName}</span>
                </div>
                <div class="detail-item">
                    <label data-i18n="track.detail.farmer">Booked From</label>
                    <span>${booking.farmerName}</span>
                </div>
                <div class="detail-item">
                    <label data-i18n="track.detail.booked">Booked On</label>
                    <span>${booking.createdAt}</span>
                </div>
                <div class="detail-item">
                    <label data-i18n="track.detail.qty">Quantity</label>
                    <span>${booking.quantity} kg</span>
                </div>
                <div class="detail-item">
                    <label data-i18n="track.detail.value">Order Value</label>
                    <span style="font-weight:800; color: var(--accent-green);">₹${booking.totalPrice}</span>
                </div>
                <div class="detail-item">
                    <label data-i18n="track.detail.status">Current Status</label>
                    <span class="detail-value-highlight">${booking.status}</span>
                </div>
                <div class="detail-item">
                    <label data-i18n="track.detail.dest">Destination</label>
                    <span>${not empty booking.shopkeeperLocation ? booking.shopkeeperLocation : '—'}</span>
                </div>
            </div>
        </div>
    </div>

    <%-- ---- Routing Steps / Timeline ---- --%>
    <div class="timeline-card">
        <div class="timeline-header">
            <h3>🗺️ <span data-i18n="track.routing">Routing Steps</span></h3>
        </div>
        <div class="timeline-list">

            <%-- Step 1: Always present — Order Placed --%>
            <div class="timeline-item">
                <div class="timeline-left">
                    <%
                        String _ts = String.valueOf(request.getAttribute("booking") != null ?
                            ((com.farmtoshop.model.Booking)request.getAttribute("booking")).getCreatedAt() : "");
                        String _tsDate = _ts.length() >= 10 ? _ts.substring(0, 10) : _ts;
                        String _tsTime = _ts.length() >= 19 ? _ts.substring(11, 19) : "";
                    %>
                    <span class="timeline-date"><%= _tsDate %></span>
                    <span class="timeline-time"><%= _tsTime %></span>
                </div>
                <div class="timeline-icon-col">
                    <div class="timeline-dot">📦</div>
                </div>
                <div class="timeline-right">
                    <div class="timeline-title" data-i18n="track.event.booked">Order Placed</div>
                    <div class="timeline-sub">${not empty booking.farmerLocation ? booking.farmerLocation : booking.farmerName}</div>
                </div>
            </div>
            <hr class="timeline-divider">

            <%-- Step 2: Approved --%>
            <c:if test="${stepNum >= 2 || stepNum == -1}">
                <div class="timeline-item">
                    <div class="timeline-left">
                        <span class="timeline-date">—</span>
                        <span class="timeline-time">—</span>
                    </div>
                    <div class="timeline-icon-col">
                        <div class="timeline-dot ${stepNum == -1 ? 'rejected-dot' : ''}">
                            ${stepNum == -1 ? '✕' : '✓'}
                        </div>
                    </div>
                    <div class="timeline-right">
                        <div class="timeline-title" data-i18n="track.event.approved">
                            ${stepNum == -1 ? 'Order Rejected' : 'Order Approved by Farmer'}
                        </div>
                        <div class="timeline-sub">${booking.farmerName}</div>
                    </div>
                </div>
                <hr class="timeline-divider">
            </c:if>
            <c:if test="${stepNum == 1}">
                <div class="timeline-item">
                    <div class="timeline-left">
                        <span class="timeline-date">—</span>
                    </div>
                    <div class="timeline-icon-col">
                        <div class="timeline-dot pending-dot">⏳</div>
                    </div>
                    <div class="timeline-right">
                        <div class="timeline-title" data-i18n="track.event.awaiting">Awaiting Farmer Approval</div>
                        <div class="timeline-sub" data-i18n="track.event.awaiting.sub">Your order is being reviewed by the farmer.</div>
                    </div>
                </div>
                <hr class="timeline-divider">
            </c:if>

            <%-- Step 3: Shipped / Dispatched --%>
            <c:if test="${stepNum >= 3}">
                <div class="timeline-item">
                    <div class="timeline-left">
                        <span class="timeline-date">—</span>
                        <span class="timeline-time">—</span>
                    </div>
                    <div class="timeline-icon-col">
                        <div class="timeline-dot">🚚</div>
                    </div>
                    <div class="timeline-right">
                        <div class="timeline-title" data-i18n="track.event.dispatched">Order Dispatched / Shipped</div>
                        <div class="timeline-sub">${not empty booking.farmerLocation ? booking.farmerLocation : booking.farmerName}</div>
                    </div>
                </div>
                <hr class="timeline-divider">
            </c:if>

            <%-- Step 4: Out for Delivery (implied when Delivered) --%>
            <c:if test="${stepNum == 5}">
                <div class="timeline-item">
                    <div class="timeline-left">
                        <span class="timeline-date">—</span>
                        <span class="timeline-time">—</span>
                    </div>
                    <div class="timeline-icon-col">
                        <div class="timeline-dot">🏍️</div>
                    </div>
                    <div class="timeline-right">
                        <div class="timeline-title" data-i18n="track.event.outfordelivery">Out for Delivery</div>
                        <div class="timeline-sub">${not empty booking.shopkeeperLocation ? booking.shopkeeperLocation : 'Destination'}</div>
                    </div>
                </div>
                <hr class="timeline-divider">

                <div class="timeline-item">
                    <div class="timeline-left">
                        <span class="timeline-date">—</span>
                        <span class="timeline-time">—</span>
                    </div>
                    <div class="timeline-icon-col">
                        <div class="timeline-dot">🎉</div>
                    </div>
                    <div class="timeline-right">
                        <div class="timeline-title" data-i18n="track.event.delivered">Order Delivered</div>
                        <div class="timeline-sub">${not empty booking.shopkeeperLocation ? booking.shopkeeperLocation : 'Destination'} &mdash; <span style="color:var(--accent-green); font-weight:700;" data-i18n="track.delivered.label">Delivered</span></div>
                    </div>
                </div>
            </c:if>

        </div>
    </div>

    <%-- Back button --%>
    <div class="track-footer">
        <c:choose>
            <c:when test="${viewerRole == 'farmer'}">
                <a href="${pageContext.request.contextPath}/farmer/bookings" class="btn btn-secondary" data-i18n="btn.back">← Back to Orders</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/shopkeeper/bookings" class="btn btn-secondary" data-i18n="btn.back">← Back to Orders</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
(function() {
    // Animate the progress fill bar based on step number
    var stepNum = parseInt('${stepNum}', 10);
    var fill = document.getElementById('progressFill');
    if (!fill) return;

    // 5 steps — fill widths for each step level
    // step 0 = 0%, 1 = 12.5%, 2 = 37.5%, 3 = 62.5%, 5 = 100%
    var fillMap = { '-1': '12.5%', '1': '12.5%', '2': '37.5%', '3': '62.5%', '5': '100%' };
    var w = fillMap[String(stepNum)] || '0%';
    // Animate after a small delay for visual impact
    setTimeout(function() { fill.style.width = w; }, 200);
})();
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
