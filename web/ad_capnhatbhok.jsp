<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String mbh = request.getParameter("mbh");
    String htbh = request.getParameter("ht");
    int tg = Integer.parseInt(request.getParameter("tg"));
    
    String mota = request.getParameter("mota");
  
    String thongbao = "";
    Baohanh cn= new Baohanh();
    boolean kq = cn.capnhatBaoHanh(mbh, htbh, tg, mota);
    if(kq == true){
        thongbao = "ok cmnr";
        response.sendRedirect("ad_danhsachbh.jsp");
    }else{
        thongbao ="Tạch cmnr"; 
    }
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Thêm Khuyến Mãi</h4>
        <h4 style="color: #005cbf"><% out.write(thongbao);%></h4>
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
