/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author phand
 */
public class Hinhanh implements ketnoiDatabase {

    int mahinh, msp;
    String noidung;

    public Hinhanh() {
    }

    public Hinhanh(int mahinh, int msp, String noidung) {
        this.mahinh = mahinh;
        this.msp = msp;
        this.noidung = noidung;
    }

    public void setMahinh(int mahinh) {
        this.mahinh = mahinh;
    }

    public void setMsp(int msp) {
        this.msp = msp;
    }

    public void setNoidung(String noidung) {
        this.noidung = noidung;
    }

    public int getMahinh() {
        return mahinh;
    }

    public int getMsp() {
        return msp;
    }

    public String getNoidung() {
        return noidung;
    }

    @Override
    public String toString() {
        return "Hinhanh{" + "mahinh=" + mahinh + ", msp=" + msp + ", noidung=" + noidung + '}';
    }

    // insert hình ảnh
    public boolean insertHinhanh(int masp, String noidung) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into hinhanh(masp,noidunghinh) values(?,?)");
            stmt.setInt(1, masp);
            stmt.setString(2, noidung);
            int rs = stmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            return false;
        }
        return true;
    }

    // update hình ảnh
    public boolean updateHinhanh(int msp) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("delete hinhanh where masp =" + msp);
            int rs = stmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            return false;
        }
        return true;
    }

    // Select hình ảnh từ mã sản phẩm
    public ArrayList<String> layHinh(int msp) {
        ArrayList<String> arhinh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select noidunghinh from hinhanh where masp =" + msp);
            while (rs.next()) {
                arhinh.add(rs.getString(1));
            }
            con.close();
        } catch (Exception e) {
        }
        return arhinh;
    }

    public ArrayList<Integer> layMaHinh(int msp) {
        ArrayList<Integer> arhinh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select mahinhanh from hinhanh where masp =" + msp);
            while (rs.next()) {
                arhinh.add(Integer.parseInt(rs.getString(1)));
            }
            con.close();
        } catch (Exception e) {
        }
        return arhinh;
    }

    public static void main(String[] args) {
        ArrayList<String> hinh = new ArrayList<>();
        //hinh.add("a");
        //hinh.add("b");
        //hinh.add("c");
        Hinhanh h  = new Hinhanh();
        System.out.println(h.layHinh(100));
    }
}
