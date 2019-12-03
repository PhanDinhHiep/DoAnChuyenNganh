<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loikh.jsp" %>
<%@include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<%    if (khdn.getHoten() == null) {
        response.sendRedirect("dangnhap.jsp");
    }
    int Sohd = Integer.parseInt(request.getParameter("shd"));
    String diachi = Donhang.laySoDiachigiao(Sohd, khdn.getSdtkh());
    if (diachi == "") {
        throw new Exception("Lỗi từ phía khách hàng!!!");
    }
    String lydo = request.getParameter("lydohuy");
    Donhang hdh = new Donhang();
    boolean kqhuy = hdh.huyDonHang(Sohd, lydo);
    hdh.XoaCTDH(Sohd);
    hdh.XoaDH(Sohd);
    String thongbao = "Không thể hủy đơn hàng";
    if(kqhuy==true){
        thongbao = "Hủy đơn hàng thành công!!!";
    }
%>
<!-- /.col-lg-3 -->
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<%@include file="menukh.html" %>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center hu">Hủy đơn hàng</h2>
        <h2 class="text-center hu"><%=thongbao%></h2>
    </div>
</div>
</div>    
</div>
<%@ include file="Footer.html" %>