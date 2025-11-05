<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Đơn xin nghỉ phép</title>
            <style>
                .card {
                    width: 480px;
                    background: #f7e3d3;
                    border: 2px solid #2a3a5a;
                    border-radius: 6px;
                    padding: 16px;
                    font-family: Segoe UI, Arial;
                    color: #1e2b4a
                }

                .row {
                    margin: 10px 0
                }

                .label {
                    display: inline-block;
                    width: 100px
                }

                .input {
                    padding: 6px 8px;
                    border: 1px solid #b9b9b9;
                    border-radius: 4px
                }

                .textarea {
                    width: 100%;
                    height: 140px;
                    padding: 8px;
                    border: 1px solid #b9b9b9;
                    border-radius: 4px;
                    resize: vertical
                }

                .actions {
                    text-align: right;
                    margin-top: 12px
                }

                .btn {
                    background: #4b79d8;
                    color: #fff;
                    border: 0;
                    padding: 10px 24px;
                    border-radius: 8px;
                    cursor: pointer
                }
            </style>
        </head>

        <body>
            <div class="card">
                <h3>Đơn xin nghỉ phép</h3>

                <div class="row">
                    <span>User:</span>
                    <strong>
                        <c:out value="${sessionScope.auth.employee.name}" />
                    </strong>
                    , Role:
                    <strong>
                        <c:choose>
                            <c:when test="${not empty sessionScope.auth.roles}">
                                <c:out value="${sessionScope.auth.roles[0].name}" />
                            </c:when>
                            <c:otherwise>Chưa gán</c:otherwise>
                        </c:choose>
                    </strong>
                    , Dep:
                    <strong>
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
                        <div>Lý do:</div>
                        <textarea class="textarea" name="reason" placeholder="Nhập lý do..." required></textarea>
                    </div>

                    <div class="actions">
                        <button class="btn" type="submit">Gửi</button>
                    </div>
                </form>
            </div>
        </body>

        </html>