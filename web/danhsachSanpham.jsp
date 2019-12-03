<%@page import="java.util.Vector"%>
<%@page import="model.*" contentType="text/html" pageEncoding="utf-8" errorPage="loi.jsp"%>
<%@include file="menuadmin.jsp"%>
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center hu">Danh Sách Sản Phẩm</h2>

        <table class="table table-striped" style="border: #495057; background-color: white;">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Mã Sản Phẩm</th>
                    <th scope="col">Tên Sản Phẩm</th>
                    <th scope="col">Đơn Giá</th>
                    <th scope="col">Số Lượng</th>
                    <th scope="col">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <%                    
                    int trang = 0, dau = 0, cuoi = 0;
                    int tam =0; 
                    if (request.getParameter("trang") != null) {
                        trang = Integer.parseInt(request.getParameter("trang"));
                    }

                    int tong = Sanpham.danhSachSanPham().size();
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
                    Vector<Sanpham> kq = new Vector();
                    for (int s = dau; s < cuoi; s++) {
                        kq.add(Sanpham.danhSachSanPham().get(s));
                    }
                    int i = 1;
                    for (Sanpham elem : kq) {
                %>
                <tr>
                    <th scope="row"><%=i%></th>
                    <td class="list-group-item-primary"><a href="#"><%=elem.getMasp()%></a></td>
                    <td class="list-group-item-primary"><a href="#"><%=elem.getTensp()%></a></td>
                    <td class="list-group-item-primary"><%=FotmatSo.fm(elem.getDongia())%></td>
                    <td class="list-group-item-primary"><%=elem.getSoluong()%></td>
                    <td class="list-group-item-primary"><a href="capnhatthongtinsanpham.jsp?msp=<%=elem.getMasp()%>"><input id="chon" type="button" value="Cập nhật"></a></td>
                </tr>
                <%
                        i++;
                    }
                %>
            </tbody>
        </table>
        <nav aria-label="...">
            <ul class="pagination justify-content-center">                
                <%
                    for (int j = 1; j <= (tong / 10) + 1; j++) {
                %>
                <li class="page-item"><a class="page-link" href="danhsachSanpham.jsp?trang=<%=j%>"><%=j%></a></li>
                
                    <%}%>
            </ul>
        </nav>
    </div> 
</div>
</div>
</div>
<%@include file="Footer.html"%>