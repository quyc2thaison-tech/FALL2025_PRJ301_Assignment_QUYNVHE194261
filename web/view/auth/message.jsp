<%-- 
    Document   : message
    Created on : Oct 6, 2025, 1:13:50 PM
    Author     : sonnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/view/util/header.jsp" />
        <div style="padding:16px">
            <span id="message">${requestScope.message}</span>
        </div>
    </body>
</html>
