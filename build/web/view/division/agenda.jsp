<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Agenda</title>
            <style>
                body { background:#f6f7fb; font-family: Segoe UI, Arial; color:#1e2b4a }
                .wrap { max-width: 1100px; margin: 5vh auto; padding:0 16px }
                .toolbar { display:flex; justify-content:space-between; align-items:center; margin-bottom:12px }
                .btn { background:#4b79d8; color:#fff; border:0; padding:8px 14px; border-radius:8px; text-decoration:none }
                .card { background:#fff; border:1px solid #e4e7f1; border-radius:12px; box-shadow:0 10px 30px rgba(22,34,80,.08); padding:16px }
                table { width:100%; border-collapse: collapse }
                td, th { border: 1px solid #e6e9f3; padding: 8px 10px; text-align: center }
                th { background:#f3f5fb; position:sticky; top:0; z-index:2 }
                .present { background: #98d77a }
                .leave { background: #ef3c32; color:#fff }
                .name { text-align:left; font-weight:600 }
            </style>
        </head>

        <body>
            <div class="wrap">
                <div class="card">
                    <div class="toolbar">
                        <h2>Agenda nhân sự</h2>
                        <form method="get" action="${pageContext.request.contextPath}/division/agenda">
                            Từ: <input type="date" name="from" value="${param.from}" />
                            Tới: <input type="date" name="to" value="${param.to}" />
                            <button class="btn" type="submit">Xem</button>
                        </form>
                    </div>

            <table>
                <tr>
                    <th>Nhân sự</th>
                    <c:forEach items="${days}" var="d">
                        <th>${d.dayOfMonth}/${d.monthValue}</th>
                    </c:forEach>
                </tr>
                <c:forEach items="${employees}" var="e">
                    <tr>
                        <td class="name">${e.name}</td>
                        <c:forEach items="${days}" var="d">
                            <c:set var="reds" value="${redDaysByEmployee[e.id]}" />
                            <c:choose>
                                <c:when test="${reds != null && reds.contains(d)}">
                                    <td class="leave"></td>
                                </c:when>
                                <c:otherwise>
                                    <td class="present"></td>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
                </div>
            </div>
        </body>

        </html>