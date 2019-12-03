<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*" contentType="text/html" pageEncoding="utf-8" errorPage="loikh.jsp"%>
<%@include file="header.jsp"%>
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<%    if (khdn.getHoten() == null) {
        response.sendRedirect("giohang.jsp");
    }
    DecimalFormat formatter = new DecimalFormat("###,###,###");
%>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<div class="col-lg-12" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center hu">Mua hàng</h2>

        <div class="container" style="margin: auto">
            <div class="col-md-auto order-md-1">
                <h4 class="mb-3 hu">Thông tin đơn hàng</h4>
                <form method="POST" action="dathang_ok.jsp">
                    <div class="row">

                        <div class="col-md-6 mb-3">
                            <label for="lastName">Số điện thoại</label>
                            <input type="text" class="form-control" name="sdtkh" readonly="" id="firstName" placeholder="" value="<%=khdn.getSdtkh()%>" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Tên khách hàng</label>
                            <input type="text" class="form-control" name="" readonly="" id="firstName" placeholder="" value="<%=khdn.getHoten()%>" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName" style="color: red;">Hình thức thanh toán</label>
                            <select class="form-control" name="httt" required>
                                <%
                                    for (Hinhthucthanhtoan httt : Hinhthucthanhtoan.ArrayHTTT()) {
                                %>
                                <option><%=httt.getTenhinhthucthanhtoan()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="username">Địa chỉ khách hàng</label>
                        <textarea type="text" class="form-control" name="diachi" id="username" required><%=khdn.getDiachi()%></textarea>                    
                    </div>
                    <div class="mb-3">
                        <label for="username">Địa chỉ giao hàng</label>
                        <textarea type="text" class="form-control" name="diachigiao" id="username" required><%=khdn.getDiachi()%></textarea>                    
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
                                    <th scope="col" style="color: #005cbf">Đơn giá</th>

                                    <th scope="col" style="color: #005cbf">Bảo hành</th>
                                    <th scope="col" style="color: #005cbf">Khuyến mãi</th>
                                    <th scope="col" style="color: #005cbf">Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Giohang ctgiohang = (Giohang) session.getAttribute("GioHang");
                                    String msp = request.getParameter("masp");
                                    double tong = 0;
                                    if (msp != null) {
                                        Sanpham s = new Sanpham(Integer.parseInt(msp));
                                        Monhang mh = new Monhang(s.getMasp(), s.getTensp(), s.getDongia(), 1, s.getMabaohanh(), s.getMakhuyenmai(), s.getMausac());
                                        ctgiohang.themMonHang(mh);
                                    }
                                    
                                    Vector<Monhang> ds = ctgiohang.getGH();
                                    int i = 1;
                                    for (Monhang elem : ds) {
                                %>
                                <tr>
                                    <th scope="row"><%=i%></th>

                                    <td class="list-group-item-primary"><%=elem.getTenmh()%></td>
                                    <td class="list-group-item-primary"><%=elem.getMausac()%></td>
                                    <td class="list-group-item-primary"><%=elem.getSoluong()%></td>
                                    <td class="list-group-item-primary"><%=formatter.format(elem.getDongia())%></td>

                                    <td class="list-group-item-primary"><%=Baohanh.layTenBH(elem.getMabaohanh())%></td>
                                    <td class="list-group-item-primary"><%=Khuyenmai.layTenKM(elem.getMakhuyenmai())%></td>
                                    <td class="list-group-item-primary"><%=formatter.format(elem.getDongia() * elem.getSoluong()-((elem.getDongia()*Khuyenmai.layTiengiam(elem.getMakhuyenmai()))/100)*elem.getSoluong())%></td>
                                </tr>
                                <%
                                        tong = tong + elem.getDongia() * elem.getSoluong()-((elem.getDongia()*Khuyenmai.layTiengiam(elem.getMakhuyenmai()))/100)*elem.getSoluong();
                                        i++;
                                    }
                                %>
                            </tbody>  
                        </table>

                    </div>
                    <hr class="mb-4" >
                    <!--<div class="row" style="">
                        <div class="col-md-6 mb-3">
                            <label for="hinh">Khuyến mãi</label>
                            <select class="custom-select d-block w-100" name="khuyenmai" required>
                               
                                <option><%%></option>
                               
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="hinh">Bảo hành</label>
                            <select class="custom-select d-block w-100" name="baohanh" required>
                    <%
                        for (Baohanh bh : Baohanh.danhSachBaoHanh()) {
                    %>
                    <option><%=bh.getHinhthucbaohanh()%></option>
                    <%
                        }
                    %>
                </select>
            </div> 
        </div>-->

                    <!--<label class="col-md-12 text-center text-danger"><h5>Giảm giá: <%=tong%>.000</h5></label>-->
                    
                    <label class="col-md-12 text-center text-danger"><h4>Tổng Tiền: <%=formatter.format(tong)+" VNĐ"/*=formatter.format(ctgiohang.tinhTongtien() - tiengiam)*/%></h4></label>
                    <div class="form-group shadow-textarea">
                        <label for="exampleFormControlTextarea6">Ghi chú</label>
                        <textarea class="form-control z-depth-1" name="ghichu" id="ckeditor1" rows="5" placeholder="Viết mô tả ở đây..." required=""></textarea>
                    </div>  
                    <hr class="mb-4">
                    <button class="col-md-5 btn btn-primary btn-lg" type="submit">Đặt Hàng</button>
                    <a href="xoagiohang.jsp" style="color: #ffffff;"><button class="col-md-5 btn btn-primary btn-lg" type="button">Xóa giỏ hàng</button></a>
                    <script>
                        var editor = CKEDITOR.replace('ckeditor1');
                        //CKFinder.setupCKEditor(editor, 'ckfinder/');
                    </script>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html"%>