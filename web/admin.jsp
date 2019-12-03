<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%   
    String trang = request.getParameter("page");
    if (trang == null) {
        trang = "1";
    }
    DecimalFormat formatter = new DecimalFormat("###,###,###");
%>
<!-- /.col-lg-3 -->
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Đơn hàng mới</h4>
        <table class="table table-striped" style="border: #495057; background-color: white;">
            <thead>
                <tr>
                    <th scope="col">Đơn Hàng Mới</th>
                    <th scope="col">Đơn Hàng Đang Xử Lí</th>
                    <th scope="col">Đơn Hàng Đã Giao</th>
                    <th scope="col">Sản Phẩm Hết Hàng</th>
                </tr>
            </thead>
            <tbody>          
                <tr>    
                    <td class="list-group-item-primary"><a href="#"><%=Donhang.layDonHangMoi().size()%></a></td>
                    <td class="list-group-item-primary"><a href="#"><%=Donhang.layDonHangDangXuLy().size()%></a></td>
                    <td class="list-group-item-primary"><a href="#"><%=Donhang.layDonHangDaGiao().size()%></a></td>
                    <td class="list-group-item-primary"><%=0%></td>
                    
                </tr>
                
            </tbody>
        </table>
    </div> 
    <h6 style="color: #005cbf">Trang <%=trang%></h6> 
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