<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Bạn muốn loại sản phẩm này không?</h4>
        <form method="post" action="themLoaiSP_ok.jsp">
            <div class="form-group">
                <label style="color: #005cbf">Mã Danh Mục</label>
                <input type="text" class="form-control" readonly=""  name="in_madm" value="<%=request.getParameter("in_madm")%>">
            </div>
            <div class="form-group">
                <label style="color: #005cbf">Mã Loại Sản Phẩm</label>
                <input type="text" class="form-control"   name="in_maloaisp" value="<%=request.getParameter("in_maloaisp")%>">
            </div>
            <div class="form-group">
                <label style="color: #005cbf">Tên Loại Sản Phẩm</label>
                <input type="text" class="form-control" name="in_tenloaisp" placeholder="Nhập tên danh mục" value="<%=request.getParameter("in_tenloaisp"
                        + "")%>">
            </div>
            <button type="submit" class="btn btn-primary">Thêm</button>
            <button type="reset" class="btn btn-primary" ><a style="color: white;" href="javascript:history.go(-1)">Hủy</a></button>
        </form>
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
