<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp"%>
<%@include file="Header.html"%>
<%
    String thongbao;
    Khachhang kh = (Khachhang) session.getAttribute("KHN");
    if (kh == null) {
        throw new Exception("Bạn chưa đăng nhập");
    } else {
        thongbao = "Đăng xuất thành công! <br> Tạm Biệt " + kh.getHoten();
        session.invalidate();
        response.sendRedirect("Home");
    }
    
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf"><%=thongbao%></h4>
    </div>
</div>
<%@include file="Footer.html" %>

