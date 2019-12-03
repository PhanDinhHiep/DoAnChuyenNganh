/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import static model.ketnoiDatabase.DataBase;
import static model.ketnoiDatabase.Driver;
import static model.ketnoiDatabase.Pass;
import static model.ketnoiDatabase.User;

/**
 *
 * @author phand
 */
public class Hinhthucthanhtoan implements ketnoiDatabase {

    String mahinhthucthanhtoan, tenhinhthucthanhtoan;

    public Hinhthucthanhtoan() {
        try {
            Class.forName(Driver);
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }
    }

    public Hinhthucthanhtoan(String mahinhthucthanhtoan, String tenhinhthucthanhtoan) {
        this.mahinhthucthanhtoan = mahinhthucthanhtoan;
        this.tenhinhthucthanhtoan = tenhinhthucthanhtoan;
    }

    public void setMahinhthucthanhtoan(String mahinhthucthanhtoan) {
        this.mahinhthucthanhtoan = mahinhthucthanhtoan;
    }

    public void setTenhinhthucthanhtoan(String tenhinhthucthanhtoan) {
        this.tenhinhthucthanhtoan = tenhinhthucthanhtoan;
    }

    public String getMahinhthucthanhtoan() {
        return mahinhthucthanhtoan;
    }

    public String getTenhinhthucthanhtoan() {
        return tenhinhthucthanhtoan;
    }

    public static ArrayList<Hinhthucthanhtoan> ArrayHTTT() {
        ArrayList<Hinhthucthanhtoan> httt = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select mahttt, tenhttt from hinhthucthanhtoan");
            while (rs.next()) {
                httt.add(new Hinhthucthanhtoan(rs.getString("mahttt"), rs.getString("tenhttt")));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return httt;
    }
    public static String laymaHHTTT(String ten) {
        String mahttt = "cc";
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select mahttt from hinhthucthanhtoan where tenhttt = N'"+ten+"'");
            if(rs.next()){
                mahttt = rs.getString(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return mahttt;
    }
    public static String laytenHHTTT(String mahttt) {
        String tenhttt = "cc";
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select tenhttt from hinhthucthanhtoan where mahttt ='"+mahttt+"'");
            if(rs.next()){
                tenhttt = rs.getString(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return tenhttt;
    }
    
    @Override
    public String toString() {
        return "Hinhthucthanhtoan{" + "mahinhthucthanhtoan=" + mahinhthucthanhtoan + ", tenhinhthucthanhtoan=" + tenhinhthucthanhtoan + '}';
    }
    
    public static void main(String[] args) {
        System.out.println(Hinhthucthanhtoan.laymaHHTTT("Thanh Toán Khi Nhận Hàng"));
    }
}
