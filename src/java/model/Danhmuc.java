package model;

import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Danhmuc implements ketnoiDatabase {

    String madanhmuc;
    String tendanhmuc;

    public Danhmuc() {
        try {
            Class.forName(Driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Danhmuc.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Danhmuc(String madanhmuc, String tendanhmuc) {
        this.madanhmuc = madanhmuc;
        this.tendanhmuc = tendanhmuc;
    }

    public void setMadanhmuc(String madanhmuc) {
        this.madanhmuc = madanhmuc;
    }

    public void setTendanhmuc(String tendanhmuc) {
        this.tendanhmuc = tendanhmuc;
    }

    public String getMadanhmuc() {
        return madanhmuc;
    }

    public String getTendanhmuc() {
        return tendanhmuc;
    }

    @Override
    public String toString() {
        return tendanhmuc;
    }
    String tendm;

    public String gettendm() {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("Select tendanhmuc from danhmucsanpham");
            if (rs.next()) {
                tendm = rs.getString(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(Danhmuc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tendm;
    }

    public void ThemDanhMuc(String MaDm, String TenDM) {
        try {
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into danhmucsanpham values(?,?)");
            stmt.setString(1, MaDm);
            stmt.setString(2, TenDM);
            int rs = stmt.executeUpdate();
            System.out.println("Thêm Danh Mục Thành Công");
            if (rs == 0) {
                throw new RuntimeException("Lỗi Khi Thêm Tên Danh Mục");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Danhmuc.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void XoaDanhMuc(String madanhmuc) {
        //  Xóa  danh mục sẽ có nhiều bất cập. cho nên không nên xóa danh mục hàng hóa
        /*
        Cần xóa trong chi tiết phiếu nhâp, hàng hóa, chi tiết hóa đơn bán hàng rồi mới xóa được DanhMuc
         */
    }
// lấy danh sách danh mục sản phẩm kiểu Vector    
    public static Vector<Danhmuc> LayDanhMuc() throws ClassNotFoundException {
        Vector<Danhmuc> dm = new Vector<Danhmuc>(5, 5);
        Class.forName(Driver);
        try {
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select madanhmuc,tendanhmuc from danhmucsanpham");
            while (rs.next()) {
                dm.add(new Danhmuc(rs.getString(1), rs.getString(2)));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Danhmuc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dm;
    }
    // lấy danh sách danh mục sản phẩm kiểu arraylist
    public static ArrayList<Danhmuc> LayDanhMucArray() {
        ArrayList<Danhmuc> dm = new ArrayList<Danhmuc>();
        try {
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select madanhmuc,tendanhmuc from danhmucsanpham");
            while (rs.next()) {
                dm.add(new Danhmuc(rs.getString(1), rs.getString(2)));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Danhmuc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dm;
    }
    // thêm danh mục sản phẩm
    public boolean insertDanhmuc(String madanhmuc, String tendanhmuc) {

        int rs = 0;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into danhmucsanpham values(?,?)");
            stmt.setString(1, madanhmuc);
            stmt.setString(2, tendanhmuc);
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
    
    // Cập nhật danh mục sản phẩm
    public boolean updateDanhmuc(String madanhmuc, String tendanhmuc) {
        int rs = 0;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update danhmucsanpham set tendanhmuc = ? where madanhmuc ='"+madanhmuc+"'");
            stmt.setString(1,tendanhmuc);
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

    public static void main(String[] args) throws ClassNotFoundException {
        /* test
        System.out.println(DanhMuc.LayDanhMuc());
        Danhmuc n =new Danhmuc();
        boolean u = n.insertDanhmuc("Phan","Hiệp");
        System.out.println("Cập nhật "+u );
        String m = "Ví";
        String ms = "d";
        for (Danhmuc elem : Danhmuc.LayDanhMucArray()) {
            if(m.equals(elem.getTendanhmuc())){
                ms = elem.getMadanhmuc();
            }
        }
        System.out.println(ms);
        Danhmuc d =new Danhmuc();
        boolean v = d.updateDanhmuc("TANA","Tân Hương");
        System.out.println(v);*/
        
        
    }
}
