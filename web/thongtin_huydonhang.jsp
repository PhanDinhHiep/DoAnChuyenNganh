<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loikh.jsp" %>
<%@include file="header.jsp" %>
<%    if (khdn.getHoten() == null) {
        response.sendRedirect("dangnhap.jsp");
    }
    int Sohd = Integer.parseInt(request.getParameter("shd"));
    String diachi = Donhang.laySoDiachigiao(Sohd, khdn.getSdtkh());
    if (diachi == "") {
        throw new Exception("Lỗi từ phía khách hàng!!!");
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
    <div class="container">
        <h2 class="text-center hu">Hủy đơn hàng</h2>
        <div class="container" style="margin: auto">
            <div class="col-md-auto order-md-1">  
                <form method="post" action="thongtin_huydonhangok.jsp">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">Số Hóa Đơn</label>
                        <input type="text" class="form-control" name="shd" readonly=""  id="firstName" placeholder="" value="<%=Sohd%>" required>

                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Tên khách hàng</label>
                        <input type="text" class="form-control" name="msp" readonly=""  id="firstName" placeholder="" value="<%=khdn.getHoten()%>" required>
                    </div>                   
                </div>
                <hr>
                
                    <div class="form-group shadow-textarea">
                        <label for="exampleFormControlTextarea6">Lý do hủy đơn hàng của bạn là gì?</label>
                        <textarea class="form-control z-depth-1" name="lydohuy" id="ckeditor1" rows="5" placeholder="Nhập lý do hủy đơn hàng!!!" required=""></textarea>
                    </div>  
                    <h5 class="text-center hu">Chi tiết đơn hàng</h5>
                    <table class="table table-striped" style="border: #495057; background-color: white;">
                        <thead>
                            <tr>
                                <th scope="col" style="color: #005cbf">STT</th>

                                <th scope="col" style="color: #005cbf">Tên Sản Phẩm</th>
                                <th scope="col" style="color: #005cbf">Màu sắc</th>
                                <th scope="col" style="color: #005cbf">Số Lượng</th>
                                <th scope="col" style="color: #005cbf">Đơn giá</th>

                                <th scope="col" style="color: #005cbf">Bảo hành</th>
                                <th scope="col" style="color: #005cbf">Khuyến mãi</th>
                                <th scope="col" style="color: #005cbf">Thành tiền</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Monhang> dsdh = Chitietdonhang.laychitietDonHang(Sohd);
                                int i = 1;
                                for (Monhang elem : dsdh) {
                            %>
                            <tr>
                                <th scope="row"><%=i%></th>
                                <td class="list-group-item-primary"><%=elem.getTenmh()%></td>
                                <td class="list-group-item-primary"><%=elem.getMausac()%></td>
                                <td class="list-group-item-primary"><%=elem.getSoluong()%></td>
                                <td class="list-group-item-primary"><%=FotmatSo.fm(elem.getDongia())%></td>
                                <td class="list-group-item-primary"><%=Baohanh.layTenBH(elem.getMabaohanh())%></td>
                                <td class="list-group-item-primary"><%=Khuyenmai.layTenKM(elem.getMakhuyenmai())%></td>
                                <td class="list-group-item-primary"><%=FotmatSo.fm(elem.getDongia() * elem.getSoluong()-((elem.getDongia()*Khuyenmai.layTiengiam(elem.getMakhuyenmai()))/100)*elem.getSoluong())%></td>              
                            </tr>
                            <%
                                    i++;
                                }
                            %>
                        </tbody>
                    </table>
                    <button class="col-md-5 btn btn-primary btn-lg" type="submit">Hủy đơn</button>
                    <button class="col-md-5 btn btn-primary btn-lg" type="reset" onclick="javascpipt:history.go(-1)">Trở lại</button>
                </form>
            </div>
        </div>
    </div>
</div>
</div>    
</div>
<%@ include file="Footer.html" %>