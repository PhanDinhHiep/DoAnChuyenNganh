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
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container" style="padding-top: 20px; padding-bottom: 20px;" >
        <h2 class="text-center hu">Đổi mật khẩu</h2>
        <div class="container" style="">
            <div class="col-md-auto order-md-1">
                <h4 class="mb-3 hu">Xin chào khách hàng: <%=khdn.getHoten()%></h4>
                <form method="POST" action="khachhang_doimkok.jsp">
                    <div class="row">
                        <div class="col-md-10 mb-3">
                            <label for="firstName">Mật khẩu hiện tại</label>
                            <input type="password" class="form-control" name="mkc" id="firstName" placeholder="Nhập mật khẩu hiện tại"  required>
                        </div>
                        <div class="col-md-10 mb-3">
                            <label for="lastName">Mật khẩu mới</label>
                            <input type="password" class="form-control" name="mkm" id="firstName" placeholder="Nhập mật khẩu mới" required>
                        </div>
                        <div class="col-md-10 mb-3">
                            <label for="lastName">Nhập lại mật khẩu mới</label>
                            <input type="password" class="form-control" name="mkmnl" id="firstName" placeholder="Nhập lại mật khẩu mới" required>
                        </div>
                    </div>
                    <button class="col-md-5 btn btn-primary btn-lg" type="submit">Xác nhận</button>
                    <button class="col-md-5 btn btn-primary btn-lg" type="reset">Hủy</button>
                </form>
            </div>
        </div>
    </div>
</div>
</div>    
</div>
<%@ include file="Footer.html" %>