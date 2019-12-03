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
    <div class="container">
        <h2 class="text-center hu">Thông tin khách hàng</h2>
        <div class="container" style="margin: auto">
            <div class="col-md-auto order-md-1">
                <h4 class="mb-3 hu">Xin chào khách hàng: <%=khdn.getHoten()%></h4>
                <form method="post" action="khachhang_capnhatthongtinok.jsp">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">Số điện thoại</label>
                        <input type="text" class="form-control" name="sdt" readonly=""  id="firstName" placeholder="" value="<%=khdn.getSdtkh()%>" required>

                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Tên khách hàng</label>
                        <input type="text" class="form-control" name="ten"   id="firstName" placeholder="" value="<%=khdn.getHoten()%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Địa chỉ email</label>
                        <input type="text" class="form-control" name="mail"   id="firstName" placeholder="" value="<%=khdn.getEmail()%>" required>
                    </div>
                </div>

                <div class="row" style="">
                    <div class="col-md-4 mb-3" >
                        <label>Ngày sinh</label><br>
                        <input type="date" class="form-control" name="ngaysinh"   id="firstName" placeholder="" value="<%=khdn.getNgaysinh()%>" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="dongia">Giới tính</label><br>
                        <select class="form-control" name="gioitinh">
                            <optgroup  label="Chọn giới tính" >                             
                                <option style="background-color: teal;"><%=khdn.getGioitinh()%></option>
                                <option>Nam</option>
                                <option>Nu</option>
                                <option>Khác</option>
                            </optgroup>            
                        </select>
                    </div>

                </div>
                <hr>
                <div class="form-group shadow-textarea">
                    <label for="exampleFormControlTextarea6">Địa chỉ</label>
                    <textarea class="form-control z-depth-1" name="diachi" id="ckeditor1" rows="5"  required=""><%=khdn.getDiachi()%></textarea>
                </div>  
                <div class="col-md-12 mb-3">
                    <button class="col-md-5 btn btn-primary btn-lg" type="submit">Cập nhật</button>
                    <button class="col-md-5 btn btn-primary btn-lg" type="reset" onclick="javascpipt:history.go(-1)">Trở lại</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>    
</div>
<%@ include file="Footer.html" %>