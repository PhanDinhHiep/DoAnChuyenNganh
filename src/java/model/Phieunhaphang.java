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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import static model.ketnoiDatabase.DataBase;
import static model.ketnoiDatabase.Driver;
import static model.ketnoiDatabase.Pass;
import static model.ketnoiDatabase.User;

/**
 *
 * @author phand
 */
public class Phieunhaphang implements ketnoiDatabase {

    String nvnhap, ngaynhap;
    int sophieu;

    public Phieunhaphang() {
    }

    public Phieunhaphang(String nvnhap, String ngaynhap, int sophieu) {
        this.nvnhap = nvnhap;
        this.ngaynhap = ngaynhap;
        this.sophieu = sophieu;
    }

    public void setNvnhap(String nvnhap) {
        this.nvnhap = nvnhap;
    }

    public void setNgaynhap(String ngaynhap) {
        this.ngaynhap = ngaynhap;
    }

    public void setSophieu(int sophieu) {
        this.sophieu = sophieu;
    }

    public String getNvnhap() {
        return nvnhap;
    }

    public String getNgaynhap() {
        return ngaynhap;
    }

    public int getSophieu() {
        return sophieu;
    }

    public static int laySoPhieuNhapLonNhat() {
        int kq = 0;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select max(sophieunhap) from phieunhaphang");
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

    public boolean ThemPhieuNhap(int sophieu, String nhanvien, String ngaynhap) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date myDate = format.parse(ngaynhap);
            java.sql.Date sqldate = new java.sql.Date(myDate.getTime());
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into phieunhaphang(sophieunhap, manvnhap, ngaynhap) values(?,?,?)");
            stmt.setInt(1, sophieu);
            stmt.setString(2, nhanvien);
            stmt.setDate(3, sqldate);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException | ParseException e) {
            System.err.print(e);
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        Phieunhaphang s = new Phieunhaphang();
        int so = Phieunhaphang.laySoPhieuNhapLonNhat() + 1;
        Chitietphieunhaphang c = new Chitietphieunhaphang();
        s.ThemPhieuNhap(so, "0935946258", "2019-9-19");
        c.ThemCTPhieuNhap(so, 1, 500);
        System.out.println(Phieunhaphang.laySoPhieuNhapLonNhat());
    }
}
