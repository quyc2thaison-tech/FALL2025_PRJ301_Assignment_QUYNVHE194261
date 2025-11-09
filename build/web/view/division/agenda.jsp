<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Agenda</title>
            <style>
                body { background:#f6f7fb; font-family: Segoe UI, Arial; color:#1e2b4a }
                .wrap { max-width: 1200px; margin: 5vh auto; padding:0 16px }
                .toolbar { display:flex; justify-content:space-between; align-items:center; margin-bottom:12px }
                .btn { background:#4b79d8; color:#fff; border:0; padding:8px 14px; border-radius:8px; text-decoration:none }
                .card { background:#fff; border:1px solid #e4e7f1; border-radius:12px; box-shadow:0 10px 30px rgba(22,34,80,.08); padding:16px }

                /* Table responsive and sticky first column */
                .table-wrap { overflow-x:auto; margin-top:12px; }
                table { border-collapse: collapse; width:100%; min-width:800px; table-layout:fixed }
                th, td { border: 1px solid #e6e9f3; padding: 6px 8px; text-align: center; font-size:13px }
                th { background:#f3f5fb; position:sticky; top:0; z-index:2 }
                th.day, td.day { min-width: var(--day-width,60px); }

                /* Sticky first column */
                .sticky-col { position: -webkit-sticky; position: sticky; left: 0; background: #fff; z-index:4; text-align:left }
                th.sticky-col { z-index:6 }

                .present { background: #98d77a }
                .leave { background: #ef3c32; color:#fff }
                .name { text-align:left; font-weight:600; padding-left:12px }

                /* size variants controlled by wrapper class */
                .table-wrap.small th.day, .table-wrap.small td.day { --day-width:40px }
                .table-wrap.medium th.day, .table-wrap.medium td.day { --day-width:60px }
                .table-wrap.large th.day, .table-wrap.large td.day { --day-width:100px }

                /* visual polish */
                table tr:hover td { filter:brightness(.98) }
            </style>
        </head>

        <body>
            <jsp:include page="/view/util/header.jsp" />
            <div class="wrap">
                <div class="card">
                        <div class="toolbar">
                            <h2>Agenda nhân sự</h2>
                            <form method="get" action="${pageContext.request.contextPath}/division/agenda">
                                <div style="display:flex;gap:8px;align-items:center">
                                    <div>
                                        Từ: <input type="date" name="from" value="${param.from}" />
                                        Tới: <input type="date" name="to" value="${param.to}" />
                                        <button class="btn" type="submit">Xem</button>
                                    </div>
                                    <div style="display:flex;align-items:center;gap:8px">
                                        <label style="font-size:13px;color:#445">Kích thước ô:</label>
                                        <select id="cellSize" aria-label="Kích thước ô" style="padding:6px;border-radius:6px;border:1px solid #d7dbe8">
                                            <option value="medium">Bình thường</option>
                                            <option value="small">Nhỏ</option>
                                            <option value="large">Lớn</option>
                                        </select>
                                    </div>
                                    </div>
                                <script>
                                    (function(){
                                        var sel = document.getElementById('cellSize');
                                        var wrap = document.getElementById('tableWrap');
                                        if (!sel || !wrap) return;
                                        // read saved size from localStorage
                                        var saved = localStorage.getItem('agenda.cellSize');
                                        if (saved) sel.value = saved;
                                        function apply() {
                                            var v = sel.value || 'medium';
                                            wrap.classList.remove('small','medium','large');
                                            wrap.classList.add(v);
                                            try{ localStorage.setItem('agenda.cellSize', v) }catch(e){}
                                        }
                                        sel.addEventListener('change', apply);
                                        apply();
                                    })();
                                </script>
                            </form>
                        </div>

                    <div class="table-wrap medium" id="tableWrap">
                        <table>
                            <tr>
                                <th class="sticky-col">Nhân sự</th>
                                <c:forEach items="${days}" var="d">
                                    <th class="day">${d.dayOfMonth}/${d.monthValue}</th>
                                </c:forEach>
                            </tr>
                            <c:forEach items="${employees}" var="e">
                                <tr>
                                    <td class="name sticky-col">${e.name}</td>
                                    <c:forEach items="${days}" var="d">
                                        <c:set var="reds" value="${redDaysByEmployee[e.id]}" />
                                        <c:choose>
                                            <c:when test="${reds != null && reds.contains(d)}">
                                                <td class="day leave"></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="day present"></td>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    </div>
            </div>
        </body>

        </html>