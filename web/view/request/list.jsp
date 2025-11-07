<%-- 
    Document   : list
    Created on : Oct 21, 2025, 10:37:00 PM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách đơn nghỉ phép</title>
        <style>
            body { background:#f6f7fb; font-family: Segoe UI, Arial; color:#1e2b4a }
            .wrap { max-width: 1000px; margin: 5vh auto; padding:0 16px }
            .toolbar { display:flex; justify-content:space-between; align-items:center; margin-bottom:12px }
            .btn { background:#4b79d8; color:#fff; border:0; padding:8px 16px; border-radius:8px; text-decoration:none }
            table { width:100%; border-collapse: collapse; background:#fff; border:1px solid #e4e7f1; border-radius:12px; overflow:hidden; box-shadow:0 10px 30px rgba(22,34,80,.08) }
            th, td { padding:10px 12px; border-bottom:1px solid #eef1f7; text-align:left }
            th { background:#f3f5fb; color:#4a5578 }
            .status { padding:4px 10px; border-radius:999px; font-size:12px }
            .s-processing { background:#fff3cd; color:#8a6d3b }
            .s-approved { background:#d1f2e3; color:#1f7a55 }
            .s-rejected { background:#ffd6d9; color:#a61b2b }
            .actions a { margin-right:8px }
        </style>
    </head>
    <body>
        <div class="wrap">
            <div class="toolbar">
                <h2>Đơn xin nghỉ phép</h2>
                <a class="btn" href="${pageContext.request.contextPath}/request/create">Tạo đơn mới</a>
            </div>
            <jsp:include page="../util/greeting.jsp"></jsp:include>
            <table>
                <tr>
                    <th>Request ID</th>
                    <th>Người tạo</th>
                    <th>Lý do</th>
                    <th>Từ</th>
                    <th>Đến</th>
                    <th>Trạng thái</th>
                    <th>Xử lý</th>
                </tr>
            <c:forEach items="${requestScope.rfls}" var="r">
                <tr>
                    <td>#${r.id}</td>
                    <td>${r.created_by.name}</td>
                    <td>${r.reason}</td>
                    <td>${r.from}</td>
                    <td>${r.to}</td>
                    <td>
                        <c:choose>
                            <c:when test="${r.status eq 0}"><span class="status s-processing">Đang xử lý</span></c:when>
                            <c:when test="${r.status eq 1}"><span class="status s-approved">Đã duyệt</span></c:when>
                            <c:otherwise><span class="status s-rejected">Từ chối</span></c:otherwise>
                        </c:choose>
                    </td>
                    <td class="actions">
                        <c:if test="${r.processed_by ne null}">
                            ${r.processed_by.name} — thay đổi thành:
                            <c:if test="${r.status eq 1}">
                            <a href="review?rid=${r.id}">Rejected</a>
                            </c:if>
                             <c:if test="${r.status eq 2}">
                            <a href="review?rid=${r.id}">Approved</a>
                            </c:if>
                        </c:if>
                        <c:if test="${r.processed_by eq null}">
                            <a href="review?rid=${r.id}">Approve</a>
                            <a href="review?rid=${r.id}">Reject</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <!-- Pagination -->
        <div style="margin-top:24px;text-align:center">
            <div style="margin-bottom:8px;color:#6b7280">
                <c:set var="start" value="${(pageIndex-1)*pageSize + 1}" />
                <c:set var="end" value="${pageIndex*pageSize}" />
                <c:if test="${end > totalRecords}">
                    <c:set var="end" value="${totalRecords}" />
                </c:if>
                Hiển thị ${start} - ${end} trong tổng số ${totalRecords} đơn
            </div>
            <div class="pagination" style="display:flex;gap:8px;justify-content:center;align-items:center">
                <c:if test="${pageIndex > 1}">
                    <a href="?page=1" style="padding:6px 12px;border:1px solid #e5e7eb;border-radius:6px;text-decoration:none;color:#374151">&lt;&lt;</a>
                    <a href="?page=${pageIndex-1}" style="padding:6px 12px;border:1px solid #e5e7eb;border-radius:6px;text-decoration:none;color:#374151">&lt;</a>
                </c:if>
                
                <c:set var="begin" value="${pageIndex-2}" />
                <c:if test="${begin < 1}">
                    <c:set var="begin" value="1" />
                </c:if>
                <c:set var="end" value="${pageIndex+2}" />
                <c:if test="${end > totalPages}">
                    <c:set var="end" value="${totalPages}" />
                </c:if>
                
                <c:forEach begin="${begin}" end="${end}" var="i">
                    <c:choose>
                        <c:when test="${i == pageIndex}">
                            <span style="padding:6px 12px;background:#4b79d8;color:white;border-radius:6px;min-width:20px">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${i}" style="padding:6px 12px;border:1px solid #e5e7eb;border-radius:6px;text-decoration:none;color:#374151">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${pageIndex < totalPages}">
                    <a href="?page=${pageIndex+1}" style="padding:6px 12px;border:1px solid #e5e7eb;border-radius:6px;text-decoration:none;color:#374151">&gt;</a>
                    <a href="?page=${totalPages}" style="padding:6px 12px;border:1px solid #e5e7eb;border-radius:6px;text-decoration:none;color:#374151">&gt;&gt;</a>
                </c:if>
            </div>
        </div>
        </div>
    </body>
</html>
