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
                    <th scope="col" style="color: #005cbf">Mã bảo hành</th>
                    <th scope="col" style="color: #005cbf">Hình thức bảo hành</th>
                    <th scope="col" style="color: #005cbf">Thời gian bảo hành</th>
                    <th scope="col" style="color: #005cbf">Mô tả</th>     
                    <th scope="col" style="color: #005cbf">Thao tác</th>  
                </tr>
            </thead>
            <tbody>
                <%                    int i = 1;
                    for (Baohanh elem : Baohanh.danhSachBaoHanh()) {
                %>
                <tr>
                    <th scope="row"><%=i%></th>
                    <td class="list-group-item-primary"><%=elem.getMabaohanh()%></td>
                    <td class="list-group-item-primary"><%=elem.getHinhthucbaohanh()%></td>
                    <td class="list-group-item-primary"><%=elem.getThoigianbaohanh()%></td>
                    <td class="list-group-item-primary"><%=elem.getMota()%></td>
                    <td class="list-group-item-primary">
                        <a href="ad_capnhatbh.jsp?mbh=<%=elem.getMabaohanh()%>"><input  type="button" value="Cập nhật"></a>&nbsp;
                        <a href="ad_xoabhok.jsp?mbh=<%=elem.getMabaohanh()%>"><input  type="button" value="Xóa"></a>
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