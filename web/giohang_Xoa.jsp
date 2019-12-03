<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<%                        
    Giohang ctgiohang = (Giohang) session.getAttribute("GioHang");
    String msp = request.getParameter("masp");
    if (msp != null) {
        Sanpham s = new Sanpham(Integer.parseInt(msp));
        Monhang mh = new Monhang(s.getMasp(), s.getTensp(), s.getDongia(), 1,s.getMabaohanh(),s.getMakhuyenmai(),s.getMausac());
        ctgiohang.xoaMonHang(Integer.parseInt(msp));
    }
    response.sendRedirect("giohang.jsp");

%>  
