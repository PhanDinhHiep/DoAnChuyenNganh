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
public class Khachhang implements ketnoiDatabase {

    String sdtkh, email, hoten, ngaysinh, gioitinh, diachi, trangthaihoatdong, matkhau;

    public Khachhang() {
        try {
            Class.forName(Driver);
        } catch (ClassNotFoundException e) {

        }
    }

    public Khachhang(String sdtkh, String email, String hoten, String ngaysinh, String gioitinh, String diachi, String trangthaihoatdong) {
        this.sdtkh = sdtkh;
        this.email = email;
        this.hoten = hoten;
        this.ngaysinh = ngaysinh;
        this.gioitinh = gioitinh;
        this.diachi = diachi;
        this.trangthaihoatdong = trangthaihoatdong;
    }

    
    public Khachhang(String sdtkh, String email, String hoten, String ngaysinh, String gioitinh, String diachi, String trangthaihoatdong, String matkhau) {
        this.sdtkh = sdtkh;
        this.email = email;
        this.hoten = hoten;
        this.ngaysinh = ngaysinh;
        this.gioitinh = gioitinh;
        this.diachi = diachi;
        this.trangthaihoatdong = trangthaihoatdong;
        this.matkhau = matkhau;
    }

    public void setSdtkh(String sdtkh) {
        this.sdtkh = sdtkh;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public void setTrangthaihoatdong(String trangthaihoatdong) {
        this.trangthaihoatdong = trangthaihoatdong;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getSdtkh() {
        return sdtkh;
    }

    public String getEmail() {
        return email;
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

    public String getTrangthaihoatdong() {
        return trangthaihoatdong;
    }

    public String getMatkhau() {
        return matkhau;
    }

    @Override
    public String toString() {
        return "Khachhang{" + "sdtkh=" + sdtkh + ", email=" + email + ", hoten=" + hoten + ", ngaysinh=" + ngaysinh + ", gioitinh=" + gioitinh + ", diachi=" + diachi + ", trangthaihoatdong=" + trangthaihoatdong + ", matkhau=" + matkhau + '}';
    }

    // hàm dựng lấy thông tin khách hàng
    public Khachhang(String sdtkh) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select email, hoten, ngaysinh, gioitinh, diachi, trangthaihoatdong, matkhau from khachhang where sodtkh = '" + sdtkh + "'");
            this.sdtkh = sdtkh;
            while (rs.next()) {
                email = rs.getString(1);
                hoten = rs.getString(2);
                ngaysinh = rs.getString(3);
                gioitinh = rs.getString(4);
                diachi = rs.getString(5);
                trangthaihoatdong = rs.getString(6);
                matkhau = rs.getString(7);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }

     public Khachhang lay(String sdtkh) {
        Khachhang s = new Khachhang();
         try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select email, hoten, ngaysinh, gioitinh, diachi, trangthaihoatdong, matkhau from khachhang where sodtkh = '" + sdtkh + "'");
            s.sdtkh = sdtkh;           
            while (rs.next()) {
                s.setEmail(rs.getString(1));
                s.setHoten(rs.getString(2));
                s.setNgaysinh(rs.getString(3)) ;
                s.setGioitinh(rs.getString(4));
                s.setDiachi(rs.getString(5));
                s.setTrangthaihoatdong(rs.getString(6));
                s.setMatkhau(rs.getString(7));
               
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return s;
    }
    // Đăng nhập khách hàng
    public static Khachhang dangnhapKhachHang(String sdt, String mk) {
        Khachhang kh = new Khachhang(sdt);
        if (kh.matkhau.equals(mk)) {
            return kh;
        }
        return null;
    }

    // Đổi mật khẩu
    public boolean doiMKKH(String mkmoi) {
        matkhau = mkmoi;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update khachhang set matkhau = ? where sodtkh = ?");
            stmt.setString(1, mkmoi);
            stmt.setString(2, sdtkh);
            stmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("loi " + e);
            return false;
        }
        return true;
    }

    // đăng ký khách hàng
    public boolean dangkyKH(String sdtkh, String email, String hoten, String ngaysinh, String matkhau, String diachi, String gioitinh) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into khachhang(sodtkh,email,hoten,ngaysinh,gioitinh,diachi,matkhau) values(?,?,?,?,?,?,?)");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date myDate = format.parse(ngaysinh);
            java.sql.Date sqldate = new java.sql.Date(myDate.getTime());
            stmt.setString(1, sdtkh);
            stmt.setString(2, email);
            stmt.setString(3, hoten);
            stmt.setDate(4, sqldate);
            stmt.setString(5, gioitinh);
            stmt.setString(6,diachi);
            stmt.setString(7,matkhau);
            stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException | ParseException e) {
            Logger.getLogger(Khachhang.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
        return true;
    }

    // Hàm cập nhật thông tin khách hàng
    public boolean capnhatKH(String sdtkh, String email, String hoten, String ngaysinh, String gioitinh, String diachi) {
        
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update khachhang set email = ?, hoten = ?,  ngaysinh = ?,  gioitinh = ?,  diachi = ? where sodtkh = '" + sdtkh + "'");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
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

    // danh sách Khách hàng
    public static ArrayList<Khachhang> danhsachKhachHang(){
        ArrayList<Khachhang> dskh = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase,User,Pass); 
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select sodtkh, email, hoten, ngaysinh, gioitinh, diachi, trangthaihoatdong from khachhang");
            while(rs.next()){
                dskh.add(new Khachhang(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return null;
        }       
        return dskh;
    }
    
    public static String laytenkh(String sdtkh){
        String ten = "";
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase,User,Pass); 
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select hoten from khachhang where sodtkh ='"+sdtkh+"'");
            if(rs.next()){
                ten = rs.getString(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return "Khách Hàng";
        }       
        return ten;
    }
    public static void main(String[] args) {
        
        Khachhang s = Khachhang.dangnhapKhachHang("0909090909","123123");
        
        /*
        String sdt = "0909090909";
        Khachhang ss = s.lay(sdt);
        System.out.println(s.getHoten());
         System.out.println(ss);
        //ss.capnhatKH(s.getSdtkh(),"aa@gmail.com","tên","2018-7-8", "Nam","huế");
        //Khachhang tramheo = Khachhang.dangnhapKhachHang("0909090909", "123123");
        //tramheo.doiMKKH("123321");
        //System.out.println(tramheo.dangkyKH("1236547896","tramheo@gmail.com","châu heo","1/1/1997","Nam", "hải phòng","heo123"));
        */
        //Khachhang s = new Khachhang();
        //boolean kq = s.dangkyKH("1010101010", "pdh@gmail.com", "thuận", "2018-9-8", "123123","tây nguyên", "nam");
        //System.out.println(kq);
    }
}
