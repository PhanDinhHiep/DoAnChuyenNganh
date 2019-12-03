<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loikh.jsp" %>
<%@include file="header.jsp" %>
<%    if (khdn.getHoten() == null) {
        response.sendRedirect("dangnhap.jsp");
    }
%>
<!-- /.col-lg-3 -->
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<%@include file="menukh.html" %>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">

    <h2 class="text-center hu">Đơn hàng mới đặt</h2>

    <table class="table table-striped" style="border: #495057; background-color: white;">
        <thead>
            <tr>
                <th scope="col" >STT</th>
                <th scope="col" >Số hóa đơn</th>                       
                <th scope="col" >Ngày đặt</th>
                <th scope="col" >Địa chỉ giao</th>
                <th scope="col" >Tổng tiền</th>
                <th scope="col" >Trạng thái đơn hàng</th>
                 <th scope="col" >Tác vụ</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<Donhang> dsdh = Donhang.layDonHangMoidat(khdn.getSdtkh());
                int i = 1;
                for (Donhang elem : dsdh) {
            %>
            <tr>
                <th scope="row"><%=i%></th>
                <td class="list-group-item-primary"><a href="thongtin_chitietdonhang.jsp?shd=<%=elem.getSodonhang()%>"><%=elem.getSodonhang()%></a> </td>
                <td class="list-group-item-heading" style="width:150px;"><%=elem.getNgaydat()%></td>
                <td class="list-group-item-primary"><%=elem.getDiachigiao()%></td>
                <td class="list-group-item-primary"><%=FotmatSo.fm(elem.getTongtien())%></td>
                <td class="list-group-item-danger"><%=elem.getTrangthaidonhang()%></td>
                <td class="list-group-item-danger"><a href="thongtin_huydonhang.jsp?shd=<%=elem.getSodonhang()%>"><button>Hủy đơn</button></a></td>
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
<%@ include file="Footer.html" %>