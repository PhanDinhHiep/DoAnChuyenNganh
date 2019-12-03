<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String nvg = request.getParameter("nvg");
    int sodh = Integer.parseInt(request.getParameter("shd"));
    Donhang dh = new Donhang();
    String sdtnv = nvg.substring(0,10);
    String thongbao = ""; 
    boolean kq = dh.duyetDH(nv.getSodtnv(), sdtnv, sodh);
    if(kq == true){
        thongbao = "Đã duyệt đơn hàng!";
    }
    else thongbao = "Lỗi khi duyệt đơn hàng";
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Duyệt đơn hàng</h4>
        <h4 style="color: #005cbf"><% out.write(thongbao); %></h4>
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
