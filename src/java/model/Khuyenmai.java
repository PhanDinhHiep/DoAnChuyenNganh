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
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import static model.ketnoiDatabase.DataBase;
import static model.ketnoiDatabase.Driver;
import static model.ketnoiDatabase.Pass;
import static model.ketnoiDatabase.User;
import java.text.SimpleDateFormat;

/**
 *
 * @author phand
 */
public class Khuyenmai implements ketnoiDatabase {

    String makhuyenmai, hinhthuckhuyenmai, ngaybatdau, ngayketthuc;
    int mucgiam;

    public Khuyenmai() {
        try {
            Class.forName(Driver);
        } catch (Exception e) {
        }
    }

    public Khuyenmai(String makhuyenmai) {
        this();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select hinhthuckhuyenmai, ngaybatdau, ngayketthuc, mucgiam from khuyenmai where makhuyenmai='" + makhuyenmai + "'");
            if (rs.next()) {
                this.makhuyenmai = makhuyenmai;
                hinhthuckhuyenmai = rs.getString(1);
                ngaybatdau = rs.getString(2);
                ngayketthuc = rs.getString(3);
                mucgiam = rs.getInt(4);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }

    public Khuyenmai(String makhuyenmai, String hinhthuckhuyenmai, String ngaybatdau, String ngayketthuc, int mcugiam) {
        this.makhuyenmai = makhuyenmai;
        this.hinhthuckhuyenmai = hinhthuckhuyenmai;
        this.ngaybatdau = ngaybatdau;
        this.ngayketthuc = ngayketthuc;
        this.mucgiam = mcugiam;
    }

    public void setMakhuyenmai(String makhuyenmai) {
        this.makhuyenmai = makhuyenmai;
    }

    public void setHinhthuckhuyenmai(String hinhthuckhuyenmai) {
        this.hinhthuckhuyenmai = hinhthuckhuyenmai;
    }

    public void setNgaybatdau(String ngaybatdau) {
        this.ngaybatdau = ngaybatdau;
    }

    public void setNgayketthuc(String ngayketthuc) {
        this.ngayketthuc = ngayketthuc;
    }

    public void setMcugiam(int mcugiam) {
        this.mucgiam = mcugiam;
    }

    public String getMakhuyenmai() {
        return makhuyenmai;
    }

    public String getHinhthuckhuyenmai() {
        return hinhthuckhuyenmai;
    }

    public String getNgaybatdau() {
        return ngaybatdau;
    }

    public String getNgayketthuc() {
        return ngayketthuc;
    }

    public int getMcugiam() {
        return mucgiam;
    }

    @Override
    public String toString() {
        return "Khuyenmai{" + "makhuyenmai=" + makhuyenmai + ", hinhthuckhuyenmai=" + hinhthuckhuyenmai + ", ngaybatdau=" + ngaybatdau + ", ngayketthuc=" + ngayketthuc + ", mcugiam=" + mucgiam + '}';
    }

    public static Vector<Khuyenmai> danhSachKhuyenmai() {
        Vector<Khuyenmai> Khuyenmai = new Vector<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select makhuyenmai, hinhthuckhuyenmai, mucgiam, ngaybatdau, ngayketthuc from khuyenmai");
            while (rs.next()) {
                Khuyenmai.add(new Khuyenmai(rs.getString(1), rs.getString(2), rs.getString(4), rs.getString(5), rs.getInt(3)));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return Khuyenmai;
    }

    // lấy tên khuyến mãi
    public static String layTenKM(String makhm) {
        String tenkhuyenmai = "";
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select hinhthuckhuyenmai from khuyenmai where makhuyenmai ='" + makhm + "'");
            if (rs.next()) {
                tenkhuyenmai = rs.getString(1);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException e) {

        }
        return tenkhuyenmai;
    }
    // lấy ma khuyến mãi
    public static String laymaKM(String tenkm) {
        String tenkhuyenmai = "";
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select makhuyenmai from khuyenmai where hinhthuckhuyenmai =N'" + tenkm + "'");
            if (rs.next()) {
                tenkhuyenmai = rs.getString(1);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException e) {

        }
        return tenkhuyenmai;
    }
    // lấy tiền giảm

    public static int layTiengiam(String makhm) {
        int tiengiam = 0;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select mucgiam from khuyenmai where makhuyenmai ='" + makhm + "'");
            if (rs.next()) {
                tiengiam = rs.getInt(1);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException e) {

        }
        return tiengiam;
    }

    // insert khuyến mãi
    public boolean ThemKM(String htkh, int mg, String nbd, String nkt) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into khuyenmai(hinhthuckhuyenmai, mucgiam, ngaybatdau, ngayketthuc) values(?,?,?,?)");
            java.util.Date myDate = format.parse(nbd);
            java.util.Date myDate2 = format.parse(nkt);
            java.sql.Date sqldate = new java.sql.Date(myDate.getTime());
            java.sql.Date sqldate2 = new java.sql.Date(myDate2.getTime());

            stmt.setString(1, htkh);
            stmt.setInt(2, mg);
            stmt.setDate(3, sqldate);
            stmt.setDate(4, sqldate2);
            stmt.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
            return false;
        } catch (ParseException ex) {
            Logger.getLogger(Khuyenmai.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    // cập nhật khuến mãi
    public boolean capnhatKM(String mkm, String htkh, int mg, String nbd, String nkt) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update khuyenmai set hinhthuckhuyenmai  = ?, mucgiam = ?, ngaybatdau = ?, ngayketthuc = ? where makhuyenmai = '"+mkm+"'");
            java.util.Date myDate = format.parse(nbd);
            java.util.Date myDate2 = format.parse(nkt);
            java.sql.Date sqldate = new java.sql.Date(myDate.getTime());
            java.sql.Date sqldate2 = new java.sql.Date(myDate2.getTime());
            
            stmt.setString(1, htkh);
            stmt.setInt(2, mg);
            stmt.setDate(3, sqldate);
            stmt.setDate(4, sqldate2);
            stmt.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
            return false;
        } catch (ParseException ex) {
            Logger.getLogger(Khuyenmai.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }

    public boolean xoaKM(String mkm) {
        try {
            
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("delete khuyenmai where makhuyenmai = '"+mkm+"'");
            stmt.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }
    
    
    public static void main(String[] args) {
        
        Khuyenmai s = new Khuyenmai("KM002");
        System.out.println(Khuyenmai.laymaKM("Giảm giá 20%"));
    }
}
