<%@page import="java.util.Vector"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.L2D"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Thêm Mới Loại Sản Phẩm</h4>
        <form method="post" action="themLoaiSP_xemthongtin.jsp"> 
            <div class="form-group">
                <label style="color: #005cbf;">Mã Danh Mục Sản Phẩm</label>
                <select class="form-control" name="in_madm">
                    <optgroup  label="Chọn Danh Mục" >
                        <%
                            Vector<Danhmuc> v = Danhmuc.LayDanhMuc();
                            for (int i = 0; i < v.size(); i++) {
                        %>
                        <option><%=v.elementAt(i)%> </option>
                        <%
                            }
                        %>
                    </optgroup>            
                </select>
            </div>
            <div class="form-group">
                <label style="color: #005cbf;">Mã Loại Sản Phẩm</label>
                <input type="text" class="form-control" id="inmadm" required="ahii" name="in_maloaisp" placeholder="Nhập mã loại sản phẩm, mã danh mục ít hơn hoặc bằng 10 ký tự">
            </div>
            <div class="form-group">
                <label style="color: #005cbf">Tên Loại Sản Phẩm</label>
                <input type="text" class="form-control" id="intendm" name="in_tenloaisp" placeholder="Nhập tên danh mục">
            </div>
            <button type="submit" class="btn btn-primary">Thêm</button>
            <button type="reset" class="btn btn-primary">Hủy</button>
        </form>
        <hr>
        <h4 style="color: #005cbf">Cập Loại Sản Phẩm</h4>
        <table id="tbdm" class="table table-striped" style="border: #495057; background-color: white;">
            <thead>  
                <tr>
                    <th scope="col" style="color: #005cbf">STT</th>
                    <th scope="col" style="color: #005cbf">Mã Danh mục </th>
                    <th scope="col" style="color: #005cbf">Mã Loại Sản Phẩm </th>
                    <th scope="col" style="color: #005cbf">Tên Loại Sản Phẩm </th>
                    <th scope="col" style="color: #005cbf">Thao tác</th>       
                </tr>
            </thead>
            <tbody>
                <%                    int i = 1;
                    for (Loaisanpham elem : Loaisanpham.layDanhSachLSP()) {
                %>
                <tr>
                    <th scope="row"><%=i%></th>
                    <td class="list-group-item-danger"><%=elem.getMaDanhmuc()%></td>
                    <td class="list-group-item-danger"><%=elem.getMaLoaisanpham()%></td>
                    <td class="list-group-item-danger"><%=elem.getTenLoaisanpham()%></td>
                    <td class="list-group-item-danger"><a href="capnhatLoaiSanPham.jsp?mlsp=<%=elem.getMaLoaisanpham()%>&tlsp=<%=elem.getTenLoaisanpham()%>"><input id="chon" type="button" value="Cập nhật"></a></td>
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