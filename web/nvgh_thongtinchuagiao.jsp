<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menunvgh.jsp" %>
<%    request.setCharacterEncoding("utf-8");
    int sodh = Integer.parseInt(request.getParameter("shd"));
    String lydo = request.getParameter("lydo");
    String tuychon = request.getParameter("tuychon");
%>
<!-- /.col-lg-3 -->
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <form method="post" action="nvgh_chuagiao.jsp">
        <h2 class="text-center hu">Chắc chắn là đơn hàng này không giao được???</h2>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="firstName">Số Hóa Đơn</label>
                <input type="text" class="form-control" name="shd" readonly=""  id="firstName" placeholder="" value="<%=sodh%>" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="firstName">Trạng thái</label>
                <input type="text" class="form-control" name="tuychon" readonly=""  id="firstName" placeholder="" value="<%=tuychon%>" required>
            </div>
            <div class="col-lg-9">
                <div class="form-group shadow-textarea">
                    <label for="exampleFormControlTextarea6">Lý do không giao được hàng</label>
                    <textarea class="form-control z-depth-1" name="lydo" id="ckeditor1" rows="5" ><%=lydo%></textarea>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 mb-3" style="padding-left: 30px;">
                <button class="col-lg-12 btn btn-primary" type="reset" onclick="javascpipt:history.go(-1)">Trở lại</button>
            </div>
            <div class="col-md-3 mb-3">
                <button class="col-lg-12 btn btn-primary" type="submit">Chưa giao</button>
            </div>  
        </div>
    </form>
</div>
</div>    
</div>
<%@ include file="Footer.html" %>