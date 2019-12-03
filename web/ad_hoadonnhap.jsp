<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%
%>
<!-- /.col-lg-3 -->
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h2 class="text-center hu">Nhập Hàng</h2>
        <div class="row">
            <form method="POST" action="ad_nhaphangok.jsp">
                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label for="lastName">Số điện thoại</label>
                        <input type="text" class="form-control" name="sdtkh" readonly="" id="firstName" placeholder="" value="<%=nv.getSodtnv()%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Tên Nhân viên</label>
                        <input type="text" class="form-control" name="" readonly="" id="firstName" placeholder="" value="<%=nv.getHoten()%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName" style="color: red;">Số hóa đơn nhập</label>
                        <input type="number" class="form-control" name="sohoadon" id="firstName" readonly="" placeholder="" value="<%=Phieunhaphang.laySoPhieuNhapLonNhat()+1%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName" style="color: red;">Ngày nhập</label>
                        <input type="date" class="form-control" name="ngaynhap" id="firstName" placeholder="" value="" required>
                    </div>
                </div>

                <hr class="mb-4" >
                <div class="" style="">
                    <table id="tbdm" class="table" style="border: #495057; background-color: white;">
                        <thead>  
                            <tr>
                                <th scope="col" style="color: #005cbf">STT</th>

                                <th scope="col" style="color: #005cbf">Tên Sản Phẩm</th>
                                <th scope="col" style="color: #005cbf">Màu sắc</th>
                                <th scope="col" style="color: #005cbf">Số Lượng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Giohang ctgionhap = (Giohang) session.getAttribute("GioNhap");
                                //String msp = request.getParameter("masp");
                                Vector<Monhang> ds = ctgionhap.getGH();
                                int i = 1;
                                for (Monhang elem : ds) {
                            %>
                            <tr>
                                <th scope="row"><%=i%></th>

                                <td class="list-group-item-primary"><%=elem.getTenmh()%></td>
                                <td class="list-group-item-primary"><%=elem.getMausac()%></td>
                                <td class="list-group-item-primary"><%=elem.getSoluong()%></td>
                            </tr>
                            <%}%>
                        </tbody>  
                    </table>
                    <button class="col-md-5 btn btn-primary btn-lg" type="submit">Nhập hàng</button>
                </div>

            </form>
        </div>
    </div>

</div>    
<!-- /.row -->
<!-- /.col-lg-9 -->
</div>
</div>
<!-- /.row -->
<%@ include file="Footer.html" %>