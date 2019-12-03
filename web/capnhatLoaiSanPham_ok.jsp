<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String malsp = request.getParameter("in_mlsp");
    String tenlsp = request.getParameter("in_tlsp");
    String thongbao = "";
    Loaisanpham lsp = new Loaisanpham();
    boolean kq = lsp.updateLoaiSanPham(malsp, tenlsp);
    if(kq == true){
        thongbao = "Cập nhật danh mục sản phẩm thành công!";
    }
    else thongbao = "Thất bại";
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Cập Nhật Danh Mục Sản Phẩm</h4>
        <h4 style="color: #005cbf"><% out.write(thongbao); %></h4>
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
