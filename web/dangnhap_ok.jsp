<%@page import="java.util.Vector"%>
<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8" errorPage="loikh.jsp"%>
<%@include file="Header.html" %>
<%
    String sdt = request.getParameter("sdt");
    String matkhau = request.getParameter("mk");
    Khachhang kh = Khachhang.dangnhapKhachHang(sdt, matkhau);
    String loi = "";
    if (kh != null ) {  
        session.setAttribute("KH", kh);
        response.sendRedirect("Home");      
    }
    else throw new Exception(loi);
%>
<div style="padding-top: 70px;">
    <h4><%=loi%></h4>
</div>
<%@include file="Footer.html" %>
