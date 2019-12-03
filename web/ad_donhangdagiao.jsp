<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%   
    
    
%>
<!-- /.col-lg-3 -->
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Đơn hàng đang đã giao</h4>
        <table class="table table-striped" style="border: #495057; background-color: white;">
            <thead>
                <tr>
                    
                    <th scope="col">Số hóa đơn</th>
                    <th scope="col">Ngày đặt</th>
                    <th scope="col">Khách hàng</th>
                    <th scope="col">Tổng tiền</th>
                    <th scope="col">Trạng thái</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    int trang = 0, dau = 0, cuoi = 0;
                    int tam = 0;
                    if (request.getParameter("trang") != null) {
                        trang = Integer.parseInt(request.getParameter("trang"));
                    }

                    int tong = Donhang.layDonHangDaGiao().size();
                    if (tong <= 9) {
                        dau = 0;
                        cuoi = tong;
                    } else {
                        dau = (trang - 1) * 9;
                        tam = dau + 9;
                        if (tam >= tong) {
                            tam = tong;
                        }
                        cuoi = tam;
                    }
                    ArrayList<Donhang> kq = new ArrayList();
                    for (int i = dau; i < cuoi; i++) {
                        kq.add(Donhang.layDonHangDaGiao().get(i));
                    }
                    for (Donhang s : kq) {
                %>
                <tr>         
                    <td class="list-group-item-primary"><a href="ad_chitietdonhangdxl.jsp?shd=<%=s.getSodonhang()%>"><%=s.getSodonhang()%></a></td>
                    <td class="list-group-item-primary"><%=s.getNgaydat()%></td>
                    <td class="list-group-item-primary"><%=s.getKhachhang()%></td>
                    <td class="list-group-item-primary"><%=FotmatSo.fm(s.getTongtien())%></td>
                    <td class="list-group-item-primary"><%=s.getTrangthaidonhang()%></td>
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
                <%
                    for (int j = 1; j <= (tong / 10) + 1; j++) {
                %>
                <li class="page-item"><a class="page-link" href="admin_donhangmoi.jsp?trang=<%=j%>"><%=j%></a></li>

                <%}%>
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