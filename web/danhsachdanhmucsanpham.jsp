<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Danh Sách Danh Mục Sản Phẩm</h4>
        <hr>
        <table id="tbdm" class="table table-striped" style="border: #495057; background-color: white;">
            <thead>  
                <tr>
                    <th scope="col" style="color: #005cbf">STT</th>
                    <th scope="col" style="color: #005cbf">Mã Danh mục </th>
                    <th scope="col" style="color: #005cbf">Tên Danh Mục </th>
                       
                </tr>
            </thead>
            <tbody>
                <%                    int i = 1;
                    for (Danhmuc elem : Danhmuc.LayDanhMuc()) {
                %>
                <tr>
                    <th scope="row"><%=i%></th>
                    <td class="list-group-item-success"><%=elem.getMadanhmuc()%></td>
                    <td class="list-group-item-success"><%=elem.getTendanhmuc()%></td>
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
<%@include file="Footer.html" %>