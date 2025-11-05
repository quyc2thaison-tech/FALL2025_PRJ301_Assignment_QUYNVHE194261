<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Đơn xin nghỉ phép</title>
            <style>
                body { background:#f6f7fb; font-family: Segoe UI, Arial; color:#1e2b4a }
                .wrap { max-width: 720px; margin: 6vh auto; padding: 0 16px }
                .card { background:#fff; border:1px solid #e4e7f1; border-radius:12px; box-shadow:0 10px 30px rgba(22,34,80,.08); padding:24px }
                h3 { margin:0 0 4px 0 }
                .meta { color:#667; margin-bottom:16px }
                .row { margin: 12px 0 }
                .label { display:inline-block; width:120px; color:#415 }
                .input { padding:8px 10px; border:1px solid #cfd5e6; border-radius:8px }
                .textarea { width:100%; height:140px; padding:10px; border:1px solid #cfd5e6; border-radius:8px; resize:vertical }
                .actions { display:flex; justify-content:flex-end; gap:10px; margin-top:16px }
                .btn { background:#4b79d8; color:#fff; border:0; padding:10px 20px; border-radius:8px; cursor:pointer }
                .btn.secondary { background:#8a93a6 }
            </style>
        </head>

        <body>
            <div class="wrap">
                <div class="card">
                    <h3>Đơn xin nghỉ phép</h3>
                    <div class="meta">
                        User: <strong><c:out value="${sessionScope.auth.employee.name}" /></strong>
                        , Role: <strong>
                            <c:choose>
                                <c:when test="${not empty sessionScope.auth.roles}">
                                    <c:out value="${sessionScope.auth.roles[0].name}" />
                                </c:when>
                                <c:otherwise>Chưa gán</c:otherwise>
                            </c:choose>
                        </strong>
                        , Dep: <strong>
                            <c:choose>
                                <c:when test="${sessionScope.auth.employee.dept ne null}">
                                    <c:out value="${sessionScope.auth.employee.dept.name}" />
                                </c:when>
                                <c:otherwise>Không rõ</c:otherwise>
                            </c:choose>
                        </strong>
                    </div>

                    <form action="${pageContext.request.contextPath}/request/create" method="post">
                        <div class="row">
                            <label class="label">Từ ngày:</label>
                            <input class="input" type="date" name="from" required />
                        </div>

                        <div class="row">
                            <label class="label">Tới ngày:</label>
                            <input class="input" type="date" name="to" required />
                        </div>

                        <div class="row">
                            <div style="margin-bottom:6px">Lý do:</div>
                            <textarea class="textarea" name="reason" placeholder="Nhập lý do..." required></textarea>
                        </div>

                        <div class="actions">
                            <a class="btn secondary" href="${pageContext.request.contextPath}/request/list">Hủy</a>
                            <button class="btn" type="submit">Gửi</button>
                        </div>
                    </form>
                </div>
            </div>
        </body>

        </html>