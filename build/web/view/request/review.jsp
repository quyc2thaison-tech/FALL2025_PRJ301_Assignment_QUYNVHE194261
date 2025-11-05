<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Duyệt đơn xin nghỉ phép</title>
            <style>
                .card {
                    width: 520px;
                    background: #dfeefa;
                    border: 2px solid #5a6b9a;
                    border-radius: 6px;
                    padding: 16px;
                    font-family: Segoe UI, Arial;
                    color: #1e2b4a
                }

                .row {
                    margin: 10px 0
                }

                .textarea {
                    width: 100%;
                    height: 120px;
                    padding: 8px;
                    border: 1px solid #b9b9b9;
                    border-radius: 4px;
                    background: #eee
                }

                .actions {
                    margin-top: 14px;
                    display: flex;
                    gap: 16px
                }

                .btn {
                    min-width: 140px;
                    background: #3f6fd6;
                    color: #fff;
                    border: 0;
                    padding: 10px 24px;
                    border-radius: 8px;
                    cursor: pointer
                }

                .btn.reject {
                    background: #2f64b2
                }

                .btn.approve {
                    background: #4b79d8
                }
            </style>
        </head>

        <body>
            <div class="card">
                <h3>Duyệt đơn xin nghỉ phép</h3>

                <div class="row">
                    Duyệt bởi User: <strong>${sessionScope.auth.employee.name}</strong>
                    , Role: <strong>
                        <c:out
                            value="${not empty sessionScope.auth.roles ? sessionScope.auth.roles[0].name : 'Chưa gán'}" />
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
                    <button class="btn reject" type="submit" name="action" value="reject">Reject</button>
                    <button class="btn approve" type="submit" name="action" value="approve">Approve</button>
                </form>
            </div>
        </body>

        </html>