<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<% 
    String mlsp = request.getParameter("mlsp");
    String tlsp = request.getParameter("tlsp");
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Cập Nhật Loại Sản Phẩm</h4>
        <form method="post" action="capnhatLoaiSanPham_ok.jsp">
            <div class="form-group">
                <label style="color: #005cbf">Mã Danh Mục</label><br>
                <small>Không được phép sửa Mã Loại Sản Phẩm</small>
                <input type="text" class="form-control" id="inmadm" required="" readonly="" name="in_mlsp" value="<%=mlsp%>">
            </div>
            <div class="form-group">
                <label style="color: #005cbf">Tên Danh Mục</label>
                <input type="text" class="form-control" id="intendm" name="in_tlsp" value="<%=tlsp%>">
            </div>
            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <button type="reset" class="btn btn-primary"><a href="themDMSP.jsp" style="color: white"> Hủy</a></button>
        </form>
        <hr> 
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