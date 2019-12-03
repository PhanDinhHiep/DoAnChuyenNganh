<%@page import="java.util.Vector"%>
<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8" errorPage="loikh.jsp"%>
<%@include file="header.jsp" %>
<%  
    request.setCharacterEncoding("utf-8");
    String ten = request.getParameter("ten");
    String mail = request.getParameter("mail");
    String ns = request.getParameter("ngaysinh");
    String gt = request.getParameter("gioitinh");
    String dc = request.getParameter("diachi");
    boolean kq = false;
    Khachhang cp = new Khachhang();
    kq = cp.capnhatKH(khdn.getSdtkh(),mail,ten,ns,gt,dc);
    String loi = "Không thành công";
    if(kq == true){
       loi="Đã gửi thông tin cập nhật.";
    }
    
%>
<%@include file="menukh.html" %>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center"><%=loi%></h2> 
        <h2 class="text-center"></h2>
    </div>
</div>
</div>    
</div>
<%@include file="Footer.html" %>
