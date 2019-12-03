<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Danh sách nhân viên</h4>   
        <table id="tbdm" class="table table-striped" style="border: #495057; background-color: white;">
            <thead>  
                <tr>
                    <th scope="col" style="color: #005cbf">STT</th>
                    <th scope="col" style="color: #005cbf">Số điện thoại </th>
                    <th scope="col" style="color: #005cbf">Quyền </th>
                    <th scope="col" style="color: #005cbf">Họ tên</th>
                    <th scope="col" style="color: #005cbf">Giới tính</th>
                    <th scope="col" style="color: #005cbf">Trạng thái</th>
                    
                </tr>
            </thead>
            <tbody>
                <%                    int i = 1;
                    for (Nhanvien elem : Nhanvien.danhsachNhanVien()) {
                %>
                <tr>
                    <th scope="row"><%=i%></th>
                    <td class="list-group-item-primary"><%=elem.getSodtnv()%></td>
                    <td class="list-group-item-primary"><%=elem.getMaquyen()%></td>
                    <td class="list-group-item-primary"><%=elem.getHoten()%></td>
                    <td class="list-group-item-primary"><%=elem.getGioitinh()%></td>
                    <td class="list-group-item-primary"><%=elem.getTrangthai()%></td>     
                    
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