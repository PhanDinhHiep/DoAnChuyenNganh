<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loikh.jsp" %>
<%@include file="header.jsp" %>
<%
%>
<!-- /.col-lg-3 -->
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<%@include file="menukh.html" %>
<%    
    String sdtkh = request.getParameter("kh");
    Khachhang khif = new Khachhang();
    if (sdtkh == null) {
        khif = khdn;
        //response.sendRedirect("Home");
    } else {
        khif = new Khachhang(sdtkh);
    }
%>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center hu">Thông tin khách hàng</h2>
        <div class="container" style="margin: auto">
            <div class="col-md-auto order-md-1">
                <h4 class="mb-3 hu">Xin chào khách hàng: <%=khif.getHoten()%></h4>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">Số điện thoại</label>
                        <input type="text" class="form-control" name="msp" readonly=""  id="firstName" placeholder="" value="<%=khif.getSdtkh()%>" required>

                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Họ tên khách hàng</label>
                        <input type="text" class="form-control" name="msp" readonly=""  id="firstName" placeholder="" value="<%=khif.getHoten()%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Địa chỉ email</label>
                        <input type="text" class="form-control" name="msp" readonly=""  id="firstName" placeholder="" value="<%=khif.getEmail()%>" required>
                    </div>
                </div>

                <div class="row" style="">
                    <div class="col-md-4 mb-3" >
                        <label>Ngày sinh</label><br>
                        <label  class="">&nbsp;&nbsp;<%=khif.getNgaysinh()%></label>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="dongia">Giới tính</label><br>
                        <label  class="">&nbsp;&nbsp;<%=khif.getGioitinh()%></label>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="dongia" style="font-size:;">Trạng thái hoạt động</label><br>
                        <label  class="">&nbsp;&nbsp;<%=khif.getTrangthaihoatdong()%></label>
                    </div>
                </div>
                <hr>
                <div class="form-group shadow-textarea">
                    <label for="exampleFormControlTextarea6">Địa chỉ</label>
                    <textarea class="form-control z-depth-1" name="motachitiet" id="ckeditor1" rows="5" readonly="" required=""><%=khif.getDiachi()%></textarea>
                </div>  

            </div>
        </div>
    </div>
</div>
</div>    
</div>
<%@ include file="Footer.html" %>