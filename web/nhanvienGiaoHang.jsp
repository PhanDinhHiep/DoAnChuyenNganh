<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menunvgh.jsp" %>
<%ArrayList<Donhang> dh = Donhang.layDonHangDuocGiao(nv.getSodtnv());%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Có <%=dh.size()%> đơn hàng được giao</h4>
        <h4 style="color: #005cbf">Danh sách đơn hàng được giao</h4>
        <table class="table table-striped" style="border: #495057; background-color: white;">
            <thead>
                <tr>
                    <th scope="col" style="color: #005cbf">STT</th>
                    <th scope="col" style="color: #005cbf">Số Đơn hàng</th>
                    <th scope="col" style="color: #005cbf">Khách hàng</th>
                    <th scope="col" style="color: #005cbf">Ngày mua hàng</th>
                    <th scope="col" style="color: #005cbf">Tổng tiền</th>
                </tr>
            </thead>
            <tbody>
                <%
                    
                    int i = 1;
                    for (Donhang elem : dh) {
                %>
                <tr>                   
                    <th scope="row"><%=i%></th>
                    <td class="list-group-item-primary"><a href="ad_chitietdonhanggh.jsp?shd=<%=elem.getSodonhang()%>"><%=elem.getSodonhang()%></a></td>
                    <td class="list-group-item-primary"><%=Khachhang.laytenkh(elem.getKhachhang())+" - "+elem.getKhachhang()%></td>           
                    <td class="list-group-item-primary"><%=elem.getNgaydat()%></td>
                    <td class="list-group-item-primary"><%=FotmatSo.fm(elem.getTongtien())%></td>              
                
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div> 
    
    <div class="container">
        <nav aria-label="...">
            <ul class="pagination justify-content-center">
                <li class="page-item ">
                    <a class="page-link" href="admin.jsp?page=1" tabindex="-1">1</a>
                </li>
                <li class="page-item"><a class="page-link" href="admin.jsp?page=2">2</a></li>
                <li class="page-item"><a class="page-link" href="admin.jsp?page=3">3</a></li>
            </ul>
        </nav>
        <!-- <h3 style="color: #005cbf">Thống kê - Báo cáo</h3>
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