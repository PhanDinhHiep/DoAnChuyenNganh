/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.itextpdf.text.Chapter;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author phand
 */
public class file {

    static Date date;
    public static final String FONT = "resources/fonts/FreeSans.ttf";

    public static void Ghihoadon(String tenfile, String tenkhach, String sodtkh, int sodonhang, String ngaydat,
            String hinhthuctt, String diachigiao, ArrayList<Monhang> dsmh, double tongtien) throws IOException {
        date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat sdf = new SimpleDateFormat("HH-mm-ss");
        String time = sdf.format(date.getTime());
        String strDate = formatter.format(date);
        String ngay = date.toString();
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        try {

            // Tạo đối tượng PdfWriter
            PdfWriter.getInstance(document, new FileOutputStream("F:\\" + tenfile + sodonhang + "_" + strDate + "_" + time + "S" + ".pdf"));
            // Mở file để thực hiện ghi
            document.open();
            Font fontbt = new Font(BaseFont.createFont("E:\\JAVA\\java2\\vu-arial-vp\\vuArial.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED));
            Font fontdam = new Font(BaseFont.createFont("E:\\JAVA\\java2\\vu-arial-vp\\vuArialBold.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED));
            Font fontdamnghieng = new Font(BaseFont.createFont("E:\\JAVA\\java2\\vu-arial-vp\\vuArialBoldItalic.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED));
            Font fontnghieng = new Font(BaseFont.createFont("E:\\JAVA\\java2\\vu-arial-vp\\vuArialItalic.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED));
            // Thêm nội dung sử dụng add function
            Paragraph tenshop = new Paragraph("Ví & Thắt Lưng TANAKA", fontdamnghieng);
            Paragraph diachishop = new Paragraph("40 Trưng Nữ Vương, Bình Hiên, Hải Châu, Tp Đà Nẵng \n Liên Hệ: 0935120110 - 0935930039", fontnghieng);
            Chapter chapter1 = new Chapter(tenshop, 1);
            chapter1.setNumberDepth(0);
            Paragraph title1 = new Paragraph("HÓA ĐƠN BÁN HÀNG", fontdam);
            title1.setAlignment(Element.ALIGN_CENTER);
            Paragraph sohoadon = new Paragraph("Số hóa đơn:   " + String.valueOf(sodonhang), fontbt);
            Paragraph khachhang = new Paragraph("Khách hàng:   " + tenkhach + "-" + sodtkh, fontbt);
            Paragraph ngaydathang = new Paragraph("Ngày đặt hàng:   " + ngaydat, fontbt);
            Paragraph hinhthucthanhtoan = new Paragraph("Hình thức thanh toán:   " + hinhthuctt, fontbt);
            Paragraph diachogiao = new Paragraph("Địa chỉ giao hàng", fontdam);
            Paragraph diachi = new Paragraph(diachigiao, fontbt);
            Paragraph tien = new Paragraph("Tổng thành tiền:   " + FotmatSo.fm(tongtien), fontdam);
            tien.setAlignment(Element.ALIGN_LEFT);
            diachi.setIndentationLeft(80);
            PdfPTable t = new PdfPTable(6);
            t.setSpacingBefore(25);
            t.setSpacingAfter(25);
            PdfPCell c1 = new PdfPCell(new Phrase("Số tt", fontdam));
            t.addCell(c1);
            PdfPCell c2 = new PdfPCell(new Phrase("Tên sản phẩm", fontdam));
            t.addCell(c2);
            PdfPCell c3 = new PdfPCell(new Phrase("Số lượng", fontdam));
            t.addCell(c3);
            PdfPCell c4 = new PdfPCell(new Phrase("Đơn giá", fontdam));
            t.addCell(c4);
            PdfPCell c = new PdfPCell(new Phrase("Khuyến mãi", fontdam));
            t.addCell(c);
            PdfPCell c5 = new PdfPCell(new Phrase("Thành tiền", fontdam));
            t.addCell(c5);
            int i = 1;
            double tong = 0;
            for (Monhang element : dsmh) {
                tong = tong + element.getDongia() * element.getSoluong() - ((element.getDongia() * Khuyenmai.layTiengiam(element.getMakhuyenmai())) / 100) * element.getSoluong();
                t.addCell(i + "");
                t.addCell(new Phrase(element.getTenmh(), fontbt));
                t.addCell(new Phrase(element.getSoluong() + "", fontbt));
                t.addCell(new Phrase(FotmatSo.fm(element.getDongia()), fontbt));
                t.addCell(new Phrase(Khuyenmai.layTenKM(element.getMakhuyenmai()), fontbt));
                t.addCell(new Phrase(FotmatSo.fm(element.getDongia() * element.getSoluong() - ((element.getDongia() * Khuyenmai.layTiengiam(element.getMakhuyenmai())) / 100) * element.getSoluong()), fontbt));
                i++;
            }
            //Paragraph tenkhach = new Paragraph("Phan Đình Hiệp", font);
            //document.add(new Paragraph("Viblo Asia"));
            document.add(chapter1);
            document.add(diachishop);
            document.add(title1);
            document.add(sohoadon);
            document.add(khachhang);
            document.add(ngaydathang);
            document.add(hinhthucthanhtoan);
            document.add(diachogiao);
            document.add(diachi);
            document.add(t);
            document.add(tien);
            //Anchor anchorTarget = new Anchor("First page of the document.");
            //anchorTarget.setName("BackToTop");
            //document.add(anchorTarget);
            // Đóng File
            document.close();
            System.out.println("Write file succes!");
        } catch (FileNotFoundException | DocumentException e) {
            e.printStackTrace();
        }
    }

    // ghi danh sách bán chạy
    public static void GhiDSBC(String tenfile, ArrayList<Sanpham> dsmh) throws IOException {
        date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat sdf = new SimpleDateFormat("HH-mm-ss");
        String time = sdf.format(date.getTime());
        String strDate = formatter.format(date);
        String ngay = date.toString();
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        try {

            // Tạo đối tượng PdfWriter
            PdfWriter.getInstance(document, new FileOutputStream("F:\\" + tenfile + "_" + strDate + "_" + time + "S" + ".pdf"));
            // Mở file để thực hiện ghi
            document.open();
            Font fontbt = new Font(BaseFont.createFont("E:\\JAVA\\java2\\vu-arial-vp\\vuArial.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED));
            Font fontdam = new Font(BaseFont.createFont("E:\\JAVA\\java2\\vu-arial-vp\\vuArialBold.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED));
            Font fontdamnghieng = new Font(BaseFont.createFont("E:\\JAVA\\java2\\vu-arial-vp\\vuArialBoldItalic.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED));
            Font fontnghieng = new Font(BaseFont.createFont("E:\\JAVA\\java2\\vu-arial-vp\\vuArialItalic.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED));
            // Thêm nội dung sử dụng add function
            Paragraph tenshop = new Paragraph("Ví & Thắt Lưng TANAKA", fontdamnghieng);
            Paragraph diachishop = new Paragraph("40 Trưng Nữ Vương, Bình Hiên, Hải Châu, Tp Đà Nẵng \n Liên Hệ: 0935120110 - 0935930039", fontnghieng);
            Chapter chapter1 = new Chapter(tenshop, 1);
            chapter1.setNumberDepth(0);
            Paragraph title1 = new Paragraph("DANH SÁCH SẢN PHẨM BÁN CHẠY", fontdam);
            title1.setAlignment(Element.ALIGN_CENTER);
            Paragraph ngayghi = new Paragraph("Ngày in "+strDate, fontnghieng);
            ngayghi.setAlignment(Element.ALIGN_RIGHT);
            PdfPTable t = new PdfPTable(4);
            t.setSpacingBefore(25);
            t.setSpacingAfter(25);
            PdfPCell c1 = new PdfPCell(new Phrase("Số tt", fontdam));
            t.addCell(c1);
            PdfPCell c2 = new PdfPCell(new Phrase("Mã sản phẩm", fontdam));
            t.addCell(c2);
            PdfPCell c3 = new PdfPCell(new Phrase("Tên sản phẩm", fontdam));
            t.addCell(c3);
            PdfPCell c4 = new PdfPCell(new Phrase("Số lượng đã bán", fontdam));
            t.addCell(c4);
            int i = 1;
            double tong = 0;
            for (Sanpham element : dsmh) {
                t.addCell(i + "");
                t.addCell(new Phrase(element.getMasp()+"", fontbt));
                t.addCell(new Phrase(element.getTensp(), fontbt));
                t.addCell(new Phrase(element.getSoluong()+"", fontbt));              
                i++;
            }
            //Paragraph tenkhach = new Paragraph("Phan Đình Hiệp", font);
            //document.add(new Paragraph("Viblo Asia"));
            document.add(chapter1);
            document.add(diachishop);
            document.add(title1);
            document.add(t);
            document.add(ngayghi);
            //Anchor anchorTarget = new Anchor("First page of the document.");
            //anchorTarget.setName("BackToTop");
            //document.add(anchorTarget);
            // Đóng File
            document.close();
            System.out.println("Write file succes!");
        } catch (FileNotFoundException | DocumentException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) throws DocumentException, IOException {
        //date = new Date();
        //Donhang cthd = Donhang.layCTdonhang(4);
        //ArrayList dh = Chitietdonhang.laychitietDonHang(4);
        //Ghihoadon("ĐHS", "Phan Đình Hiệp", "0935946258", cthd.getSodonhang(), "20/10/2018", "Thanh toán khi nhận hàng", "Hải châu, Đà Nẵng, Việt Nam", dh, cthd.getTongtien());
        //ArrayList dh = Sanpham.ArraydanhSachSanPhamBanchay();
        //GhiDSBC("hiep", dh);
    }
}
