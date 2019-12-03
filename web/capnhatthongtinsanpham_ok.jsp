<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="model.*"  contentType="text/html" pageEncoding="UTF-8" errorPage="loi.jsp" %>
<%@include file="menuadmin.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String masp = request.getParameter("msp");
    int msp = Integer.parseInt(masp);
    String malsp = request.getParameter("hiep");
    String maloaisp = "1";
    for (Loaisanpham elem : Loaisanpham.layDanhSachLSP()) {
        if (malsp.equals(elem.getTenLoaisanpham())) {
            maloaisp = elem.getMaLoaisanpham();
        }
    }
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
    boolean kq = sp.capnhatSanPham(maloaisp, makm, mabh, tensp, hinhDd, mausac, mtct, trangthaisp, trangthaikd, msp, dg);
    String thongbao = "";
    if (kq == true) {
        Hinhanh ha = new Hinhanh();
        ha.updateHinhanh(msp);
        for (String elem : a) {
            ha.insertHinhanh(msp, elem);
            //System.out.println(elem);
        }
        thongbao = "Cập nhật thông tin thành công!";
    } else {
        thongbao = "Có lỗi khi sửa thông tin sản phẩm. vui lòng kiểm tra lại!!!";
    }

%>
<div class="col-lg-9" style="padding-top: 20px;">
    <div class="container">
        <h3 style="color: #005cbf">Cập Nhật Thông Tin Sản Phẩm</h3>
        <h4 style="color: #005cbf"><% out.write(thongbao);%></h4>
        <hr>
        <table class="table table-striped" style="border: #495057; background-color: white;">
            <thead>
                <tr>
                    <th scope="col">Mã Sản Phẩm</th>
                    <th scope="col">Tên Sản Phẩm</th>
                    <th scope="col">Đơn Giá</th>
                    <th scope="col">Số Lượng</th>
                   
                </tr>
            </thead>
            <tbody>
                <%
                    Sanpham ct = new Sanpham(msp);
                %>
                <tr>
                    <td class="list-group-item-primary"><a href="#"><%=ct.getMasp()%></a></td>
                    <td class="list-group-item-primary"><a href="#"><%=ct.getTensp()%></a></td>
                    <td class="list-group-item-primary"><%=ct.getDongia()%></td>
                    <td class="list-group-item-primary"><%=ct.getSoluong()%></td>
                </tr>
            </tbody>
        </table>
    </div> 
</div>
</div>
</div>
</div>
<%@include file="Footer.html" %>
