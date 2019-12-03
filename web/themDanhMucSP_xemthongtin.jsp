<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Bạn muốn thêm danh này không?</h4>
        <form method="post" action="themDanhMucSP_ok.jsp">
            <div class="form-group">
                <label style="color: #005cbf">Mã Danh Mục</label>
                <input type="text" class="form-control" id="inmadm"  name="in_mdm" readonly="" value="<%=request.getParameter("in_madanhmuc")%>">
            </div>
            <div class="form-group">
                <label style="color: #005cbf">Tên Danh Mục</label>
                <input type="text" class="form-control" id="intendm"  name="in_tdm" value="<%=request.getParameter("in_tendanhmuc")%>">
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
