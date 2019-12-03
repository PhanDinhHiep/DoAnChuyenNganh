<%-- 
    Document   : xoagiohang
    Created on : Dec 26, 2018, 4:25:50 AM
    Author     : phand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("GioHang");
            response.sendRedirect("Home");
        %>
        <h1>Hello World!</h1>
    </body>
</html>
