<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<style type="text/css">
    .hiep:hover{
        color: white;
        background-color: #007bff;
    }
</style>
<div class="container" style="padding-top: 30px;">
    <%        String lable = "";
        if (khdn.getHoten() == null) {
            lable = "Vui lòng đăng nhập để thanh toán!!!";
        }
        DecimalFormat formatter = new DecimalFormat("###,###,###");

    %>
    <label style="color: red;"><%=lable%></label>    
    <div class="jumbotron">
        <div class="row">
            <h4 style="color: #005cbf">Chi tiết giỏ hàng</h4><br>

            <table id="tbdm" class="table table-striped" style="border: #495057; background-color: white;">
                <thead>  
                    <tr>
                        <th scope="col" style="color: #005cbf">STT</th>
                        <th scope="col" style="color: #005cbf">Mã Sản Phẩm</th>
                        <th scope="col" style="color: #005cbf">Tên Sản Phẩm</th>
                        <th scope="col" style="color: #005cbf">Số Lượng</th>
                        <th scope="col" style="color: #005cbf">Đơn giá</th>
                        <th scope="col" style="color: #005cbf">Khuyến mãi</th>
                        <th scope="col" style="color: #005cbf">Thành tiền</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        double tong =0;
                        Giohang ctgiohang = (Giohang) session.getAttribute("GioHang");
                        if (ctgiohang == null) {
                            ctgiohang = new Giohang();
                        }
                        String msp = request.getParameter("masp");
                        if (msp != null) {
                            Sanpham s = new Sanpham(Integer.parseInt(msp));
                            Monhang mh = new Monhang(s.getMasp(), s.getTensp(), s.getDongia(), 1, s.getMabaohanh(), s.getMakhuyenmai(), s.getMausac());
                            ctgiohang.themMonHang(mh);
                            session.setAttribute("GioHang", ctgiohang);
                        }
                        Vector<Monhang> ds = ctgiohang.getGH();

                        int i = 1;
                        for (Monhang elem : ds) {
                    %>
                    <tr>
                        <th scope="row"><%=i%></th>
                        <td class="list-group-item-primary">
                            <form method="post" action="giohang_capnhat.jsp">
                                <input hidden="" name="msp" type="number" value="<%=elem.getMsp()%>">
                                <%=elem.getMsp()%>
                                </td>
                                <td class="list-group-item-primary"><%=elem.getTenmh()%></td>
                                <td class="list-group-item-primary">
                                    <input type="number"  name="sl" value="<%=elem.getSoluong()%>">&nbsp;
                                    <input type="submit" value="Cập nhật">&nbsp;
                            </form>
                            <button type="button"><a href="giohang_Xoa.jsp?masp=<%=elem.getMsp()%>">Xóa</a></button>
                        </td>

                        <td class="list-group-item-primary"><%=formatter.format(elem.getDongia()) + " VNĐ"%></td>
                        <td class="list-group-item-primary"><%=Khuyenmai.layTenKM(elem.getMakhuyenmai())%></td>
                        <td class="list-group-item-primary"><%=formatter.format(elem.getDongia() * elem.getSoluong()-((elem.getDongia()*Khuyenmai.layTiengiam(elem.getMakhuyenmai()))/100)*elem.getSoluong())+ " VNĐ"%></td>


                    </tr>
                    <%      
                            tong = tong + elem.getDongia() * elem.getSoluong()-((elem.getDongia()*Khuyenmai.layTiengiam(elem.getMakhuyenmai()))/100)*elem.getSoluong();
                            i++;
                        }

                    %>
                </tbody>
            </table>
            <hr>
            <label class="col-md-12 text-center text-danger"><h4>Tổng Tiền: <%=formatter.format(tong) + " VNĐ"%></h4></label>
            <hr>
            <button type="submit" class="col-md-5 btn btn-primary btn-lg" style="margin-left: 55px;" onclick="javascript:history.go(-1)">Tiếp tục mua hàng</button>
            <button type="reset" class="col-md-5 btn btn-primary btn-lg" style="margin-left: 55px;"><a class="btn-primary" href="dathang.jsp">Đặt hàng</a></button>

        </div>
    </div>

</div>
</div>    
<%@include file="Footer.html" %>
