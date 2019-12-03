<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<%@include file="header.jsp" %>
<% request.setCharacterEncoding("utf-8");%>
<h2 style="padding-top: 60px; margin-left: 100px; color: #005cbf"> Lỗi Rồi <br>Vui lòng kiểm tra lại thông tin đăng nhập!<br>
    <%=exception.getMessage()%> <br>
    Click vào đây để trở lại <A HREF="javascript:history.go(-1)">trở lại.</A><br>
    Click vào đây để đăng nhập <A HREF="dangnhapnhanvien.jsp">Đến trang đăng nhập.</A> </h2>
<%@include file="Footer.html"%>

