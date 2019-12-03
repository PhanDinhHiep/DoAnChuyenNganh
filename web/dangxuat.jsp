<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp"%>
<%@include file="Header.html"%>
<%
    String thongbao;
    Nhanvien nv = (Nhanvien) session.getAttribute("USER");
    if (nv == null) {
        throw new Exception("Bạn chưa đăng nhập");
    } else {
        thongbao = "Đăng xuất thành công! <br> Tạm Biệt " + nv.getHoten();
        session.invalidate();
    }
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf"><%=thongbao%></h4>
        <h4 style="color: #005cbf"><a href="dangnhapnhanvien.jsp">Đăng nhập</a></h4>
    </div>
</div>
<%@include file="Footer.html" %>

