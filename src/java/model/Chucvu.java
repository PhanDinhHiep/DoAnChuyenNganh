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
import java.util.Objects;
import static model.ketnoiDatabase.DataBase;
import static model.ketnoiDatabase.Driver;
import static model.ketnoiDatabase.Pass;
import static model.ketnoiDatabase.User;

/**
 *
 * @author phand
 */
public class Chucvu implements ketnoiDatabase{
    String macv, tencv;

    public Chucvu() {
    }

    
    public Chucvu(String macv, String tencv) {
        this.macv = macv;
        this.tencv = tencv;
    }

    public void setMacv(String macv) {
        this.macv = macv;
    }

    public void setTencv(String tencv) {
        this.tencv = tencv;
    }

    public String getMacv() {
        return macv;
    }

    public String getTencv() {
        return tencv;
    }

    @Override
    public String toString() {
        return "Chucvu{" + "macv=" + macv + ", tencv=" + tencv + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.macv);
        hash = 29 * hash + Objects.hashCode(this.tencv);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Chucvu other = (Chucvu) obj;
        if (!Objects.equals(this.macv, other.macv)) {
            return false;
        }
        if (!Objects.equals(this.tencv, other.tencv)) {
            return false;
        }
        return true;
    }
    public static ArrayList<Chucvu> danhsachChuVu(){
        ArrayList<Chucvu> dsnvgh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase,User,Pass); 
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from quyen");
            while(rs.next()){
                dsnvgh.add(new Chucvu(rs.getString(1), rs.getString(2)));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }       
        return dsnvgh;
    }
    public static void main(String[] args) {
        System.out.println(Chucvu.danhsachChuVu());
    }
}
