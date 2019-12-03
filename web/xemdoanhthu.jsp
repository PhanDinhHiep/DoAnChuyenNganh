<%-- 
    Document   : xemdoanhthu
    Created on : Dec 2, 2018, 12:43:07 AM
    Author     : phand
--%>

<%@page import="model.FotmatSo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nd = (String) request.getAttribute("ngaytruoc");
    String ns = (String) request.getAttribute("ngaysau");
    int doanhthu = (int) (request.getAttribute("doanhthu"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Doanh thu từ <%=nd%> đến <%=ns%></title>
    </head>
    <body>
    <center>
        <h1>Doanh thu Tanaka</h1>
        <table class="table table-bordered">
            <tr>
                <th scope="col">Từ ngày</th>
                <th scope="col">Đến ngày</th>
                <th scope="col">Doanh thu</th>
            </tr>
            <tr>
                <td><%=nd%></td>
                <td><%=ns%></td>
                <td><%=FotmatSo.fm(doanhthu)%></td>
            </tr>
        </table>

    </center>

</body>
</html>
