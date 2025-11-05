<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Agenda</title>
            <style>
                table {
                    border-collapse: collapse
                }

                td,
                th {
                    border: 1px solid #888;
                    padding: 6px 10px;
                    text-align: center
                }

                .present {
                    background: #98d77a
                }

                .leave {
                    background: #ef3c32;
                    color: #fff
                }

                .name {
                    text-align: left;
                    font-weight: 600
                }

                .toolbar {
                    margin-bottom: 12px
                }
            </style>
        </head>

        <body>
            <div class="toolbar">
                <form method="get" action="${pageContext.request.contextPath}/division/agenda">
                    Từ: <input type="date" name="from" value="${param.from}" />
                    Tới: <input type="date" name="to" value="${param.to}" />
                    <button type="submit">Xem</button>
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
        </body>

        </html>