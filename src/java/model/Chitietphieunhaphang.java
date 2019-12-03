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
import static model.ketnoiDatabase.DataBase;
import static model.ketnoiDatabase.Driver;
import static model.ketnoiDatabase.Pass;
import static model.ketnoiDatabase.User;

/**
 *
 * @author phand
 */
public class Chitietphieunhaphang implements ketnoiDatabase{
    int sophieu, masp, soluong;
    

    public Chitietphieunhaphang() {
    }

    public Chitietphieunhaphang(int sophieu, int masp, int soluong) {
        this.sophieu = sophieu;
        this.masp = masp;
        this.soluong = soluong;
       
    }

    public void setSophieu(int sophieu) {
        this.sophieu = sophieu;
    }

    public void setMasp(int masp) {
        this.masp = masp;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }


    public int getSophieu() {
        return sophieu;
    }

    public int getMasp() {
        return masp;
    }

    public int getSoluong() {
        return soluong;
    }
    public boolean ThemCTPhieuNhap(){
        return true;
    }
    public boolean ThemCTPhieuNhap(int sophieu, int masp, int soluong) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into chitietphieunhaphang(sophieunhap, masp, soluong) values(?,?,?)");
            stmt.setInt(1, sophieu);
            stmt.setInt(2, masp);
            stmt.setInt(3, soluong);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.err.print(e);
            return false;
        }
        return true;
    }
}
