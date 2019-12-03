<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%

    String msp = request.getParameter("msp");
    int masp = Integer.parseInt(msp);
    Sanpham sp = Sanpham.layChiTietSPcn(masp);
    Hinhanh s =new Hinhanh();
%>
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h2 class="text-center hu">Cập Nhật Thông Tin Sản Phẩm</h2>
        <h4 style="color: #005cbf">Nhập thông tin cần cập nhật</h4>
        <form method="POST" action="CapNhatTT" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="firstName">Mã sản phẩm</label>
                    <input type="text" class="form-control" name="msp" readonly=""  id="firstName" placeholder="" value="<%=msp%>" required>

                </div>
                <div class="col-md-6 mb-3">
                    <label for="lastName">Mã loại Sản Phẩm</label>
                    <select name="hiep" class="custom-select d-block w-100" required>
                        <option style="background-color: yellowgreen;"><%=Loaisanpham.layTenLoaiSP(sp.getMaloaisp())%></option>
                        <%
                            for (Loaisanpham elem : Loaisanpham.layDanhSachLSP()) {
                        %>
                        <option><%=elem.getTenLoaisanpham()%></option>
                        <%}%>
                    </select>
                </div>
            </div>
            <div class="mb-3">
                <label for="username">Tên Sản Phẩm</label>
                <input type="text" class="form-control" name="tensp" id="username" placeholder="Tên sản phẩm" value="<%=sp.getTensp()%>" required>                    
            </div>
            <div class="row" style="">
                <div class="col-md-4 mb-3" >
                    <label>Số lượng</label>
                    <input type="number"  name="soluong"class="form-control" readonly="" id="zip" placeholder="" value="<%=sp.getSoluong()%>" required>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="dongia">Đơn giá</label>
                    <input type="text" class="form-control" name="dongia" id="zip" placeholder="" readonly="" value="<%=FotmatSo.fmgia(sp.getDongia())%>" required>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="hinh">Hình ảnh</label>
                    <div class="custom-file">
                        <input type="file" class="form-control" name="hinhdd" style="padding: 5px;" required value="<%=sp.getHinhanh()%>">       
                    </div>
                </div>                   
            </div>
            <h4 class="mb-3 hu">Hình ảnh củ</h4>
            
            <div class="row" style="">
                <div class="col-md-3 mb-3">
                    <label for="hinh">Hình ảnh ĐD</label>
                    <div class="text-center">
                        <img src="Image/<%=sp.getHinhanh()%>" class="img-thumbnail" alt="...">
                    </div>
                </div>
                <%
                    int i =1;
                    for (String tenhinh : s.layHinh(masp)) {     
                %>
                <div class="col-md-3 mb-3">
                    <label for="hinh">Hình ảnh mô tả <%=i++%></label>
                    <div class="text-center">
                        <img src="<%=request.getContextPath()%>/Image/<%=tenhinh%>" class="img-thumbnail" alt="...">
                    </div>
                </div>
                <%}%>
            </div>
            <hr class="mb-4" >
            <h4 class="mb-3 hu">Hình ảnh mô tả</h4>
            <div class="row" style="">
                <div class="col-md-4 mb-3">
                    <label for="hinh">Hình ảnh 1</label>
                    <div class="custom-file">
                        <input type="file" class="form-control" name="uploadFile" style="padding: 5px;" required >
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="hinh">Hình ảnh 2</label>
                    <div class="custom-file">
                        <input type="file" class="form-control" name="uploadFile" style="padding: 5px;" required>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="hinh">Hình ảnh 3</label>
                    <div class="custom-file">
                        <input type="file" class="form-control" name="uploadFile" style="padding: 5px;" required >
                    </div>
                </div>
            </div>

            <hr class="mb-4" >

            <div class="row" style="">
                <div class="col-md-4 mb-3">
                    <label for="hinh">Khuyến mãi</label>
                    <select class="custom-select d-block w-100" name="khuyenmai" required>
                        
                        <%
                            for (Khuyenmai bh : Khuyenmai.danhSachKhuyenmai()) {
                        %>
                        <option><%=bh.getHinhthuckhuyenmai()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="hinh">Bảo hành</label>
                    <select class="custom-select d-block w-100" name="baohanh" required>
                        
                        <%
                            for (Baohanh bh : Baohanh.danhSachBaoHanh()) {
                        %>
                        <option><%=bh.getHinhthucbaohanh()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label>Màu sắc</label>                         
                    <input type="text" class="form-control" name="mau" required placeholder="" value="<%=sp.getMausac()%>">       
                </div>
                <div class="col-md-6 mb-3">
                    <label for="hinh">Trạng thái sản phẩm</label>                         
                    <select class="custom-select d-block w-100" name="ttsp" required>
                        <option style="background-color: yellowgreen;"><%=sp.getTrangthaisanpham()%></option>
                        <option>Còn hàng</option>
                        <option>Sắp hết hàng</option>
                        <option>Hết hàng</option>
                    </select>
                </div>
                <div class="col-md-6 mb-3">
                    <label>Trạng thái kinh doanh</label>
                    <select class="custom-select d-block w-100" name="ttkd" required>
                        <option style="background-color: yellowgreen;"><%=sp.getTrangthaikinhdoanh()%></option>
                        <option>Đang kinh doanh</option>
                        <option>Ngừng kinh doanh</option>
                    </select> 
                </div>
            </div>
            <div class="form-group shadow-textarea">
                <label for="exampleFormControlTextarea6">Mô tả chi tiết</label>
                <textarea class="form-control z-depth-1" name="motachitiet" id="ckeditor1" rows="5" placeholder="Viết mô tả ở đây..." required=""><%=sp.getMotachitiet()%></textarea>
            </div>  
            <hr class="mb-4">
            <button class="col-md-5 btn btn-primary btn-lg" type="submit">Cập nhật</button>
            <button class="col-md-5 btn btn-primary btn-lg" type="reset">Hủy</button>
            <script>
                var editor = CKEDITOR.replace('ckeditor1');
                CKFinder.setupCKEditor(editor, 'ckfinder/');
            </script>
        </form>
        <hr> 
    </div>
</div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
<script type="text/javascript">
    $('#chon').click(function () {
        alert("Chọn");
    });
</script>