<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String sodtnv = request.getParameter("sdtnv");
    String tt = request.getParameter("tt");
    String trangthai = "";
    switch (tt) {
        case "Đang làm":
            trangthai = "Y";
            break;
        case "Tạm nghỉ làm":
            trangthai = "TN";
            break;
        case "Nghỉ làm":
            trangthai = "N";
            break;
        default:
            trangthai = "Y";
    }
    String thongbao = "";
    Nhanvien s = new Nhanvien();
    
    boolean kq = s.capnhatTTNV(sodtnv, trangthai);
    if (kq == true) {
        thongbao = "Thành công!!!";
    } else {
        thongbao = "Có lỗi khi cập nhật. vui lòng kiểm tra lại!!!";
    }
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Cập nhật thông tin nhân viên</h4>
        <h4 style="color: #005cbf"><%out.write(thongbao);%></h4>
        <!--<h4 style="color: #005cbf"><%out.write("");%></h4>-->
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
