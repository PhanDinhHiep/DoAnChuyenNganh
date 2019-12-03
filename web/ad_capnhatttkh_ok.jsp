<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String sodtnv = request.getParameter("sdtkh");
    String tt = request.getParameter("tt");
    String trangthai = "";
    switch (tt) {
        case "VIP":
            trangthai = "V";
            break;
        case "Bình thường":
            trangthai = "Y";
            break;
        default:
            trangthai = "Y";
    }
    String thongbao = "";
    Nhanvien s = new Nhanvien(); 
    boolean kq = s.capnhatTTKH(sodtnv, trangthai);
    if (kq == true) {
        thongbao = "Thành công!!!";
    } else {
        thongbao = "Có lỗi khi cập nhật. vui lòng kiểm tra lại!!!";
    }
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Cập nhật trạng thái khách hàng</h4>
        <h4 style="color: #005cbf"><%out.write(thongbao);%></h4>
        <!--<h4 style="color: #005cbf"><%out.write("");%></h4>-->
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
