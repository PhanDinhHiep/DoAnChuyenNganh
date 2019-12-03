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
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import static model.ketnoiDatabase.DataBase;
import static model.ketnoiDatabase.Driver;
import static model.ketnoiDatabase.Pass;
import static model.ketnoiDatabase.User;

/**
 *
 * @author phand
 */
public class Baohanh implements ketnoiDatabase {

    String mabaohanh, hinhthucbaohanh, mota;
    int thoigianbaohanh;

    public Baohanh() {
        try {
            Class.forName(Driver);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Baohanh(String mabaohanh) {
        this();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select hinhthucbaohanh, thoigianbaohanh, mota from baohanh where mabaohanh='" + mabaohanh + "'");
            if (rs.next()) {
                this.mabaohanh = mabaohanh;
                hinhthucbaohanh = rs.getString(1);
                thoigianbaohanh = rs.getInt(2);
                mota = rs.getString(3);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }
    public Baohanh(String mabaohanh, String hinhthucbaohanh, String mota, int thoigianbaohanh) {
        this.mabaohanh = mabaohanh;
        this.hinhthucbaohanh = hinhthucbaohanh;
        this.mota = mota;
        this.thoigianbaohanh = thoigianbaohanh;
    }

    public String getMabaohanh() {
        return mabaohanh;
    }

    public String getHinhthucbaohanh() {
        return hinhthucbaohanh;
    }

    public String getMota() {
        return mota;
    }

    public int getThoigianbaohanh() {
        return thoigianbaohanh;
    }

    public void setMabaohanh(String mabaohanh) {
        this.mabaohanh = mabaohanh;
    }

    public void setHinhthucbaohanh(String hinhthucbaohanh) {
        this.hinhthucbaohanh = hinhthucbaohanh;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public void setThoigianbaohanh(int thoigianbaohanh) {
        this.thoigianbaohanh = thoigianbaohanh;
    }

    @Override
    public String toString() {
        return "Baohanh{" + "mabaohanh=" + mabaohanh + ", hinhthucbaohanh=" + hinhthucbaohanh + ", mota=" + mota + ", thoigianbaohanh=" + thoigianbaohanh + '}';
    }

    public static Vector<Baohanh> danhSachBaoHanh() {
        Vector<Baohanh> Baohanh = new Vector<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select mabaohanh, hinhthucbaohanh, thoigianbaohanh, mota from baohanh");
            while (rs.next()) {
                Baohanh.add(new Baohanh(rs.getString(1), rs.getString(2), rs.getString(4), rs.getInt(3)));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return Baohanh;
    }

    // lấy bảo hành
    public static String layTenBH(String mabh) {
        String tenbaohanh = "";
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select hinhthucbaohanh from baohanh where mabaohanh ='" + mabh + "'");
            if (rs.next()) {
                tenbaohanh = rs.getString(1);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
        return tenbaohanh;
    }
    
    // lấy mã baohanh
    public static String layMaBH(String mabh) {
        String tenbaohanh = "";
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select mabaohanh from baohanh where hinhthucbaohanh =N'" + mabh + "'");
            if (rs.next()) {
                tenbaohanh = rs.getString(1);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
        return tenbaohanh;
    }

    // thêm khuyến mãi
    public boolean themBaoHanh(String hinhthucbh, int thoigianbh, String mota) {
        try {
            Class.forName(Driver);
            try (Connection con = DriverManager.getConnection(DataBase, User, Pass)) {
                PreparedStatement stmt = con.prepareStatement("insert into baohanh(hinhthucbaohanh, thoigianbaohanh, mota) values(?,?,?)");
                stmt.setString(1, hinhthucbh);
                stmt.setInt(2, thoigianbh);
                stmt.setString(3, mota);
                stmt.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    // cập nhật bảo hành
    public boolean capnhatBaoHanh(String mbh, String htbh, int tg, String mt) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update baohanh set hinhthucbaohanh = ?, thoigianbaohanh = ?, mota = ? where mabaohanh = '" + mbh + "'");
            stmt.setString(1, htbh);
            stmt.setInt(2, tg);
            stmt.setString(3, mt);
            stmt.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }

    // xóa bảo hành
    public boolean xoaBaoHanh(String mdh) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("delete baohanh where mabaohanh = '" + mdh + "'");
            stmt.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }
    public static void main(String[] args) {
        Baohanh s = new Baohanh("BH001");
        System.out.println(Baohanh.layMaBH("Bảo hành 3 tháng"));
        //System.out.println(s.themBaoHanh("Không bảo hành", 0, "Không bảo hành"));
    }
}
