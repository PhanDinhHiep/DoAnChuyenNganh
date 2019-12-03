<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String madanhmuc = request.getParameter("in_mdm");
    String tendanhmuc = request.getParameter("in_tdm");
    Danhmuc md = new Danhmuc();
    String thongbao = "a";
    boolean kq = md.insertDanhmuc(madanhmuc, tendanhmuc);
    if (kq == true) {
        thongbao = "Thêm danh mục sản phẩm thành công!";
    } else {
        thongbao = "Thêm danh mục sản thất bại, vui lòng kiểm tra lại thông tin!!!";
    }
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Thêm Mới Danh Mục Sản Phẩm</h4>
        <h4 style="color: #005cbf"><% out.write(thongbao);%></h4>
        <hr>
    </div>
    <hr>
    <table id="tbdm" class="table table-striped" style="border: #495057; background-color: white;">
        <thead>  
            <tr>
                <th scope="col" style="color: #005cbf">STT</th>
                <th scope="col" style="color: #005cbf">Mã Danh mục </th>
                <th scope="col" style="color: #005cbf">Tên Danh Mục </th>
                <th scope="col" style="color: #005cbf">Thao tác</th>       
            </tr>
        </thead>
        <tbody>
            <%                    int i = 1;
                for (Danhmuc elem : Danhmuc.LayDanhMuc()) {
            %>
            <tr>
                <th scope="row"><%=i%></th>
                <td class="list-group-item-primary"><%=elem.getMadanhmuc()%></td>
                <td class="list-group-item-primary"><%=elem.getTendanhmuc()%></td>
                <td class="list-group-item-primary"><a href="capnhatDanhMuc.jsp?mdm=<%=elem.getMadanhmuc()%>&tdm=<%=elem.getTendanhmuc()%>"><input id="chon" type="button" value="Cập nhật"></a></td>
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
<%@include file="Footer.html" %>
