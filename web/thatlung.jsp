<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<div class="container">

    <div class="row">

        <div class="col-lg-3">
            <div class="list-group" style="padding-top: 20px">
                <h3 style="color: #005cbf">Top Doanh Thu</h3>
                <a href="#" class="list-group-item">Category 1</a>
                <a href="#" class="list-group-item">Category 2</a>
                <a href="#" class="list-group-item">Category 3</a>
            </div>
            <div class="list-group" style="padding-top: 20px">
                <h3 style="color: #005cbf">Giỏ hàng</h3>
                <a href="#" class="list-group-item">Số sản phẩm</a>
                <a href="#" class="list-group-item">Tồng tiền</a>
                <a href="#" class="list-group-item">Category 3</a>
            </div>
        </div>

        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

            <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img class="d-block img-fluid" src="Image/BangHieutanaka.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" src="Image/f.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" src="Image/s.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div class="row">
                <%
                    for (Sanpham elem : Sanpham.danhSachSanPham("TL")) {
                %>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="chitietsanpham.jsp?masp=<%=elem.getMasp()%>"><img class="card-img-top" src="Image/<%out.write(elem.getHinhanh());%> " alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a id="tensanpham" href="chitietsanpham.jsp?masp=<%=elem.getMasp()%>"><% out.write(elem.getTensp());%></a>
                            </h4>
                            <h5 style="color: red;">&nbsp;<% out.write(String.valueOf(elem.getDongia()));%>.000đ</h5>
                            <p class="card-text"><% out.write(elem.getMotachitiet());%></p>
                        </div>
                        <div class="card-footer">   
                            <a href="giohang.jsp?masp=<%=elem.getMasp()%>"><input class ="hiep" type="button" value="Thêm vào giỏ hàng"  style="margin: auto"></a>
                        </div>
                    </div>
                </div>  
                <% }%>
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.col-lg-9 -->

</div>
<!-- /.row -->

</div>

<%@include file="Footer.html" %>
