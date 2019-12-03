<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%
%>
<!-- /.col-lg-3 -->
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h2 class="text-center hu">Nhập Hàng</h2>

        <div class="row">
            <h4 style="color: #005cbf">Danh Sách Sản Phẩm</h4><br>

            <table id="tbdm" class="table table-striped" style="border: #495057; background-color: white;">
                <thead>  
                    <tr>
                        <th scope="col" style="color: #005cbf">STT</th>
                        <th scope="col" style="color: #005cbf">Mã Sản Phẩm</th>
                        <th scope="col" style="color: #005cbf">Tên Sản Phẩm</th>
                        <th scope="col" style="color: #005cbf">Số Lượng</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        double tong = 0;
                        Giohang ctgionhap = (Giohang) session.getAttribute("GioNhap");
                        if (ctgionhap == null) {
                            ctgionhap = new Giohang();
                        }
                        String msp = request.getParameter("masp");
                        int soluong = Integer.parseInt(request.getParameter("soluong"));
                        if (msp != null) {
                            Sanpham s = new Sanpham(Integer.parseInt(msp));
                            Monhang mh = new Monhang(s.getMasp(), s.getTensp(), s.getDongia(), soluong, s.getMabaohanh(), s.getMakhuyenmai(), s.getMausac());
                            ctgionhap.themMonHang(mh);
                            session.setAttribute("GioNhap", ctgionhap);
                        }
                        Vector<Monhang> ds = ctgionhap.getGH();

                        int i = 1;
                        for (Monhang elem : ds) {
                    %>
                    <tr>
                        <th scope="row"><%=i%></th>
                        <td class="list-group-item-primary">
                            <form method="post" action="#">
                                <input hidden="" name="msp" type="number" value="<%=elem.getMsp()%>">
                                <%=elem.getMsp()%>
                                </td>
                                <td class="list-group-item-primary"><%=elem.getTenmh()%></td>
                                <td class="list-group-item-primary">
                                    <input id="soluong" type="number" name="sl" value="<%=elem.getSoluong()%>">&nbsp;
                                    <input type="button" value="Cập nhật">&nbsp;
                            </form>
                            <button type="button"><a href="#">Xóa</a></button>
                        </td>
                    </tr>
                    <%
                            
                            i++;
                        }

                    %>
                </tbody>
            </table>
            <button type="submit" class="col-md-5 btn btn-primary btn-lg" style="margin-left: 55px;" onclick="javascript:history.go(-1)">Tiếp tục thêm hàng</button>
            <button type="reset" class="col-md-5 btn btn-primary btn-lg" style="margin-left: 55px;"><a class="btn-primary" href="ad_hoadonnhap.jsp">Nhập hàng</a></button>
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