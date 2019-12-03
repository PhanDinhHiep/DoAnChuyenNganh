<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Thêm Mới Danh Mục Sản Phẩm</h4>
        <form method="post" action="themDanhMucSP_xemthongtin.jsp">
            <div class="form-group">
                <label style="color: #005cbf">Mã Danh Mục</label>
                <input type="text" class="form-control" id="inmadm" required="ahii" name="in_madanhmuc" placeholder="Nhập mã danh mục, mã danh mục ít hơn hoặc bằng 5 ký tự">
            </div>
            <div class="form-group">
                <label style="color: #005cbf">Tên Danh Mục</label>
                <input type="text" class="form-control" id="intendm" name="in_tendanhmuc" placeholder="Nhập tên danh mục">
            </div>
            <button type="submit" class="btn btn-primary">Thêm</button>
            <button type="reset" class="btn btn-primary">Hủy</button>
        </form>
        <hr>
        <h4 style="color: #005cbf">Cập Nhật Danh Mục Sản Phẩm</h4>
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
</div>
<%@include file="Footer.html" %>
<script type="text/javascript">
    $('#chon').click(function () {
        alert("Chọn");
    });
</script>