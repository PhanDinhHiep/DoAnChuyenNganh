<%@page import="model.*" contentType="text/html" pageEncoding="utf-8" errorPage="loi.jsp"%>
<%@include file="Header.html" %>
<head>
        <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
        <script type="text/javascript" src="ckfinder/ckfinder.js"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shop Ví Thắt Lưng Đà Nẵng</title>
        <link rel="shortcut icon" href="Image/logo.png">
        <!-- Bootstrap core CSS -->
        <link href="bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/shop-homepage.css" rel="stylesheet">
</head>
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<center>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center hu">Đăng ký thành viên</h2>
        <div class="container" style="margin: auto">
            <div class="col-md-auto order-md-1">
                <h4 class="mb-3 hu">Điền thông tin cá nhân</h4>
                <form method="POST" action="DangKyTT">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">Số điện thoại</label>
                            <input type="number" class="form-control" name="sdtkh"id="firstName" placeholder="Nhập số điện thoại khách hàng"  required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Họ tên nhân viên</label>
                            <input type="text" class="form-control" name="tkh" id="firstName" placeholder="Nhập họ tên khách hàng" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Địa chỉ email</label>
                            <input type="text" class="form-control" name="email" id="firstName" placeholder="...@gmail.com hoặc ...@outlook.com"  required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Mật khẩu</label>
                            <input type="password" class="form-control" name="mk" id="firstName" placeholder=""  required>
                        </div>
                    </div>

                    <div class="row" style="">
                        <div class="col-md-4 mb-3" >
                            <label>Ngày sinh</label><br>
                            <input type="date" class="form-control" name="ngaysinh" id="firstName"  required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="dongia">Giới tính</label><br>
                            <select name="gioitinh" class="custom-select d-block w-100" required>                             
                                <option>Nam</option>
                                <option>Nu</option>
                            </select>
                        </div>
                        
                    </div>
                    <div class="form-group shadow-textarea">
                        <label for="exampleFormControlTextarea6">Địa chỉ</label>
                        <textarea class="form-control z-depth-1" name="diachi" id="ckeditor1" rows="5" placeholder="" required=""></textarea>
                    </div>  
                    <hr class="mb-4">
                    <button class="col-md-5 btn btn-primary btn-lg" type="submit">Đăng ký thành viên</button>
                    <button class="col-md-5 btn btn-primary btn-lg" type="reset">Hủy</button>
                   
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html"%>
</center>