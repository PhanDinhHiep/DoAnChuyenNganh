<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h2 class="text-center hu">Cập Nhật Giá Bán</h2>
        <h4 style="color: #005cbf">Nhập thông tin cần cập nhật</h4>
        <form method="POST" action="capnhatgiaok.jsp">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="firstName">Mã sản phẩm</label>
                    <input type="number" class="form-control" name="msp"   id="firstName" placeholder=""  required>
                    <label for="firstName">Giá bán</label>
                    <input type="number" class="form-control" name="giamoi"   id="firstName" placeholder=""  required>
                </div> 
            </div>
            <hr class="mb-4">
            <button class="col-md-5 btn btn-primary btn-lg" type="submit">Cập nhật</button>
        </form>
        <hr>
        <div>
            <h2 class="text-center hu">Danh Sách Sản Phẩm</h2>

            <table class="table table-striped" style="border: #495057; background-color: white;">
                <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã Sản Phẩm</th>
                        <th scope="col">Tên Sản Phẩm</th>
                        <th scope="col">Đơn Giá</th>
                        <th scope="col">Giá mới</th>
                        <th scope="col">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <%                                    int i = 1;
                        for (Sanpham elem : Sanpham.danhSachSanPham()) {
                    %>
                    <tr>
                        <th scope="row"><%=i%></th>
                        <td class="list-group-item-primary"><a href="#"><%=elem.getMasp()%></a></td>
                        <td class="list-group-item-primary"><a href="#"><%=elem.getTensp()%></a></td>
                        <td class="list-group-item-primary"><%=FotmatSo.fm(elem.getDongia())%></td>
                <form action="capnhatgiaok.jsp" method="post">
                        <td class="list-group-item-primary">
                            <input type="number" name="msp" value="<%=elem.getMasp()%>" hidden="">
                            <input type="number" name="giamoi">
                        </td>
                        <td class="list-group-item-primary"><a href=""><input id="chon" type="submit" value="Cập nhật"></a></td>
                </form>
                    </tr>
                    <%
                            i++;
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>
</div>
<%@include file="Footer.html" %>