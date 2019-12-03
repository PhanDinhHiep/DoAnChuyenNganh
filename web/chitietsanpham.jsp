<%@page import="java.text.DecimalFormat"%>
<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<style type="text/css">
    .hiep:hover{
        color: white;
        background-color: #007bff;
    }
</style>
<div class="container" style="padding-top: 30px;">    
    <div class="jumbotron">
        <div class="row">
            <%                Sanpham sp = new Sanpham();
                if (request.getParameter("masp") != null) {
                    String msp = request.getParameter("masp");
                    sp = sp.layChiTietSP(Integer.parseInt(msp));
                }
                DecimalFormat formatter = new DecimalFormat("###,###,###");
                //System.out.println(formatter.format(34.000) + " VNĐ");
            %>
            <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                <div class="text-center">
                    <img src="Image/<%=sp.getHinhanh()%>" class="img-thumbnail" alt="...">
                </div>
            </div>
            <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8">
                <h2 class="text-primary">Thông tin chi tiết sản phẩm</h2>
                <div class="container">               
                    <h2 class="text-danger"><%=sp.getTensp()%></h2>
                </div>
                <hr>
                <ul class="container details">
                    <li><p><span class="glyphicon glyphicon-earphone one" style="width:50px;"></span><h5 style="color: red;">&nbsp;<%=formatter.format(sp.getDongia()) + " VNĐ"%></h5></p></li>
                    <li><p><span class="glyphicon glyphicon-envelope one" style="width:50px;"></span>Màu: <%=sp.getMausac()%></p></li>
                    <li><p><span class="glyphicon glyphicon-new-window one" style="width:50px;"></span>Trạng Thái: <%=sp.getTrangthaisanpham()%></p></a>
                </ul>
                <div>   
                    <a href="giohang.jsp?masp=<%=sp.getMasp()%>"><input class="hiep" type="button" value="Thêm vào giỏ hàng" onclick=""></a>
                </div>            
            </div>               
        </div>
        <hr>

        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
                <h4>Mô tả chi tiết sản phẩm</h4>
                <div class="container">               
                    <h2><%=sp.getMotachitiet()%></h2>
                </div>
                <hr>           
            </div>               
        </div>
        <div class="row">
            <%
                Hinhanh ha = new Hinhanh();
                for (String elem : ha.layHinh(sp.getMasp())) {
                    
                
            %>
            <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                <img src="<%=request.getContextPath()%>/Image/<%out.write(elem);%> "width="350px" height="300px" alt="<%=request.getContextPath()%>/Image/<%=elem%>" class="img-thumbnail">
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
<%@include file="Footer.html" %>
