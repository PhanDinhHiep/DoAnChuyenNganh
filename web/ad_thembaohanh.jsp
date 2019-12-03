<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%
%>
<!-- /.col-lg-3 -->
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center hu">Thêm Khuyến Mãi</h2>
        <div class="container" style="margin: auto">
            <div class="col-md-auto order-md-1">

                <form method="post" action="ad_thembaohanhok.jsp">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">Hình thức bảo hành</label>
                            <input type="text" class="form-control" name="ht"   id="firstName" placeholder=""  required>

                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Thời gian</label>
                            <input type="number" class="form-control" name="tg"   id="firstName" placeholder="Số ngày"  required>
                        </div>
                    </div>
                    <div class="form-group shadow-textarea">
                        <label for="exampleFormControlTextarea6">Mô tả chi tiết</label>
                        <textarea class="form-control z-depth-1" name="mota" id="ckeditor1" rows="5" placeholder="Viết mô tả ở đây..." required=""></textarea>
                    </div>
                    <script>
                        var editor = CKEDITOR.replace('ckeditor1');
                       
                    </script>

                    <div>
                        <button class="col-md-5 btn btn-primary btn-lg" type="submit">Thêm bảo hành</button>
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