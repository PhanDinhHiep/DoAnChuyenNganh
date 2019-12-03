<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<div>
<%                        
    Giohang ctgiohang = (Giohang) session.getAttribute("GioHang");
    String msp = request.getParameter("msp");
    Sanpham v = new Sanpham(Integer.parseInt(msp));
    String sl = request.getParameter("sl");
    int so = Integer.parseInt(sl);
    if(so <= 0){
        so = 1;
    }else
         if(so > v.getSoluong()){
             throw new Exception("Bạn chỉ được phép đặt dưới "+v.getSoluong()+" sản phẩm");
         }
    if (msp != null) {
       Sanpham s = new Sanpham(Integer.parseInt(msp));
       Monhang mh = new Monhang(s.getMasp(), s.getTensp(), s.getDongia(),so,s.getMabaohanh(),s.getMakhuyenmai(),s.getMausac());
       ctgiohang.capnhatMonHang(mh);
    }
   response.sendRedirect("giohang.jsp");
%>  
</div>

