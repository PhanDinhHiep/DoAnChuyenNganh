<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%    Giohang ctgionhap = (Giohang) session.getAttribute("GioNhap");
    Vector<Monhang> ds = ctgionhap.getGH();
    int sohd = Integer.parseInt(request.getParameter("sohoadon"));
    String ngaynhap = request.getParameter("ngaynhap");
    Phieunhaphang themdh = new Phieunhaphang();
    themdh.ThemPhieuNhap(sohd, nv.getSodtnv(), ngaynhap);
    Chitietphieunhaphang themctpn = new Chitietphieunhaphang();
    for (Monhang elem : ds) {
        themctpn.ThemCTPhieuNhap(sohd, elem.getMsp(), elem.getSoluong());
    }
    session.removeAttribute("GioNhap");
    response.sendRedirect("ad_nhaphang.jsp");
%>
<!-- /.col-lg-3 -->
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h2 class="text-center hu">Nhập hàng</h2>

        <form method="POST" action="ad_nhapgio.jsp">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="firstName">Mã sản phẩm</label>
                    <input type="number" class="form-control" name="masp"   id="firstName" placeholder=""  required>
                    <label for="firstName">Số lượng</label>
                    <input type="number" class="form-control" name="soluong"   id="firstName" placeholder=""  required>
                </div> 
            </div>
            <hr class="mb-4">
            <button class="col-md-5 btn btn-primary btn-lg" type="submit">Thêm vào danh sách</button>
            <button class="col-md-5 btn btn-primary btn-lg" type="reset">Hủy</button>
        </form>
        <hr> 
    </div> 
    <div class="container">
        <!--
        <nav aria-label="...">
            <ul class="pagination justify-content-center">
                <li class="page-item ">
                    <a class="page-link" href="admin.jsp?page=1" tabindex="-1">1</a>
                </li>
                <li class="page-item"><a class="page-link" href="admin.jsp?page=2">2</a></li>
                <li class="page-item"><a class="page-link" href="admin.jsp?page=3">3</a></li>
            </ul>
        </nav>
         <h3 style="color: #005cbf">Thống kê - Báo cáo</h3>
         <a href="#" class="list-group-item">Số sản phẩm</a>
         <a href="#" class="list-group-item">Tồng tiền</a>
         <a href="#" class="list-group-item">Category 3</a> -->  
    </div>
</div>    
<!-- /.row -->
</div>
<!-- /.col-lg-9 -->
</div>
<!-- /.row -->
<%@ include file="Footer.html" %>