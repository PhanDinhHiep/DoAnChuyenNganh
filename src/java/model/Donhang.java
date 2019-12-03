/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Vector;

/**
 *
 * @author phand
 */
public class Donhang implements ketnoiDatabase {

    int sodonhang;
    double tongtien;
    String khachhang, sodtnv, nhanviengiao, mahttt, diachigiao, ghichu, ngaydat, ngaygiaohang, trangthaidonhang;

    public Donhang() {
    }

    public boolean XoaCTDH(int sodh) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("delete chitietdonhang where sodonhang =" + sodh);
            int rs = stmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            return false;
        }
        return true;
    }
    public boolean XoaDH(int sodh) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("delete donhang where sodonhang =" + sodh);
            int rs = stmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            return false;
        }
        return true;
    }
    public Donhang(int sodonhang, double tongtien, String khachhang, String sodtnv, String nhanviengiao, String mahttt, String diachigiao, String ghichu, String ngaydat, String ngaygiaohang, String trangthaidonhang) {
        this.sodonhang = sodonhang;
        this.tongtien = tongtien;
        this.khachhang = khachhang;
        this.sodtnv = sodtnv;
        this.nhanviengiao = nhanviengiao;
        this.mahttt = mahttt;
        this.diachigiao = diachigiao;
        this.ghichu = ghichu;
        this.ngaydat = ngaydat;
        this.ngaygiaohang = ngaygiaohang;
        this.trangthaidonhang = trangthaidonhang;
    }

    public void setSodonhang(int sodonhang) {
        this.sodonhang = sodonhang;
    }

    public void setTongtien(int tongtien) {
        this.tongtien = tongtien;
    }

    public void setKhachhang(String khachhang) {
        this.khachhang = khachhang;
    }

    public void setSodtnv(String sodtnv) {
        this.sodtnv = sodtnv;
    }

    public void setNhanviengiao(String nhanviengiao) {
        this.nhanviengiao = nhanviengiao;
    }

    public void setMahttt(String mahttt) {
        this.mahttt = mahttt;
    }

    public void setDiachigiao(String diachigiao) {
        this.diachigiao = diachigiao;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }

    public void setNgaydat(String ngaydat) {
        this.ngaydat = ngaydat;
    }

    public void setNgaygiaohang(String ngaygiaohang) {
        this.ngaygiaohang = ngaygiaohang;
    }

    public void setTrangthaidonhang(String trangthaidonhang) {
        this.trangthaidonhang = trangthaidonhang;
    }

    public int getSodonhang() {
        return sodonhang;
    }

    public double getTongtien() {
        return tongtien;
    }

    public String getKhachhang() {
        return khachhang;
    }

    public String getSodtnv() {
        return sodtnv;
    }

    public String getNhanviengiao() {
        return nhanviengiao;
    }

    public String getMahttt() {
        return mahttt;
    }

    public String getDiachigiao() {
        return diachigiao;
    }

    public String getGhichu() {
        return ghichu;
    }

    public String getNgaydat() {
        return ngaydat;
    }

    public String getNgaygiaohang() {
        return ngaygiaohang;
    }

    public String getTrangthaidonhang() {
        return trangthaidonhang;
    }

    @Override
    public String toString() {
        return "Donhang{" + "sodonhang=" + sodonhang + ", tongtien=" + tongtien + ", khachhang=" + khachhang + ", sodtnv=" + sodtnv + ", nhanviengiao=" + nhanviengiao + ", mahttt=" + mahttt + ", diachigiao=" + diachigiao + ", ghichu=" + ghichu + ", ngaydat=" + ngaydat + ", ngaygiaohang=" + ngaygiaohang + ", trangthaidonhang=" + trangthaidonhang + '}';
    }

