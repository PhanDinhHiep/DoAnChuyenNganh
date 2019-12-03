<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Danh sách chương trình khuyến mãi</h4>   
        <table id="tbdm" class="table table-striped" style="border: #495057; background-color: white;">
            <thead>  
                <tr>
                    <th scope="col" style="color: #005cbf">STT</th>
                    <th scope="col" style="color: #005cbf">Mã khuyến mãi</th>
                    <th scope="col" style="color: #005cbf">Hình thức</th>
                    <th scope="col" style="color: #005cbf">Ngày bắt đầu</th>
                    <th scope="col" style="color: #005cbf">Ngày kết thúc</th>     
                    <th scope="col" style="color: #005cbf">Thao tác</th>  
                </tr>
            </thead>
            <tbody>
                <%                    int i = 1;
                    for (Khuyenmai elem : Khuyenmai.danhSachKhuyenmai()) {
                %>
                <tr>
                    <th scope="row"><%=i%></th>
                    <td class="list-group-item-primary"><%=elem.getMakhuyenmai()%></td>
                    <td class="list-group-item-primary"><%=elem.getHinhthuckhuyenmai()%></td>
                    <td class="list-group-item-primary"><%=elem.getNgaybatdau()%></td>
                    <td class="list-group-item-primary"><%=elem.getNgayketthuc()%></td>
                       
                    <td class="list-group-item-primary">
                        <a href="ad_capnhatkm.jsp?mkm=<%=elem.getMakhuyenmai()%>"><input  type="button" value="Cập nhật"></a>&nbsp;
                        <a href="ad_xoakmok.jsp?mkm=<%=elem.getMakhuyenmai()%>"><input  type="button" value="Xóa"></a>
                    </td>
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