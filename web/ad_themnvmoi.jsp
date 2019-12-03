<%@page import="model.*" contentType="text/html" pageEncoding="utf-8" errorPage="loi.jsp"%>
<%@include file="menuadmin.jsp"%>
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center hu">Thêm Nhân Viên Mới</h2>
        <div class="container" style="margin: auto">
            <div class="col-md-auto order-md-1">
                <h4 class="mb-3 hu">Điền thông tin nhân viên</h4>
                <form method="POST" action="ad_themnvmoi_ok.jsp">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">Số điện thoại</label>
                            <input type="number" class="form-control" name="sdtnv"id="firstName" placeholder="Nhập số điện thoại nhân viên"  required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Họ tên nhân viên</label>
                            <input type="text" class="form-control" name="tnv" id="firstName" placeholder="Nhập họ tên nhân viên" required>
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
                                <option>Nữ</option>
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="dongia" style="font-size:;">Chức vụ</label><br>
                            <select name="chucvu" class="custom-select d-block w-100" required>                             
                                <option>Admin</option>
                                <option>Nhân viên giao hàng</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group shadow-textarea">
                        <label for="exampleFormControlTextarea6">Địa chỉ</label>
                        <textarea class="form-control z-depth-1" name="diachi" id="ckeditor1" rows="5" placeholder="Viết mô tả ở đây..." required=""></textarea>
                    </div>  
                    <hr class="mb-4">
                    <button class="col-md-5 btn btn-primary btn-lg" type="submit">Thêm Nhân Viên</button>
                    <button class="col-md-5 btn btn-primary btn-lg" type="reset">Hủy</button>
                    <script>
                        var editor = CKEDITOR.replace('ckeditor1');
                        CKFinder.setupCKEditor(editor, 'ckfinder/');
                    </script>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html"%>