// lấy số đơn hàng lớn nhất
    public static int laySoDonHangLonNhat() {
        int kq = 0;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select max(sodonhang) from donhang");
            if (rs.next()) {
                kq = rs.getInt(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return 0;
        }
        return kq;
    }

// lấy chi tiết đơn hàng
    public static Donhang layCTdonhang(int sodh) {
        Donhang ct = new Donhang();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from donhang where sodonhang=" + sodh);
            if (rs.next()) {
                ct.sodonhang = sodh;
                ct.ngaydat = rs.getString("ngaydathang");
                ct.khachhang = rs.getString("khachhang");
                ct.sodtnv = rs.getString("sodtnv");
                ct.nhanviengiao = rs.getString("nhanviengiao");
                ct.mahttt = rs.getString("mahttt");
                ct.diachigiao = rs.getString("diachigiao");
                ct.ghichu = rs.getString("ghichu");
                ct.ngaygiaohang = rs.getString("ngaygiao");
                ct.trangthaidonhang = rs.getString("trangthaidonhang");
                ct.tongtien = rs.getInt("tongtien");
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return ct;
    }

// lấy chi tiết đơn hàng nhân viên giao hàng
    public static Donhang layCTdonhang(int sodh, String nvgh) {
        Donhang ct = new Donhang();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from donhang where sodonhang=" + sodh + " and nhanviengiao = '" + nvgh + "'");
            if (rs.next()) {
                ct.sodonhang = sodh;
                ct.ngaydat = rs.getString("ngaydathang");
                ct.khachhang = rs.getString("khachhang");
                ct.sodtnv = rs.getString("sodtnv");
                ct.nhanviengiao = rs.getString("nhanviengiao");
                ct.mahttt = rs.getString("mahttt");
                ct.diachigiao = rs.getString("diachigiao");
                ct.ghichu = rs.getString("ghichu");
                ct.ngaygiaohang = rs.getString("ngaygiao");
                ct.trangthaidonhang = rs.getString("trangthaidonhang");
                ct.tongtien = rs.getInt("tongtien");
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return ct;
    }

    // nhân viên giao hàng cập nhật trạng thái sau khi giao hàng\
    public boolean NVGHdagiao(int sodh) {
        try {
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            //String strDate = formatter.format(date);
            java.sql.Date sqldate = new java.sql.Date(date.getTime());
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update donhang set trangthaidonhang =N'Đã giao hàng', ngaygiao ='"+sqldate+"' where sodonhang =" + sodh);
            
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    // nhân viên giao hàng cập nhật trạng thái sau khi giao hàng\
    public boolean NVGHchuagiao(int sodh, String lydo, String trangthai) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update donhang set trangthaidonhang =?, ghichu = ? where sodonhang =" + sodh);
            stmt.setString(1, trangthai);
            stmt.setString(2, lydo);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }
//kh Lấy địa chỉ giao hàng của đơn hàng

    public static String laySoDiachigiao(int shd, String sdtkh) {
        String diachi = "";
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select diachigiao from donhang where sodonhang =" + shd + "and khachhang = '" + sdtkh + "'");
            if (rs.next()) {
                diachi = rs.getString(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return diachi;
    }

    public boolean insertDonHang(int sohd, String sdtkh, String mahttt, String diachigiao, String ghichu, String trangthaidh) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into donhang(sodonhang,khachhang,mahttt,diachigiao,ghichu,"
                    + "trangthaidonhang) values(?,?,?,?,?,?)");
            stmt.setInt(1, sohd);
            stmt.setString(2, sdtkh);
            stmt.setString(3, mahttt);
            stmt.setString(4, diachigiao);
            stmt.setString(5, ghichu);
            stmt.setString(6, trangthaidh);

            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.err.print(e);
            return false;
        }
        return true;
    }
// kh Lấy đơn hàng mới đặt của khách hàng

    public static ArrayList layDonHangMoidat(String sdtkh) {
        ArrayList<Donhang> dsdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from donhang where trangthaidonhang =N'Mới đặt hàng' and khachhang ='" + sdtkh + "'");
            while (rs.next()) {
                dsdh.add(new Donhang(rs.getInt("sodonhang"), rs.getInt("tongtien"), rs.getString("khachhang"), rs.getString("sodtnv"), rs.getString("nhanviengiao"), rs.getString("mahttt"), rs.getString("diachigiao"), rs.getString("ghichu"), rs.getString("ngaydathang"), rs.getString("ngaygiao"), rs.getString("trangthaidonhang")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsdh;
    }
// ad Lấy đơn hàng mới đặt

    public static Vector<Donhang> layDonHangMoi() {
        Vector<Donhang> dsdh = new Vector<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from donhang where trangthaidonhang =N'Mới đặt hàng'");
            while (rs.next()) {
                dsdh.add(new Donhang(rs.getInt("sodonhang"), rs.getInt("tongtien"), rs.getString("khachhang"), rs.getString("sodtnv"), rs.getString("nhanviengiao"), rs.getString("mahttt"), rs.getString("diachigiao"), rs.getString("ghichu"), rs.getString("ngaydathang"), rs.getString("ngaygiao"), rs.getString("trangthaidonhang")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsdh;
    }
// ad lấy đơn hàng đang xử lý

    public static ArrayList layDonHangDangXuLy() {
        ArrayList<Donhang> dsdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from donhang where trangthaidonhang =N'Đang xử lý'");
            while (rs.next()) {
                dsdh.add(new Donhang(rs.getInt("sodonhang"), rs.getInt("tongtien"), rs.getString("khachhang"), rs.getString("sodtnv"), rs.getString("nhanviengiao"), rs.getString("mahttt"), rs.getString("diachigiao"), rs.getString("ghichu"), rs.getString("ngaydathang"), rs.getString("ngaygiao"), rs.getString("trangthaidonhang")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsdh;
    }
// ad lấy đơn hàng đã giao

    public static ArrayList<Donhang> layDonHangDaGiao() {
        ArrayList<Donhang> dsdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from donhang where trangthaidonhang =N'Đã giao hàng'");
            while (rs.next()) {
                dsdh.add(new Donhang(rs.getInt("sodonhang"), rs.getInt("tongtien"), rs.getString("khachhang"), rs.getString("sodtnv"), rs.getString("nhanviengiao"), rs.getString("mahttt"), rs.getString("diachigiao"), rs.getString("ghichu"), rs.getString("ngaydathang"), rs.getString("ngaygiao"), rs.getString("trangthaidonhang")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsdh;
    }

//kh lấy đơn hàng đã xong của khách hàng
    public static ArrayList layDonHangDaXong(String sdtkh) {
        ArrayList<Donhang> dsdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from donhang where trangthaidonhang =N'Đã giao hàng' and khachhang ='" + sdtkh + "'");
            while (rs.next()) {
                dsdh.add(new Donhang(rs.getInt("sodonhang"), rs.getInt("tongtien"), rs.getString("khachhang"), rs.getString("sodtnv"), rs.getString("nhanviengiao"), rs.getString("mahttt"), rs.getString("diachigiao"), rs.getString("ghichu"), rs.getString("ngaydathang"), rs.getString("ngaygiao"), rs.getString("trangthaidonhang")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsdh;
    }

//kh Hủy đơn hàng của khách hàng. 
    public boolean huyDonHang(int sohoadon, String lydohuy) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update donhang set trangthaidonhang = ? where sodonhang =" + sohoadon);
            stmt.setString(1, lydohuy);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }
//kh lấy đơn hàng khác hai trạng thái đã giao và mới đặt

    public static ArrayList layDonHangKhac(String sdtkh) {
        ArrayList<Donhang> dsdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from donhang where trangthaidonhang !=N'Đã giao hàng' and trangthaidonhang !=N'Mới đặt hàng' and khachhang ='" + sdtkh + "'");
            while (rs.next()) {
                dsdh.add(new Donhang(rs.getInt("sodonhang"), rs.getInt("tongtien"), rs.getString("khachhang"), rs.getString("sodtnv"), rs.getString("nhanviengiao"), rs.getString("mahttt"), rs.getString("diachigiao"), rs.getString("ghichu"), rs.getString("ngaydathang"), rs.getString("ngaygiao"), rs.getString("trangthaidonhang")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsdh;
    }

// admin duyệt đơn hàng và chỉ định nhân viên giao hàng 
    public boolean duyetDH(String nvduyet, String nvgiao, int sohd) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update donhang set sodtnv = ?, nhanviengiao = ?, trangthaidonhang =N'Đang xử lý' where sodonhang =" + sohd);
            stmt.setString(1, nvduyet);
            stmt.setString(2, nvgiao);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    // Lấy doanh thu theo ngày bắt đầu và ngày kết thúc
    public static int layDoanhThu(String ngaydau, String ngaycuoi) {
        int doanhthu = 0;
        String sql = "select sum(tongtien) from donhang where ngaydathang between '" + ngaydau + "' and '" + ngaycuoi + "' and trangthaidonhang = N'Đã giao hàng'";
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                doanhthu = doanhthu + rs.getInt(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return 0;
        }
        return doanhthu;
    }

    // lấy đơn hàng được giao cho nhân viên giao hàng
    public static ArrayList layDonHangDuocGiao(String nvgiao) {
        ArrayList<Donhang> dsdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from donhang where nhanviengiao ='" + nvgiao + "' and trangthaidonhang = N'Đang xử lý'");
            while (rs.next()) {
                dsdh.add(new Donhang(rs.getInt("sodonhang"), rs.getInt("tongtien"), rs.getString("khachhang"), rs.getString("sodtnv"), rs.getString("nhanviengiao"), rs.getString("mahttt"), rs.getString("diachigiao"), rs.getString("ghichu"), rs.getString("ngaydathang"), rs.getString("ngaygiao"), rs.getString("trangthaidonhang")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsdh;
    }

    // lấy đơn hàng hoàn thành của nhân viên giao hàng
    public static ArrayList layDonHangHoanthanh(String nvgiao) {
        ArrayList<Donhang> dsdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from donhang where nhanviengiao ='" + nvgiao + "' and trangthaidonhang = N'Đã giao hàng'");
            while (rs.next()) {
                dsdh.add(new Donhang(rs.getInt("sodonhang"), rs.getInt("tongtien"), rs.getString("khachhang"), rs.getString("sodtnv"), rs.getString("nhanviengiao"), rs.getString("mahttt"), rs.getString("diachigiao"), rs.getString("ghichu"), rs.getString("ngaydathang"), rs.getString("ngaygiao"), rs.getString("trangthaidonhang")));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsdh;
    }

    // nhân viên giao hàng cập nhật trạng thái đơn hàng
    public boolean dagiaohang(int sohoadon) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update donhang set trangthaidonhang = N'Đã giao hàng' where sodonhang =" + sohoadon);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    // danh
    public static void main(String[] args) {
        //System.out.println(Donhang.layDoanhThu("2018-11-01", "2018-12-01"));
        Donhang s = new Donhang();
        //System.out.println(s.NVGHdagiao(3));
        //s.insertDonHang(1, "0909090909", "TTKNH", "NULL", "", "", 0);
        //System.out.println(s.huyDonHang(1, "chiatay"));
        //System.out.println(Donhang.layCTdonhang(3));
        /*s.duyetDH("0935946258", "0935946259", 3);
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        String time = sdf.format(date.getTime());
        String strDate = formatter.format(date);
        System.out.println(strDate+time);
        */
        HashMap n = new HashMap();
        n.put("ga", "Hiệp");
        System.out.println(Donhang.layDonHangMoi().size());
    }
}
