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

public class Loaisanpham implements ketnoiDatabase {

    String maDanhmuc, maLoaisanpham, tenLoaisanpham;

    public Loaisanpham() {
        try {
            Class.forName(Driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Loaisanpham.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void setMaDanhmuc(String maDanhmuc) {
        this.maDanhmuc = maDanhmuc;
    }

    public void setMaLoaisanpham(String maLoaisanpham) {
        this.maLoaisanpham = maLoaisanpham;
    }

    public void setTenLoaisanpham(String tenLoaisanpham) {
        this.tenLoaisanpham = tenLoaisanpham;
    }

    public String getMaDanhmuc() {
        return maDanhmuc;
    }

    public String getMaLoaisanpham() {
        return maLoaisanpham;
    }

    public String getTenLoaisanpham() {
        return tenLoaisanpham;
    }

    @Override
    public String toString() {
        return maLoaisanpham + "-" + tenLoaisanpham;
    }

    public Loaisanpham(String mlsp) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select madanhmuc, tenloaisp from loaisanpham where maloaisp ='" + mlsp + "'");
            if (rs.next()) {
                maDanhmuc = rs.getString(1);
                maLoaisanpham = mlsp;
                tenLoaisanpham = rs.getString(2);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }

    public static Vector<Loaisanpham> layDanhSachLSP() {
        Vector<Loaisanpham> lsp = new Vector<Loaisanpham>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select maloaisp, tenloaisp, madanhmuc from loaisanpham");
            while (rs.next()) {
                Loaisanpham Lsp = new Loaisanpham();
                Lsp.maLoaisanpham = rs.getString(1);
                Lsp.tenLoaisanpham = rs.getString(2);
                Lsp.maDanhmuc = rs.getString(3);
                lsp.add(Lsp);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return lsp;
    }

    public Loaisanpham(String madanhmuc, String maLoaiSP, String tenLoaiSP) {
        int rs = 0;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into loaisanpham(madanhmuc,maloaisp,tenloaisp) values (?,?,?)");
            stmt.setString(1, madanhmuc);
            stmt.setString(2, maLoaiSP);
            stmt.setString(3, tenLoaiSP);
            rs = stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }

    public int insertLDMSP(String madanhmuc, String maLoaiSP, String tenLoaiSP) {
        int rs = 0;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into loaisanpham(madanhmuc,maloaisp,tenloaisp) values (?,?,?)");
            stmt.setString(1, madanhmuc);
            stmt.setString(2, maLoaiSP);
            stmt.setString(3, tenLoaiSP);
            rs = stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return rs;
    }

    // cập nhật loại sản phẩm
    public boolean updateLoaiSanPham(String maLsp, String tenLsp) {
        int rs = 0;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update loaisanpham set tenloaisp = ? where maloaisp ='" + maLsp + "'");
            stmt.setString(1, tenLsp);
            rs = stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        if (rs == 0) {
            return false;
        } else {
            return true;
        }
    }

    // lấy tên loại sản phẩm bằng mã loại sản phẩm.
    public static String layTenLoaiSP(String malsp){
        String tenloaisp = null;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select tenloaisp from loaisanpham where maloaisp ='"+malsp+"'");
            while(rs.next()){
            tenloaisp = rs.getString(1);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return tenloaisp;    
    }
    
    // lấy mã loại sản phẩm bằng tên loại sản phẩm.
    public static String layMaLoaiSP(String malsp){
        String tenloaisp = null;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select maloaisp from loaisanpham where tenloaisp =N'"+malsp+"'");
            while(rs.next()){
            tenloaisp = rs.getString(1);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return tenloaisp;    
    }
    public static void main(String[] args) {
        Loaisanpham v = new Loaisanpham();
        //boolean i = v.updateLoaiSanPham("123", "HIỆP");
       // System.out.println(i);
        String mlsp = "Thắt Lưng GUCI";
        String maloaisp = "1";
        for (Loaisanpham elem : Loaisanpham.layDanhSachLSP()) {
            //System.out.println(elem.tenLoaisanpham);
            if (mlsp.equals(elem.getTenLoaisanpham())) {
                maloaisp = elem.getMaLoaisanpham();
            }
        }
        System.out.println(maloaisp);
        System.out.println(Loaisanpham.layMaLoaiSP("Thắt Lưng Boss"));
        
    }
}
