<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp"%>
<%@include file="Header.html" %>
<%
   String sdt = request.getParameter("sdt");
   String matkhau = request.getParameter("mk");
   Nhanvien nv = Nhanvien.dangNhap(sdt, matkhau);
   String loi="";
   if(nv != null && nv.getMaquyen().equals("admin")){
       response.sendRedirect("admin.jsp");
       session.setAttribute("USER",nv);
   }
   else if(nv != null && nv.getMaquyen().equals("NVGH")){
       response.sendRedirect("nhanvienGiaoHang.jsp");
       session.setAttribute("USER",nv);
   }
   else{
       loi = "Lỗi Đăng nhập!";
       throw new Exception(loi);
   }
%>
<div style="padding-top: 70px;">
    <h4><%=loi%></h4>
</div>
<%@include file="Footer.html" %>
