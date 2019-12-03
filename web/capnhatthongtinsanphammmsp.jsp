<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h2 class="text-center hu">Cập Nhật Thông Tin Sản Phẩm</h2>
        <h4 style="color: #005cbf">Nhập thông tin cần cập nhật</h4>
        <form method="POST" action="capnhatthongtinsanpham.jsp">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="firstName">Mã sản phẩm</label>
                    <input type="number" class="form-control" name="msp"   id="firstName" placeholder=""  required>

                </div> 
            </div>
            <hr class="mb-4">
            <button class="col-md-5 btn btn-primary btn-lg" type="submit">Cập nhật</button>
            <button class="col-md-5 btn btn-primary btn-lg" type="reset">Hủy</button>
        </form>
        <hr> 
    </div>
</div>
</div>
</div>
</div>
<%@include file="Footer.html" %>