<%@page import="model.*" contentType="text/html" pageEncoding="utf-8" errorPage="loi.jsp"%>
<%@include file="menuadmin.jsp"%>
<%request.setCharacterEncoding("utf-8");%>
<style type="text/css">
    .hu{
        color: #007bff;
    }
</style>
<div class="col-lg-9" style="padding-top: 20px; padding-bottom:20px;">
    <div class="container">
        <h2 class="text-center hu">Doanh thu</h2>
        <div class="container" style="margin: auto">
            <div class="col-md-auto order-md-1">

                <form method="post" action="xemdoanhthu">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Từ ngày</label>
                        <input type="date" class="form-control" name="nbd"   id="firstName" value="<%%>" placeholder=""  required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Đến ngày</label>
                        <input type="date" class="form-control" name="nkt"   id="firstName" value="<%%>" placeholder=""  required>
                    </div>
                </div>
                <div class="form-group shadow-textarea">
                    <button class="col-md-5 btn btn-primary btn-lg" type="submit">Xem doanh thu</button>
                    <button class="col-md-5 btn btn-primary btn-lg" type="reset">Hủy</button>
                </div>  
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html"%>