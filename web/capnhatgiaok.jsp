<%-- 
    Document   : capnhatgiaok
    Created on : Dec 30, 2018, 2:01:56 PM
    Author     : phand
--%>

<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    int masanphm  = Integer.parseInt(request.getParameter("msp"));
    int giamoi = Integer.parseInt(request.getParameter("giamoi"));
    String thongbao = "";
    Sanpham sp = new Sanpham();
    
    boolean kq = sp.capnhatGiaBanSanPham(masanphm, giamoi);
    if(kq == true){
        thongbao = "ok cmnr";
        response.sendRedirect("capnhatgiaban.jsp");
    }else{
        thongbao ="Tạch cmnr"; 
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
        <h1><%=thongbao%></h1>
    </body>
</html>
