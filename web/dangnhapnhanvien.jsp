<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8"%>

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

    <body >
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
            <div class="container">
                <a class="navbar-brand" href="dangnhapnhanvien.jsp"><h2> Trang Admin</h2></a>            
                <a class="navbar-brand" href="#"></a>
            </div>
        </nav>
        <% if (request.getMethod().equals("GET")) %>
        <%@include file="dangnhapNhanvien.html" %>
        <%@include file="Footer.html" %>
