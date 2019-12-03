<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String mlsp = request.getParameter("in_maloaisp");
    String tlsp = request.getParameter("in_tenloaisp");
    String mdm = request.getParameter("in_madm");
    String m = "ahihi";
    String thongbao = "";
    for (Danhmuc elem : Danhmuc.LayDanhMucArray()) {
        if (mdm.equals(elem.getTendanhmuc())) {
            m = elem.getMadanhmuc();
        }
    }
    Loaisanpham lsp = new Loaisanpham();
    int kq = lsp.insertLDMSP(m, mlsp, tlsp);
    if(kq == 1){
        thongbao = "Thêm loại sản phẩm thành công!!!";
    }
    else thongbao = "Thất bại! vui lòng kiểm tra lại thông tin!!!";
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Thêm Loại Sản Phẩm</h4>
        <h4 style="color: #005cbf"><% out.write(thongbao);%></h4>
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
