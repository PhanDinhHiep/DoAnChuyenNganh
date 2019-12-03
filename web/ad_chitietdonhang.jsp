<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%    
    int sodh = Integer.parseInt(request.getParameter("shd"));
    Donhang ctdh = Donhang.layCTdonhang(sodh);
    Khachhang khdh = new Khachhang(ctdh.getKhachhang());
    Khuyenmai km = new Khuyenmai();
%>
<!-- /.col-lg-3 -->
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <form method="post" action="ad_duyetdonhang.jsp">
        <h2 class="text-center hu">Chi tiết đơn hàng</h2>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="firstName">Số Hóa Đơn</label>
                <input type="text" class="form-control" name="shd" readonly=""  id="firstName" placeholder="" value="<%=sodh%>" required>

            </div>
            <div class="col-md-6 mb-3">
                <label for="lastName">Khách hàng</label>
                <input type="text" class="form-control" name="kh" readonly=""  id="firstName" placeholder="" value="<%=khdh.getHoten() + "-" + ctdh.getKhachhang()%>" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="lastName">Ngày đặt</label>
                <input type="text" class="form-control" name="ngaydat" readonly=""  id="firstName" placeholder="" value="<%=ctdh.getNgaydat()%>" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="lastName">Hình thức thanh toán</label>
                <input type="text" class="form-control" name="ngaydat" readonly=""  id="firstName" placeholder="" value="<%=Hinhthucthanhtoan.laytenHHTTT(ctdh.getMahttt())%>" required>
            </div>
            <div class="col-md-12 mb-3">
                <label for="firstName">Nhân viên giao</label>
                <select name="nvg" class="custom-select d-block w-100">

                    <%
                        for (Nhanvien elem : Nhanvien.danhsachNhanVienGiao()) {
                    %>
                    <option><%=elem.getSodtnv() + "-" + elem.getHoten()%></option>

                    <%
                        }
                    %>
                </select>
            </div>
        </div>
        <div class="form-group shadow-textarea">
            <label for="exampleFormControlTextarea6">Địa chỉ giao</label>
            <textarea class="form-control z-depth-1" name="motachitiet" id="ckeditor1" rows="5" readonly="" required=""><%=ctdh.getDiachigiao()%></textarea>
        </div>
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
                    ArrayList<Monhang> dsdh = Chitietdonhang.laychitietDonHang(sodh);
                    int i = 1;
                    double tong = 0;
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
                    <td class="list-group-item-primary"><%=FotmatSo.fm(elem.getDongia() * elem.getSoluong() - ((elem.getDongia() * Khuyenmai.layTiengiam(elem.getMakhuyenmai())) / 100) * elem.getSoluong())%></td>              
                </tr>
                <%
                        tong = tong + elem.getDongia() * elem.getSoluong() - ((elem.getDongia() * Khuyenmai.layTiengiam(elem.getMakhuyenmai())) / 100) * elem.getSoluong();
                        i++;
                    }
                %>
            </tbody>
        </table> 
                <label class="col-md-12 text-center text-danger"><h4>Tổng Tiền: <%=FotmatSo.fm(tong)%></h4></label>
        <div class="row">
            <div class="col-md-3 mb-3">
                <button class="col-lg-12 btn btn-primary" type="reset" onclick="javascpipt:history.go(-1)">Trở lại</button>
            </div>
            <div class="col-md-3 mb-3">
                <a href="Center.html"><button class="col-lg-12 btn btn-primary" type="button">Hủy đơn</button></a>
            </div>
            <div class="col-md-3 mb-3">
                <button class="col-lg-12 btn btn-primary" type="submit">Duyệt đơn hàng</button>
            </div>
            <div class="col-md-3 mb-3">
                <button class="col-lg-12 btn btn-primary" type="button">
                    <a style="color: #ffffff" href="ad_inhoadon.jsp?shd=<%=sodh%>">In hóa đơn</a>
                </button>
            </div>
        </div>
    </form>
</div>
</div>    
</div>
<%@ include file="Footer.html" %>