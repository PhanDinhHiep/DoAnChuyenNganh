<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%
    String mkm = request.getParameter("mkm");
    Khuyenmai s = new Khuyenmai(mkm);
%>
<!-- /.col-lg-3 -->
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center hu">Cập nhật khuyến mãi</h2>
        <div class="container" style="margin: auto">
            <div class="col-md-auto order-md-1">

                <form method="post" action="ad_capnhatkmok.jsp">
                <div class="row">
                    
                    <div class="col-md-6 mb-3">
                        <label for="firstName">Hình thức khuyến mãi</label>
                        <input type="hidden" class="form-control" name="mkm"   id="firstName" placeholder="" value="<%=s.getMakhuyenmai()%>" required>

                        <input type="text" class="form-control" name="ht"   id="firstName" placeholder="" value="<%=s.getHinhthuckhuyenmai()%>" required>

                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Mức giảm</label>
                        <input type="number" class="form-control" name="mg"   id="firstName" value="<%=s.getMcugiam()%>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Ngày bắt đầu</label>
                        <input type="date" class="form-control" name="nbd"   id="firstName" value="<%=s.getNgaybatdau()%>" placeholder=""  required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Ngày kết thúc</label>
                        <input type="date" class="form-control" name="nkt"   id="firstName" value="<%=s.getNgayketthuc()%>" placeholder=""  required>
                    </div>
                </div>
                <div class="form-group shadow-textarea">
                    <button class="col-md-5 btn btn-primary btn-lg" type="submit">Cập nhật</button>
                    <button class="col-md-5 btn btn-primary btn-lg" type="reset">Hủy</button>
                </div>  
                </form>
            </div>
        </div>
    </div>
</div>
</div>    
</div>
<%@ include file="Footer.html" %>