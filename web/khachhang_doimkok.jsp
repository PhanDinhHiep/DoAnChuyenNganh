<%@page import="java.util.Vector"%>
<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8" errorPage="loikh.jsp"%>
<%@include file="header.jsp" %>
<%    String mkht = request.getParameter("mkc");
    String mkm = request.getParameter("mkm");
    String mkmnl = request.getParameter("mkmnl");
    boolean kq = false;
    if (mkht.equals(khdn.getMatkhau())) {
        if (mkm.equals(mkmnl)) {
            kq = khdn.doiMKKH(mkm);
        } else {
            kq= false;
        }
    }
    String loi = "Không thành công";
    if(kq == true){
       loi="Đổi mật khẩu thành công";
    }
%>
<%@include file="menukh.html" %>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center"><%=loi%></h2>        
    </div>
</div>
</div>    
</div>
<%@include file="Footer.html" %>
