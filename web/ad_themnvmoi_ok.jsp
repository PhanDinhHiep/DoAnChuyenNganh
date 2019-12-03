<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String sodtnv = request.getParameter("sdtnv");
    String hoten = request.getParameter("tnv");
    String mail = request.getParameter("email");
    String ngaysinh = request.getParameter("ngaysinh");
    String gioitinh = request.getParameter("gioitinh");
    String chucvu = request.getParameter("chucvu");
    String diachi = request.getParameter("diachi");
    String matkhau = request.getParameter("mk");
    String thongbao = "";
    String quyen = "NULL";
    for (Chucvu elem : Chucvu.danhsachChuVu()) {
        if (chucvu.equals(elem.getTencv())) {
            quyen = elem.getMacv();
        } 
    }
    Nhanvien s = new Nhanvien();
    boolean kq = s.insertNhanVien(sodtnv, hoten, ngaysinh, gioitinh, diachi, mail, quyen, matkhau);
    if(kq == true){
        thongbao = "Thành công cmnr Ahihihi!!!";
    }
    else{
    thongbao = "Có lỗi khi thêm nhân viên mới. vui lòng kiểm tra lại!!!";
    }
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Thêm Nhân Viên</h4>
        <h4 style="color: #005cbf"><%out.write(thongbao);%></h4>
        <!--<h4 style="color: #005cbf"><%out.write(sodtnv+ hoten+ ngaysinh+ gioitinh+ diachi+ mail+ quyen+ matkhau);%></h4>-->
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
