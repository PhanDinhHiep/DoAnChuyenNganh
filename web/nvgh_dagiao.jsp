<%-- 
    Document   : nvgh_dagiao
    Created on : Dec 13, 2018, 3:44:02 PM
    Author     : phand
--%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%
    int sodh = Integer.parseInt(request.getParameter("shd"));
    Donhang donhang = new Donhang();
    boolean kq = donhang.NVGHdagiao(sodh);
    if(kq== true){
        response.sendRedirect("nvgh_donhangduocgiao.jsp");
    }
    else {
        throw new Exception("Lỗi rồi!!! vui lòng thực hiện lại!!!");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
