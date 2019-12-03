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
                <a class="navbar-brand" href="admin.jsp"><h4>Admin Tanaka</h4></a>
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
                                } else if (nv.getMaquyen().equals("NVGH")) {
                                    response.sendRedirect("nhanvienGiaoHang.jsp");
                                } else {
                                    url = "dangxuat.jsp";
                                    dn = "Đăng Xuất";
                                }
                            %>   
                            <a class="nav-link" href="ad_thongtin.jsp"><%=nv.getMaquyen() + "-" + nv.getHoten()%></a>
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
                <div class="col-lg-3" style="background-color: #007bff; margin-bottom: 5px">
                    <!--
                     <div class="list-group" style="">
                         <h3 style="color: white;">Quản lý danh mục</h3>
                         <a href="themDMSP.jsp" class="list-group-item">Cập nhật danh mục sản phẩm</a>
                         <a href="themLoaiSP .jsp" class="list-group-item">Cập nhật loại sản phẩm</a>
                         <a href="#" class="list-group-item">Danh sách loại sản phẩm</a>
                         <a href="danhsachdanhmucsanpham.jsp" class="list-group-item">Danh sách danh mục sản phẩm</a>
                     </div>
                     <div class="list-group" style="">
                         <h3 style="color: white;">Quản lý sản phẩm</h3>
                         <a href="themsanphammoi.jsp" class="list-group-item">Thêm sản phẩm mới</a>
                         <a href="#" class="list-group-item">Cập nhật thông tín sản phẩm</a>
                         <a href="#" class="list-group-item">Danh sách sản phẩm</a>
                     </div>
                     <div class="list-group" style="">
                         <h3 style="color: white;">Quản lý đơn hàng</h3>
                         <a href="#" class="list-group-item">Số sản phẩm</a>
                         <a href="#" class="list-group-item">Tồng tiền</a>
                         <a href="#" class="list-group-item">Category 3</a>
                     </div>
                     <div class="list-group" style="">
                         <h3 style="color: white;">Quản lý nhập hàng</h3>
                         <a href="#" class="list-group-item">Nhập hàng</a>
                         <a href="#" class="list-group-item">Danh sách phiếu nhập hàng</a>
 
                     </div>
                     <div class="list-group" style="">
                         <h3 style="color: white;">Quản lý nhân viên</h3>
                         <a href="#" class="list-group-item">Thêm nhân viên mới</a>
                         <a href="#" class="list-group-item">Cập nhật trạng thái nhân viên</a>                        
                     </div>
                     <div class="list-group" style="">
                         <h3 style="color: white;">Thống kê - Báo cáo</h3>
                         <a href="#" class="list-group-item">Số sản phẩm</a>
                         <a href="#" class="list-group-item">Tồng tiền</a>
                         <a href="#" class="list-group-item">Category 3</a>
                     </div>
                    -->

                    <div class="accordion" id="myaccordion" style="max-width: 100%; margin-top: 5px; margin-bottom: 5px;">
                        <div class="card">
                            <div class="card-header " style="color: white; background-color: #007bff" data-toggle="collapse" data-target="#qldm" aria-expanded="true"
                                 data-parent="#myaccordion">
                                <h4 style="">Quản lý danh mục</h4>
                            </div>
                            <div class="card-body collapse"  data-toggle="collapse"  aria-expanded="false" id="qldm">
                                <a href="themDMSP.jsp" class="list-group-item">Cập nhật danh mục sản phẩm</a>
                                <a href="themLoaiSP.jsp" class="list-group-item">Cập nhật loại sản phẩm</a>
                                <a href="danhsachLoaiSanPham.jsp" class="list-group-item">Danh sách loại sản phẩm</a>
                                <a href="danhsachdanhmucsanpham.jsp" class="list-group-item">Danh sách danh mục sản phẩm</a>
                            </div>    
                        </div>
                        <div class="card" >
                            <div class="card-header btn" style="color: white; background-color: #007bff"  data-toggle="collapse" data-target="#qlsp" data-parent="#myaccordion">
                                <h4 style="">Quản lý sản phẩm</h4>
                            </div>
                            <div class="card-body collapse"  data-toggle="collapse"  aria-expanded="false" id="qlsp">
                                <a href="themsanphammoi.jsp" class="list-group-item">Thêm sản phẩm mới</a>
                                <a href="capnhatgiaban.jsp" class="list-group-item">Cập nhật giá bán</a>
                                <a href="capnhatthongtinsanphammmsp.jsp" class="list-group-item">Cập nhât thông tin sản phẩm</a>
                                <a href="danhsachSanpham.jsp?trang=1" class="list-group-item">Danh sách sản phẩm</a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header btn" style="color: white; background-color: #007bff" data-toggle="collapse" data-target="#qldh" data-parent="#myaccordion">
                                <h4 style="">Quản lý đơn hàng</h4>
                            </div>
                            <div class="card-body collapse"  data-toggle="collapse"  aria-expanded="false" id="qldh">
                                <a href="admin_donhangmoi.jsp" class="list-group-item">Đơn hàng mới</a>
                                <a href="ad_donhangdangxuly.jsp" class="list-group-item">Đơn hàng đang xử lý</a>
                                <a href="ad_donhangdagiao.jsp" class="list-group-item">Đơn hàng đã giao</a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header btn" style="color: white; background-color: #007bff" data-toggle="collapse" data-target="#qlnh" data-parent="#myaccordion">
                                <h4 style="">Quản lý nhập hàng</h4>
                            </div>
                            <div class="card-body collapse"  data-toggle="collapse"  aria-expanded="false" id="qlnh">
                                <a href="ad_nhaphang.jsp" class="list-group-item">Nhập hàng</a>
                                <a href="#" class="list-group-item"></a>
                                <a href="#" class="list-group-item">Danh sách phiếu nhập</a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header btn" style="color: white; background-color: #007bff" data-toggle="collapse" data-target="#qlnv" data-parent="#myaccordion">
                                <h4 style="">Quản lý nhân viên</h4>
                            </div>
                            <div class="card-body collapse"  data-toggle="collapse"  aria-expanded="false" id="qlnv">
                                <a href="ad_themnvmoi.jsp" class="list-group-item">Thêm nhân viên mới</a>
                                <a href="ad_capnhatttnv.jsp" class="list-group-item">Cập nhật trạng thái nhân viên</a>
                                <a href="ad_danhsachnv.jsp" class="list-group-item">Danh sách nhân viên</a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header btn" style="color: white; background-color: #007bff" data-toggle="collapse" data-target="#qlkh" data-parent="#myaccordion">
                                <h4 style="">Quản lý khách hàng</h4>
                            </div>
                            <div class="card-body collapse"  data-toggle="collapse"  aria-expanded="false" id="qlkh">

                                <a href="ad_capnhatttkh.jsp" class="list-group-item">Cập nhật trạng thái khách hàng</a>
                                <a href="ad_danhsachkh.jsp" class="list-group-item">Danh sách khách hàng</a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header btn" style="color: white; background-color: #007bff" data-toggle="collapse" data-target="#qlkm" data-parent="#myaccordion">
                                <h4 style="">Quản lý khuyến mãi</h4>
                            </div>
                            <div class="card-body collapse"  data-toggle="collapse"  aria-expanded="false" id="qlkm">
                                <a href="ad_themkhuyenmai.jsp" class="list-group-item">Thêm chương trình khuyên mãi</a>
                                <a href="ad_danhsachkm.jsp" class="list-group-item">Cập nhật thông tin khuyến mãi</a> 
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header btn" style="color: white; background-color: #007bff" data-toggle="collapse" data-target="#qlbh" data-parent="#myaccordion">
                                <h4 style="">Bảo hành</h4>
                            </div>
                            <div class="card-body collapse"  data-toggle="collapse"  aria-expanded="false" id="qlbh">
                                <a href="ad_thembaohanh.jsp" class="list-group-item">Thêm bảo hành</a>
                                <a href="ad_danhsachbh.jsp" class="list-group-item">Cập nhật bảo hành</a>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header btn" style="color: white; background-color: #007bff" data-toggle="collapse" data-target="#tkbc" data-parent="#myaccordion">
                                <h4 style="">Thống kê - báo cáo</h4>
                            </div>
                            <div class="card-body collapse" style="color: white; background-color: #007bff" data-toggle="collapse"  aria-expanded="false" id="tkbc">                                
                                <a href="ad_danhsachspbanchay.jsp" class="list-group-item">Sản phẩm bán chạy</a>
                                <a href="ad_thongke.jsp" class="list-group-item">Doanh thu</a>
                            </div>
                        </div>
                    </div>
                </div>

