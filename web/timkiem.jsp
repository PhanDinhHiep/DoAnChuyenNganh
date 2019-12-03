<%@page import="java.util.ArrayList"%>
<%@page import="model.*" contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="header.jsp" %>
<% request.setCharacterEncoding("utf-8");%>
<%
    String chon = request.getParameter("chon");
    
    String cantim = request.getParameter("cantim");
    if(cantim == ""){
        response.sendRedirect("index.jsp");
    }
    ArrayList<Sanpham> dsSP = new ArrayList();
    if(chon.equals("LoaiSP")){
        dsSP = Sanpham.timkiemArraydanhSachSanPhamLSP(cantim);
    }
    else{
        dsSP = Sanpham.timkiemArraydanhSachSanPham(cantim);
    }
%>
<body >
    <!-- Navigation -->
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="list-group" style="padding-top: 60px">
                    <h3 style="color: #005cbf">Tìm kiếm</h3>

                    <form method="post" action="timkiem.jsp">
                        <div>
                            <label class="radio-inline"><input type="radio" name="chon" value="LoaiSP" checked>&nbsp;&nbsp;&nbsp;Loại sản phẩm</label>
                            <label class="radio-inline"><input type="radio" name="chon" value="SanPham">&nbsp;&nbsp;&nbsp;Tên sản phẩm</label>                            
                        </div>
                        <div>
                            <input class="form-control mr-sm-2" name="cantim" type="search" placeholder="Nhập " aria-label="Search">                          
                            <br>
                            <button class="btn btn-success btn-sm" type="submit">Tìm</button>
                        </div>
                    </form>

                    <h3 style="color: #005cbf">Sản phẩm theo mức giá</h3>
                    <a href="#" class="list-group-item">Từ 100.000 Đến 500.000</a>
                    <a href="#" class="list-group-item"><%=chon%></a>
                    <a href="#" class="list-group-item"><%=cantim%></a>
                </div>
                <div class="list-group" style="padding-top: 20px">
                    <a href="giohang.jsp"><h3 style="color: orangered">Giỏ hàng</h3></a>
                    <!--<a href="#" class="list-group-item">Sản phẩm 1</a>
                    <a href="#" class="list-group-item">Thành tiền</a>-->
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

                <div class="row" >
                    <%
                        for (Sanpham elem : dsSP) {
                    %>
                    <div class="col-lg-4 col-md-6 mb-4" >
                        <div class="card h-100">
                            <a href="chitietsanpham.jsp?masp=<%=elem.getMasp()%>"><img class="img-thumbnail" src="Image/<%out.write(elem.getHinhanh());%> " alt="Lỗi hình ảnh"></a>
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a id="tensanpham" href="chitietsanpham.jsp?masp=<%=elem.getMasp()%>"><% out.write(elem.getTensp());%></a>
                                </h4>
                                <h5 style="color: red;">&nbsp;<% out.write(String.valueOf(elem.getDongia()));%>.000đ</h5>
                            </div>
                            <div class="card-footer" style="margin: auto">   
                                <a href="giohang.jsp?masp=<%=elem.getMasp()%>"><input class ="btn btn-success btn-sm" type="button" value="Thêm vào giỏ hàng"  style="margin: auto"></a>
                            </div>
                        </div>
                    </div>  
                    <% }%>
                </div>
                <style type="text/css">
                    .hiep:hover{
                        color: white;
                        background-color: #007bff;
                    }
                </style>
                <script type="text/javascript">

                </script>
                <!-- /.row -->

            </div>
            <!-- /.col-lg-9 -->

        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
    <%@include file="Footer.html" %>
