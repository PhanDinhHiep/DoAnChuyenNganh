<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loikh.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
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
    <%
            String tkh="...";
            String dnk = "Đăng nhập";
            String urlk = "dangnhap";
            Khachhang kh =  new Khachhang();
            Khachhang khdn =  (Khachhang) session.getAttribute("KH");
            if(khdn == null ){
                khdn = kh;
            }
            else{
                dnk = "Đăng Xuất";
                urlk = "dangxuatkh.jsp";
                tkh = khdn.getHoten();
            }
            
            session.setAttribute("KHN",khdn); 
    %>
    <body >

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
            <div class="container">
                <a class="navbar-brand" href="Home"><h2>Ví & Thắt Lưng Tanaka</h2></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="thatlung.jsp">Thắt Lưng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="vi.jsp">Ví</a>
                        </li>
                        <li class="nav-item">                                   
                            <a class="nav-link" href="ad_thongtinkh.jsp"><%=tkh%></a>
                        </li>
                        <li class="nav-item">                                   
                            <a class="nav-link" href="<%=urlk%>"><%=dnk%></a>
                        </li>
                        <li class="nav-item">                                   
                            <a class="nav-link" href="giohang.jsp" style="color: yellowgreen">Giỏ hàng </a>
                        </li>
                    </ul>                 
                    <a class="navbar-brand" href="#"></a>
                </div>
            </div>
        </nav>
                        