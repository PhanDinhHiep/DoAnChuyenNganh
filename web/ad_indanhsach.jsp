<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%  
    ArrayList<Sanpham> dsmh = Sanpham.ArraydanhSachSanPhamBanchay();
    file.GhiDSBC("SPBC", dsmh);
    
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Thông Báo</h4>
        <h4 style="color: #005cbf"><% out.write("Đã in danh sách");%></h4>
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
