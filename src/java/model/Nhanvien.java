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
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phand
 */
public class Nhanvien implements ketnoiDatabase {

    String sodtnv, hoten, ngaysinh, gioitinh, diachi, email, maquyen, matkhau, trangthai;

    public Nhanvien() {
    }

    public Nhanvien(String sodtnv, String hoten, String ngaysinh, String gioitinh, String diachi, String email, String maquyen, String matkhau, String trangthai) {
        this.sodtnv = sodtnv;
        this.hoten = hoten;
        this.ngaysinh = ngaysinh;
        this.gioitinh = gioitinh;
        this.diachi = diachi;
        this.email = email;
        this.maquyen = maquyen;
        this.matkhau = matkhau;
        this.trangthai = trangthai;
    }

    public void setSodtnv(String sodtnv) {
        this.sodtnv = sodtnv;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public void setNgaysinh(String ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setMaquyen(String maquyen) {
        this.maquyen = maquyen;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public String getSodtnv() {
        return sodtnv;
    }

    public String getHoten() {
        return hoten;
    }

    public String getNgaysinh() {
        return ngaysinh;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public String getDiachi() {
        return diachi;
    }

    public String getEmail() {
        return email;
    }

    public String getMaquyen() {
        return maquyen;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public String getTrangthai() {
        return trangthai;
    }

    @Override
    public String toString() {
        return "Nhanvien{" + "sodtnv=" + sodtnv + ", hoten=" + hoten + ", ngaysinh=" + ngaysinh + ", gioitinh=" + gioitinh + ", diachi=" + diachi + ", email=" + email + ", maquyen=" + maquyen + ", matkhau=" + matkhau + ", trangthai=" + trangthai + '}';
    }

    public Nhanvien(String sodt) {
        this();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select hotennv, ngaysinh, gioitinh, diachi, email, maquyen, matkhau "
                    + "from nhanvien where sodtnv = '" + sodt + "'");
            if (rs.next()) {
                sodtnv = sodt;
                hoten = rs.getString(1);
                ngaysinh = rs.getString(2);
                gioitinh = rs.getString(3);
                diachi = rs.getString(4);
                email = rs.getString(5);
                maquyen = rs.getString(6);
                matkhau = rs.getString(7);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Nhanvien.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // đăng nhập nhân viên
    public static Nhanvien dangNhap(String sodt, String matkhau) {
        Nhanvien nvdn = new Nhanvien(sodt);
        if (nvdn.matkhau.equals(matkhau)) {
            return nvdn;
        }
        return null;
    }

    // Đổi mật khẩu nhân viên
    public boolean doiMKNV(String mkmoi) {
        matkhau = mkmoi;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update nhanvien set matkhau = ? where sodtnv = ?");
            stmt.setString(1, mkmoi);
            stmt.setString(2, sodtnv);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("loi " + e);
            return false;
        }
        return true;
    }

    // thêm nhân viên
    public boolean insertNhanVien(String sdt, String hoten, String ngaysinh, String gioitinh, String diachi, String email, String maquen, String matkhau) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date myDate = format.parse(ngaysinh);
            java.sql.Date sqldate = new java.sql.Date(myDate.getTime());
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into nhanvien values(?,?,?,?,?,?,?,?)");
            stmt.setString(1, sdt);
            stmt.setString(2, hoten);
            stmt.setDate(3, sqldate);
            stmt.setString(4, gioitinh);
            stmt.setString(5, diachi);
            stmt.setString(6, email);
            stmt.setString(7, maquen);
            stmt.setString(8, matkhau);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException | ParseException ex) {
            System.out.println(ex);
            return false;
        }
        return true;
    }

    // Hàm cập nhật thông tin nhân viên
    public boolean capnhatNV(String sdtnv, String email, String hoten, String ngaysinh, String gioitinh, String diachi) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update nhanvien set email = ?, hotennv = ?, ngaysinh = ?,  gioitinh = ?, diachi = ? where sodtnv = '" + sdtnv + "'");
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date myDate = format.parse(ngaysinh);
            java.sql.Date sqldate = new java.sql.Date(myDate.getTime());
            stmt.setString(1, email);
            stmt.setString(2, hoten);
            stmt.setDate(3, sqldate);
            stmt.setString(4, gioitinh);
            stmt.setString(5, diachi);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException | ParseException e) {
            Logger.getLogger(Khachhang.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
        return true;
    }

    // Hàm cập nhật trạng thái nhân viên
    public boolean capnhatTTNV(String sdtnv, String tt) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update nhanvien set trangthai = ? where sodtnv = '" + sdtnv + "'");
            stmt.setString(1, tt);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(Khachhang.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
        return true;
    }

    // Hàm cập nhật trạng thái nhân viên
    public boolean capnhatTTKH(String sdt, String tt) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update khachhang set trangthaihoatdong = ? where sodtkh = '" + sdt + "'");
            stmt.setString(1, tt);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(Khachhang.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
        return true;
    }

    // danh sách nhân viên giaao
    public static ArrayList<Nhanvien> danhsachNhanVienGiao() {
        ArrayList<Nhanvien> dsnvgh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select sodtnv, hotennv, ngaysinh, gioitinh, diachi, email, maquyen, matkhau, trangthai "
                    + "from nhanvien where maquyen = 'NVGH'");
            while (rs.next()) {
                dsnvgh.add(new Nhanvien(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsnvgh;
    }

    // danh sách nhân viên 
    public static ArrayList<Nhanvien> danhsachNhanVien() {
        ArrayList<Nhanvien> dsnvgh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select sodtnv, hotennv, ngaysinh, gioitinh, diachi, email, maquyen, matkhau, trangthai "
                    + "from nhanvien");
            while (rs.next()) {
                dsnvgh.add(new Nhanvien(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsnvgh;
    }

    // lấy tên nhân viên giao
    public static String laytennvGiao(String sdtnv) {
        String dsnvgh = "";
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select hotennv from nhanvien where sodtnv = '" + sdtnv + "'");
            if (rs.next()) {
                dsnvgh = rs.getString(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }
        return dsnvgh;
    }

    public static void main(String[] args) {
        //Nhanvien s = Nhanvien.dangNhap("0935946258","321123");
        //s.capnhatNV("0935946258","1@gmail.com","hiệp", "17/1/1994", "Nam", "huế");
        //System.out.println(s.hoten+s.ngaysinh);
        //boolean kq = s.capnhatTTKH("0935120110","Y");
        //System.out.println(Nhanvien.danhsachNhanVien());
        // nhanvien.dangNhap("0935946258","123123"); String sdt, String hoten, String ngaysinh, String gioitinh, String diachi, String email, String maquen, String matkhau
        //System.out.println(Nhanvien.laytennvGiao("0935946258"));
        Date date = new Date();
        String d = date.toString();
        
        System.out.println(date.getDate()+"-"+date.getMonth()+"-"+date.getYear()+"_"+date.getHours()+"H"+"-"+date.getMinutes()+"M"+"-"+date.getSeconds()+"S");
        
    }
}
