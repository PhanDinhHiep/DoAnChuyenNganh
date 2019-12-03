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
        <h2 class="text-center hu">Danh Sách Sản Phẩm Bán chạy</h2>
        <table class="table table-striped" style="border: #495057; background-color: white;">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Mã Sản Phẩm</th>
                    <th scope="col">Tên Sản Phẩm</th>                    
                    <th scope="col">Số Lượng đã bán</th>                   
                </tr>
            </thead>
            <tbody>
                <%                                    int i = 1;
                    for (Sanpham elem : Sanpham.ArraydanhSachSanPhamBanchay()) {
                %>
                <tr>
                    <th scope="row"><%=i%></th>
                    <td class="list-group-item-primary"><a href="#"><%=elem.getMasp()%></a></td>
                    <td class="list-group-item-primary"><a href="#"><%=elem.getTensp()%></a></td>                    
                    <td class="list-group-item-primary"><%=elem.getSoluong()%></td>            
                </tr>
                <%
                        i++;
                    }
                %>
            </tbody>
        </table>
        <div class="col-md-3 mb-3">
            <button class="col-lg-12 btn btn-primary" type="button">
                <a style="color: #ffffff" href="ad_indanhsach.jsp">In danh sách</a>
            </button>
        </div>
    </div> 
</div>
</div>
</div>
<%@include file="Footer.html"%>