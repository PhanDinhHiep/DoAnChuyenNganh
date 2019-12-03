<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<!DOCTYPE html>
<html lang="en">
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
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
            <div class="container">
                <a class="navbar-brand" href="admin.jsp"><h4>Trang quản trị</h4></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="admin.jsp">Trang Chủ
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <!--<a class="nav-link" href="thatlung.jsp">Thắt Lưng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="vi.jsp">Ví</a>
                        </li> -->
                        <li class="nav-item active">
                            <% String dn = "Đăng Nhập";
                                String url = "dangnhapnhanvien.jsp";
                                Nhanvien nv = (Nhanvien) session.getAttribute("USER");
                                if (nv == null) {
                                    response.sendRedirect("dangnhapnhanvien.jsp");
                                    url = "dangnhapnhanvien.jsp";
                                } else {
                                    url = "dangxuat.jsp";
                                    dn = "Đăng Xuất";
                                }
                            %>   
                            <a class="nav-link" href="ad_thongtin_nv.jsp"><%=nv.getMaquyen() + "-" + nv.getHoten()%></a>
                        </li>    
                        <li class="nav-item">
                            <a class="nav-link" href="<%=url%>"><%=dn%></a>
                        </li>                        
                    </ul>                 

                </div>
            </div>
        </nav>
        <div class="container">  
            <div class="row" style="padding-top: 20px;">  
                <div class="col-lg-3" style="background-color: #007bff; margin-bottom: 5px ;padding-bottom: 100px;">
                    <div class="list-group" style="">
                        <h3 style="color: white;">Tác vụ</h3>
                        <a href="" class="list-group-item">Cập nhật thông tin cá nhân</a>
                        <a href="" class="list-group-item">Đổi mật khẩu</a>
                        <a href="nvgh_donhangduocgiao.jsp" class="list-group-item">Đơn hàng được giao</a>
                        <a href="nvgh_donhangdahoanthanh.jsp" class="list-group-item">Đơn hàng đã hoàn thành</a>
                    </div>         
                </div>

