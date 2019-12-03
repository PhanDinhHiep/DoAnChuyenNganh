<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    int sodh = Integer.parseInt(request.getParameter("shd"));
    Donhang ctdh = Donhang.layCTdonhang(sodh);
    ArrayList<Monhang> dsmh = Chitietdonhang.laychitietDonHang(sodh);
    file.Ghihoadon("ĐHS", Khachhang.laytenkh(ctdh.getKhachhang()), ctdh.getKhachhang(),
            ctdh.getSodonhang(), ctdh.getNgaydat(),
            Hinhthucthanhtoan.laytenHHTTT(ctdh.getMahttt()),
            ctdh.getDiachigiao(), dsmh, ctdh.getTongtien());
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Thông Báo</h4>
        <h4 style="color: #005cbf"><% out.write("Đã in hóa đơn");%></h4>
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
