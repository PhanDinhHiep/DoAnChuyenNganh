<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loikh.jsp" %>
<%@include file="header.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    Giohang ctgiohang = (Giohang) session.getAttribute("GioHang");
    Vector<Monhang> ds = ctgiohang.getGH();
    String sdtkh = request.getParameter("sdtkh");
    String diachigiao = request.getParameter("diachigiao");
    String mathanhtoan = Hinhthucthanhtoan.laymaHHTTT(request.getParameter("httt"));
    String ghichu = request.getParameter("ghichu");
    String trangthaidonhang = "Mới đặt hàng";
    if (ghichu == "") {
        ghichu = "NULL";
    }
    double tongtien = ctgiohang.tinhTongtien() - ctgiohang.tinhKhuyenMai();

    int sohoadon = Donhang.laySoDonHangLonNhat() + 1;
    Donhang dh = new Donhang();
    boolean kq = dh.insertDonHang(sohoadon, sdtkh, mathanhtoan, diachigiao, ghichu, trangthaidonhang);
    Chitietdonhang ct = new Chitietdonhang();
    for (Monhang elem : ds) {
        ct.insertChiTietDonHang(sohoadon, elem.getMsp(), elem.getDongia() - (elem.getDongia() * Khuyenmai.layTiengiam(elem.getMakhuyenmai()))/100, elem.getSoluong(), ghichu, elem.getMakhuyenmai());
    }
    String thongbao = "Đã xảy ra lỗi, vui lòng thực hiện lại!!!";
    if (kq == true) {
        thongbao = "Đặt hàng thành công!!!";
    }
    session.removeAttribute("GioHang");
%>
<div class="row" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Thông tin đặt hàng</h4>
        <h4 style="color: #005cbf"><%=thongbao%></h4>
        <h4 style="color: #005cbf"><a href="ad_thongtinkh.jsp">Về trang cá nhân để theo dỏi đơn hàng!!!</a></h4>
        <hr>
        <!--
        <h4 style="color: #005cbf"><%=sdtkh%></h4>
        <hr>
        <h4 style="color: #005cbf"><%=diachigiao%></h4>
        <hr>
        <h4 style="color: #005cbf"><%=mathanhtoan%></h4>
        <hr>
        <h4 style="color: #005cbf"><%=ghichu%></h4>
        <h4 style="color: #005cbf"><%=sohoadon%></h4>
        <h4 style="color: #005cbf"><%=tongtien%></h4>
        -->
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
