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
import java.util.ArrayList;

/**
 *
 * @author phand
 */
public class Chitietdonhang implements ketnoiDatabase {

    int sodonhang, giaban, soluong, masanpham;
    String makhuyenmai, ghichu;

    public Chitietdonhang() {
    }

    public Chitietdonhang(int sodonhang, int giaban, int soluong, int masanpham, String makhuyenmai, String ghichu) {
        this.sodonhang = sodonhang;
        this.giaban = giaban;
        this.soluong = soluong;
        this.masanpham = masanpham;
        this.makhuyenmai = makhuyenmai;
        this.ghichu = ghichu;
    }

    public void setSodonhang(int sodonhang) {
        this.sodonhang = sodonhang;
    }

    public void setGiaban(int giaban) {
        this.giaban = giaban;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public void setMasanpham(int masanpham) {
        this.masanpham = masanpham;
    }

    public void setMakhuyenmai(String makhuyenmai) {
        this.makhuyenmai = makhuyenmai;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }

    public int getSodonhang() {
        return sodonhang;
    }

    public int getGiaban() {
        return giaban;
    }

    public int getSoluong() {
        return soluong;
    }

    public int getMasanpham() {
        return masanpham;
    }

    public String getMakhuyenmai() {
        return makhuyenmai;
    }

    public String getGhichu() {
        return ghichu;
    }

    @Override
    public String toString() {
        return "Chitietdonhang{" + "sodonhang=" + sodonhang + ", giaban=" + giaban + ", soluong=" + soluong + ", masanpham=" + masanpham + ", makhuyenmai=" + makhuyenmai + ", ghichu=" + ghichu + '}';
    }

    // insert chi tiết đơn hàng
    public boolean insertChiTietDonHang(int sodonhang, int msp, double giaban, int soluong, String ghichu, String makhuyenmai) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into chitietdonhang values(?,?,?,?,?,?)");
            stmt.setInt(1, sodonhang);
            stmt.setInt(2, msp);
            stmt.setDouble(3, giaban);
            stmt.setInt(4, soluong);
            stmt.setString(5, ghichu);
            stmt.setString(6, makhuyenmai);
            stmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    // lấy chi tiết đơn hàng
    public static ArrayList<Monhang> laychitietDonHang(int sohoadon) {
        ArrayList<Monhang> chdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select chitietdonhang.masp, sanpham.tensanpham, sanpham.mausac, sanpham.dongia ,"
                    + "chitietdonhang.soluong,"
                    + " chitietdonhang.khuyenmai, chitietdonhang.ghichu from sanpham,"
                    + " chitietdonhang where chitietdonhang.masp = sanpham.masp and chitietdonhang.sodonhang = " + sohoadon);
            while (rs.next()) {
                chdh.add(new Monhang(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(6), rs.getString(3)));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return chdh;
    }

    // lấy chi tiết hóa đơn của khách hàng
    public static ArrayList<Monhang> laychitietDonHangkh(int sohoadon, String khachhang) {
        ArrayList<Monhang> chdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select chitietdonhang.masp, sanpham.tensanpham, sanpham.mausac, sanpham.dongia,"
                    + "chitietdonhang.soluong,"
                    + "chitietdonhang.khuyenmai, sanpham.mabaohanh from donhang, sanpham,"
                    + "chitietdonhang where chitietdonhang.masp = sanpham.masp and donhang.sodonhang = chitietdonhang.sodonhang"
                    + " and chitietdonhang.sodonhang =" + sohoadon + " and donhang.khachhang ='" + khachhang + "'");
            while (rs.next()) {
                chdh.add(new Monhang(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getInt(5), rs.getString(7), rs.getString(6), rs.getString(3)));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return chdh;
    }

    // lấy chi tiết đơn hàng chưa giao
    public static ArrayList<Monhang> laychitietDonHang(int sohoadon, String ttdh) {
        ArrayList<Monhang> chdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select chitietdonhang.masp, sanpham.tensanpham, sanpham.mausac, chitietdonhang.giaban,"
                    + "chitietdonhang.soluong,"
                    + "chitietdonhang.khuyenmai, sanpham.mabaohanh from donhang, sanpham,"
                    + "chitietdonhang where chitietdonhang.masp = sanpham.masp and donhang.sodonhang = chitietdonhang.sodonhang"
                    + " and chitietdonhang.sodonhang =" + sohoadon + " and donhang.trangthaidonhang != N'" + ttdh + "'");
            while (rs.next()) {
                chdh.add(new Monhang(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(3)));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return chdh;
    }

    // lấy đơn hàng có trạng thái khác
    public static ArrayList<Monhang> laychitietDonHangKhac() {
        ArrayList<Monhang> chdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select chitietdonhang.masp, sanpham.tensanpham, sanpham.mausac, chitietdonhang.giaban,"
                    + "chitietdonhang.soluong,"
                    + "chitietdonhang.khuyenmai, chitietdonhang.ghichu from donhang, sanpham,"
                    + "chitietdonhang where chitietdonhang.masp = sanpham.masp and donhang.sodonhang = chitietdonhang.sodonhang"
                    + " and donhang.trangthaidonhang != N'Mới đặt hàng' and donhang.trangthaidonhang != N'Đã giao hàng'");
            while (rs.next()) {
                chdh.add(new Monhang(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(3)));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return chdh;
    }
// nhân viên giao hàng lấy chi tiết đơn hàng

    public static ArrayList<Monhang> laychitietDonHangGiaohang(int sohoadon, String nvgh) {
        ArrayList<Monhang> chdh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select chitietdonhang.masp, sanpham.tensanpham, sanpham.mausac, sanpham.dongia ,"
                    + "chitietdonhang.soluong,"
                    + " chitietdonhang.khuyenmai, chitietdonhang.ghichu from sanpham, donhang,"
                    + " chitietdonhang where chitietdonhang.masp = sanpham.masp and donhang.nhanviengiao ='"+nvgh+"' and "
                    + "donhang.sodonhang = chitietdonhang.sodonhang and chitietdonhang.sodonhang = "+sohoadon);
            while (rs.next()) {
                chdh.add(new Monhang(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(6), rs.getString(3)));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return chdh;
    }

    public static void main(String[] args) {
        //System.out.println(laychitietDonHang(5,"Mới đặt hàng"));
        //ArrayList s = Chitietdonhang.laychitietDonHangKhac();
        //s.forEach(System.out::println);
        System.out.println(Chitietdonhang.laychitietDonHangGiaohang(4,"0935946259"));
    }
}
