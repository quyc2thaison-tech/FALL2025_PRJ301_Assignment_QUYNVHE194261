<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Duyệt đơn xin nghỉ phép</title>
            <style>
                body { background:#f6f7fb; font-family: Segoe UI, Arial; color:#1e2b4a }
                .wrap { max-width: 720px; margin: 6vh auto; padding:0 16px }
                .card { background:#fff; border:1px solid #e4e7f1; border-radius:12px; box-shadow:0 10px 30px rgba(22,34,80,.08); padding:24px }
                .row { margin: 12px 0 }
                .textarea { width: 100%; height: 120px; padding: 10px; border: 1px solid #cfd5e6; border-radius: 8px; background: #f7f8fc }
                .actions { margin-top: 16px; display: flex; gap: 12px }
                .btn { min-width: 140px; background: #3f6fd6; color: #fff; border: 0; padding: 10px 24px; border-radius: 8px; cursor: pointer; text-decoration:none; text-align:center }
                .btn.reject { background:#a23a3a }
                .btn.approve { background:#2e7d32 }
                .btn.back { background:#8a93a6 }
            </style>
        </head>

        <body>
            <div class="wrap">
                <div class="card">
                    <h3>Duyệt đơn xin nghỉ phép</h3>

                    <div class="row">
                        Duyệt bởi: <strong>${sessionScope.auth.employee.name}</strong>
                        , Role: <strong>
                            <c:out value="${not empty sessionScope.auth.roles ? sessionScope.auth.roles[0].name : 'Chưa gán'}" />
                        </strong>
                    </div>

                    <div class="row">Tạo bởi: <strong>${rfl.created_by.name}</strong></div>
                    <div class="row">Từ ngày: <strong>${rfl.from}</strong></div>
                    <div class="row">Tới ngày: <strong>${rfl.to}</strong></div>

                    <div class="row">Lý do:</div>
                    <div class="row">
                        <textarea class="textarea" readonly>${rfl.reason}</textarea>
                    </div>

                    <form class="actions" method="post" action="${pageContext.request.contextPath}/request/review">
                        <input type="hidden" name="rid" value="${rfl.id}" />
                        <a class="btn back" href="${pageContext.request.contextPath}/request/list">Quay lại</a>
                        <button class="btn reject" type="submit" name="action" value="reject">Reject</button>
                        <button class="btn approve" type="submit" name="action" value="approve">Approve</button>
                    </form>
                </div>
            </div>
        </body>

        </html>