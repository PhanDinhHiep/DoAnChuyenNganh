<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String malsp = request.getParameter("hiep");
    String maloaisp = "1";
    for (Loaisanpham elem : Loaisanpham.layDanhSachLSP()) {
        if (malsp.equals(elem.getTenLoaisanpham())) {
            maloaisp = elem.getMaLoaisanpham();
        }
    }
    String msp = request.getParameter("msp");
    int masp = Integer.parseInt(msp);
    String tensp = request.getParameter("tensp");
    String soluong = request.getParameter("soluong");
    int sl = Integer.parseInt(soluong);
    String dongia = request.getParameter("dongia");
    int dg = Integer.parseInt(dongia);
    String hinhDd = request.getParameter("hinhdd");
    String khuyenmai = request.getParameter("khuyenmai");
    String makm = "";
    for (Khuyenmai elem : Khuyenmai.danhSachKhuyenmai()) {
        if (khuyenmai.equals(elem.getHinhthuckhuyenmai())) {
            makm = elem.getMakhuyenmai();
        }
    }
    String baohanh = request.getParameter("baohanh");
    String mabh = "";
    for (Baohanh elem : Baohanh.danhSachBaoHanh()) {
        if (baohanh.equals(elem.getHinhthucbaohanh())) {
            mabh = elem.getMabaohanh();
        }
    }
    String mausac = request.getParameter("mau");
    String mtct = request.getParameter("motachitiet");
    String trangthaisp = request.getParameter("ttsp");
    String trangthaikd = request.getParameter("ttkd");
    // hình mô tả
    String hinhMT1 = request.getParameter("hinhmt1");
    String hinhMT2 = request.getParameter("hinhmt2");
    String hinhMT3 = request.getParameter("hinhmt3");
    ArrayList<String> a = new ArrayList<>();
    a.add(hinhMT1);
    a.add(hinhMT2);
    a.add(hinhMT3);
    Sanpham sp = new Sanpham();
    boolean kq = sp.themSanPham(maloaisp, makm, mabh, tensp, hinhDd, mausac, mtct, trangthaisp, trangthaikd, masp, sl, dg);
    String thongbao = "";
    if (kq == true) {
        Hinhanh ha = new Hinhanh();
        for (String elem : a) {
            
            ha.insertHinhanh(masp, elem);
        }
        if (kq) {
            thongbao = "Thêm sản phẩm mới thành công!";
        }
    }
    thongbao = "Có lỗi khi thêm sản phẩm mới. vui lòng kiểm tra lại!!!";
%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h4 style="color: #005cbf">Thêm Loại Sản Phẩm</h4>
        <h4 style="color: #005cbf"><%out.write(thongbao);%></h4>
        <hr>
    </div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
