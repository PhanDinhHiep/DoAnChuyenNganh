package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Sanpham implements ketnoiDatabase {

    String maloaisp, makhuyenmai, mabaohanh, tensp, hinhanh, mausac, motachitiet, trangthaisanpham, trangthaikinhdoanh;
    int masp, soluong;
    double dongia;

    public Sanpham() {

    }

    // hàm dựng cho top 5 sản phẩm bán chạy
    public Sanpham(int masp, String tensp, int soluong) {
        this.tensp = tensp;
        this.masp = masp;
        this.soluong = soluong;
    }

    // danh sách sản phẩm bán chạy
    public static ArrayList<Sanpham> ArraydanhSachSanPhamBanchay() {
        ArrayList<Sanpham> sanpham = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select Top 10 sanpham.masp, sanpham.tensanpham, Sum(chitietdonhang.soluong) as [số lượng] "
                    + "from sanpham, chitietdonhang "
                    + "where sanpham.masp = chitietdonhang.masp "
                    + "Group by sanpham.masp,sanpham.tensanpham,sanpham.dongia "
                    + "order by sum(chitietdonhang.soluong) desc");
            while (rs.next()) {
                sanpham.add(new Sanpham(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sanpham;
    }

    public Sanpham(int masp, String maloaisp, String makhuyenmai, String mabaohanh, String tensp, String hinhanh, String mausac, String motachitiet, String trangthaisanpham, int soluong, double dongia, String trangthaikinhdoanh) {
        this.maloaisp = maloaisp;
        this.makhuyenmai = makhuyenmai;
        this.mabaohanh = mabaohanh;
        this.tensp = tensp;
        this.hinhanh = hinhanh;
        this.mausac = mausac;
        this.motachitiet = motachitiet;
        this.trangthaisanpham = trangthaisanpham;
        this.trangthaikinhdoanh = trangthaikinhdoanh;
        this.masp = masp;
        this.soluong = soluong;
        this.dongia = dongia;
    }

    public void setMaloaisp(String maloaisp) {
        this.maloaisp = maloaisp;
    }

    public void setMakhuyenmai(String makhuyenmai) {
        this.makhuyenmai = makhuyenmai;
    }

    public void setMabaohanh(String mabaohanh) {
        this.mabaohanh = mabaohanh;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }

    public void setMausac(String mausac) {
        this.mausac = mausac;
    }

    public void setMotachitiet(String motachitiet) {
        this.motachitiet = motachitiet;
    }

    public void setTrangthaisanpham(String trangthaisanpham) {
        this.trangthaisanpham = trangthaisanpham;
    }

    public void setTrangthaikinhdoanh(String trangthaikinhdoanh) {
        this.trangthaikinhdoanh = trangthaikinhdoanh;
    }

    public void setMasp(int masp) {
        this.masp = masp;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public void setDongia(int dongia) {
        this.dongia = dongia;
    }

    public String getMaloaisp() {
        return maloaisp;
    }

    public String getMakhuyenmai() {
        return makhuyenmai;
    }

    public String getMabaohanh() {
        return mabaohanh;
    }

    public String getTensp() {
        return tensp;
    }

    public String getHinhanh() {
        return hinhanh;
    }

    public String getMausac() {
        return mausac;
    }

    public String getMotachitiet() {
        return motachitiet;
    }

    public String getTrangthaisanpham() {
        return trangthaisanpham;
    }

    public String getTrangthaikinhdoanh() {
        return trangthaikinhdoanh;
    }

    public int getMasp() {
        return masp;
    }

    public int getSoluong() {
        return soluong;
    }

    public double getDongia() {
        return dongia;
    }

    @Override
    public String toString() {
        return "Sanpham{" + "maloaisp=" + maloaisp + ", makhuyenmai=" + makhuyenmai + ", mabaohanh=" + mabaohanh + ", tensp=" + tensp + ", hinhanh=" + hinhanh + ", mausac=" + mausac + ", motachitiet=" + motachitiet + ", trangthaisanpham=" + trangthaisanpham + ", trangthaikinhdoanh=" + trangthaikinhdoanh + ", masp=" + masp + ", soluong=" + soluong + ", dongia=" + dongia + '}';
    }

    public static Vector<Sanpham> danhSachSanPham() {
        Vector<Sanpham> sanpham = new Vector<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select masp, maloaisp, makhuyenmai, mabaohanh, tensanpham, soluong, dongia, hinhanh, mausac, motachitiet, trangthaisanpham, trangthaikinhdoanh from sanpham where soluong > 0");
            while (rs.next()) {
                sanpham.add(new Sanpham(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(6), rs.getInt(7), rs.getString(12)));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.println(e);
        }

        return sanpham;
    }

    // lấy danh sách sản phẩm dựa theo danh mục
    public static Vector<Sanpham> danhSachSanPham(String madanhmuc) {
        Vector<Sanpham> sanpham = new Vector<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select masp, sanpham.maloaisp, makhuyenmai, mabaohanh, tensanpham, soluong, dongia, hinhanh, mausac, motachitiet, trangthaisanpham, trangthaikinhdoanh from sanpham,loaisanpham,danhmucsanpham "
                    + "where sanpham.maloaisp = loaisanpham.maloaisp and loaisanpham.madanhmuc = danhmucsanpham.madanhmuc and danhmucsanpham.madanhmuc ='" + madanhmuc + "'");
            while (rs.next()) {
                sanpham.add(new Sanpham(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(6), rs.getInt(7), rs.getString(12)));
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.println(e);
        }

        return sanpham;
    }

    // lấy thong tin chi tiết sản phẩm
    public Sanpham(int msp) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select tensanpham, maloaisp, makhuyenmai, mabaohanh, soluong, dongia, hinhanh, mausac, motachitiet, trangthaisanpham, trangthaikinhdoanh from sanpham where masp ='" + msp + "'");
            if (rs.next()) {
                masp = msp;
                tensp = rs.getString(1);
                maloaisp = rs.getString(2);
                makhuyenmai = rs.getString(3);
                mabaohanh = rs.getString(4);
                soluong = rs.getInt(5);
                dongia = rs.getInt(6);
                hinhanh = rs.getString(7);
                mausac = rs.getString(8);
                motachitiet = rs.getString(9);
                trangthaisanpham = rs.getString(10);
                trangthaikinhdoanh = rs.getString(11);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }

    public Sanpham layChiTietSP(int masp) {
        Sanpham s = new Sanpham();
        try {
            Class.forName(Driver);
            try (Connection con = DriverManager.getConnection(DataBase, User, Pass)) {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select tensanpham ,maloaisp,"
                        + " makhuyenmai, mabaohanh, soluong, dongia, hinhanh ,mausac,"
                        + " motachitiet, trangthaisanpham, trangthaikinhdoanh from sanpham where masp ='" + masp + "'");
                if (rs.next()) {
                    s.setMasp(masp);
                    s.setTensp(rs.getString(1));
                    s.setMaloaisp(rs.getString(2));
                    s.setMakhuyenmai(rs.getString(3));
                    s.setMabaohanh(rs.getString(4));
                    s.setSoluong(rs.getInt(5));
                    s.setDongia(rs.getInt(6));
                    s.setHinhanh(rs.getString(7));
                    s.setMausac(rs.getString(8));
                    s.setMotachitiet(rs.getString(9));
                    s.setTrangthaisanpham(rs.getString(10));
                    s.setTrangthaikinhdoanh(rs.getString(11));
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public static Sanpham layChiTietSPcn(int masp) {
        Sanpham s = new Sanpham();
        try {
            Class.forName(Driver);
            try (Connection con = DriverManager.getConnection(DataBase, User, Pass)) {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select tensanpham ,maloaisp,"
                        + " makhuyenmai, mabaohanh, soluong, dongia, hinhanh ,mausac,"
                        + " motachitiet, trangthaisanpham, trangthaikinhdoanh from sanpham where masp ='" + masp + "'");
                if (rs.next()) {
                    s.setMasp(masp);
                    s.setTensp(rs.getString(1));
                    s.setMaloaisp(rs.getString(2));
                    s.setMakhuyenmai(rs.getString(3));
                    s.setMabaohanh(rs.getString(4));
                    s.setSoluong(rs.getInt(5));
                    s.setDongia(rs.getInt(6));
                    s.setHinhanh(rs.getString(7));
                    s.setMausac(rs.getString(8));
                    s.setMotachitiet(rs.getString(9));
                    s.setTrangthaisanpham(rs.getString(10));
                    s.setTrangthaikinhdoanh(rs.getString(11));
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    // lấy đơn giá
    public double Dongia(int msp) {
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select dongia from sanpham where masp ='" + msp + "'");
            if (rs.next()) {
                masp = msp;
                dongia = rs.getDouble(1);
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return dongia;
    }
// lấy mã sản phẩm lớn nhất

    public static int LayMaxMSP() {
        int max = 0;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select max(masp) from sanpham");
            if (rs.next()) {
                max = rs.getInt(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return max;
    }

    public boolean themSanPham(String maloaisp, String makhuyenmai, String mabaohanh, String tensp, String hinhanh, String mausac,
            String motachitiet, String trangthaisanpham, String trangthaikinhdoanh, int masp, int soluong, int dongia) {
        int kq;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("insert into sanpham(maloaisp, makhuyenmai, mabaohanh, masp, tensanpham,"
                    + "soluong, dongia, hinhanh, mausac, motachitiet, trangthaisanpham, trangthaikinhdoanh)"
                    + " values(?,?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1, maloaisp);
            stmt.setString(2, makhuyenmai);
            stmt.setString(3, mabaohanh);
            stmt.setInt(4, masp);
            stmt.setString(5, tensp);
            stmt.setInt(6, soluong);
            stmt.setInt(7, dongia);
            stmt.setString(8, hinhanh);
            stmt.setString(9, mausac);
            stmt.setString(10, motachitiet);
            stmt.setString(11, trangthaisanpham);
            stmt.setString(12, trangthaikinhdoanh);
            kq = stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        if (kq != 0) {
            return true;
        }
        return false;
    }

    // cập nhật sản phẩm
    public boolean capnhatSanPham(String maloaisp, String makhuyenmai, String mabaohanh, String tensp, String hinhanh, String mausac,
            String motachitiet, String trangthaisanpham, String trangthaikinhdoanh, int masp) {
        int kq;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update sanpham set maloaisp = ?, makhuyenmai =?, mabaohanh=?, tensanpham =?,"
                    + "hinhanh = ?, mausac = ?, motachitiet = ?, trangthaisanpham = ?, trangthaikinhdoanh = ? where masp =" + masp);
            stmt.setString(1, maloaisp);
            stmt.setString(2, makhuyenmai);
            stmt.setString(3, mabaohanh);
            stmt.setString(4, tensp);
            stmt.setString(5, hinhanh);
            stmt.setString(6, mausac);
            stmt.setString(7, motachitiet);
            stmt.setString(8, trangthaisanpham);
            stmt.setString(9, trangthaikinhdoanh);
            kq = stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return kq != 0;
    }
    // cập nhật giá bán của sản phẩm
    public boolean capnhatGiaBanSanPham(int msp, int giamoi) {
        int kq;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update sanpham set dongia =? where masp = "+msp);
            stmt.setInt(1,giamoi);
            kq = stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return kq != 0;
    }
    public boolean capnhathinhSanPham( int masp, String dongia) {
        int kq;
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            PreparedStatement stmt = con.prepareStatement("update sanpham set hinhanh = ? where masp =" + masp);
            stmt.setString(1, dongia);
            kq = stmt.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return kq != 0;
    }
    //array list san phẩm
    public static ArrayList<Sanpham> ArraydanhSachSanPham() {
        ArrayList<Sanpham> sanpham = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select masp, maloaisp, makhuyenmai, mabaohanh, tensanpham, soluong, dongia, hinhanh, mausac, motachitiet, trangthaisanpham, trangthaikinhdoanh from sanpham");
            while (rs.next()) {
                sanpham.add(new Sanpham(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(6), rs.getInt(7), rs.getString(12)));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sanpham.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sanpham;
    }

    // tìm kiếm sản phẩm theo tên sản phẩm
    public static ArrayList<Sanpham> timkiemArraydanhSachSanPham(String tencantim) {
        ArrayList<Sanpham> sanpham = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select masp, maloaisp, makhuyenmai, mabaohanh, tensanpham, soluong, dongia, hinhanh, mausac, motachitiet, trangthaisanpham, trangthaikinhdoanh from sanpham where tensanpham like N'%" + tencantim + "%'");
            while (rs.next()) {
                sanpham.add(new Sanpham(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(6), rs.getInt(7), rs.getString(12)));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
        return sanpham;
    }

    // tìm kiếm sản phẩm theo tên loại sản phẩm
    public static ArrayList<Sanpham> timkiemArraydanhSachSanPhamLSP(String tencantim) {
        ArrayList<Sanpham> sanpham = new ArrayList<>();
        try {
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(DataBase, User, Pass);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select sanpham.masp, sanpham.maloaisp, sanpham.makhuyenmai, sanpham.mabaohanh, sanpham.tensanpham, sanpham.soluong, sanpham.dongia, sanpham.hinhanh, sanpham.mausac, sanpham.motachitiet, sanpham.trangthaisanpham, sanpham.trangthaikinhdoanh from loaisanpham, sanpham where loaisanpham.tenloaisp like N'%" + tencantim + "%' and loaisanpham.maloaisp = sanpham.maloaisp");
            while (rs.next()) {
                sanpham.add(new Sanpham(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getInt(6), rs.getInt(7), rs.getString(12)));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
        return sanpham;
    }
    
    // phân trang;
    

    public static void main(String[] args) {
        Sanpham s = new Sanpham(1);
        //s.themSanPham(DataBase, User, DataBase, Pass, Pass, User, DataBase, DataBase, DataBase, 0, 0, 0);
        /*
        for (Sanpham sanpham : Sanpham.timkiemArraydanhSachSanPhamLSP("boss")) {
        System.out.println(sanpham);
        }
        System.out.println("/////////////////////");
        for (Sanpham sanpham : Sanpham.timkiemArraydanhSachSanPham("boss")) {
        System.out.println(sanpham);
        }
        /*
        int i = s.a(2);
        System.out.println(i);
         */
        //System.out.println(Sanpham.danhSachSanPham("VI"));
        //Sanpham s = new Sanpham();
        //int t = s.LayMaxMSP();
        //System.out.println(t);
        // boolean kq = s.capnhatSanPham("TBOSS", "GG01", "BH1", "Hiệp", "th.jpg", "đỏ", "ttct", "ttsp", "ttkd",1,111);
        //System.out.println(kq);
        /*
        System.out.println(Sanpham.ArraydanhSachSanPhamBanchay());
        int gia = 570;
        int tong;
        int giam;
        Scanner in = new Scanner(System.in);
        System.out.println("Mời nhập mức giảm");
        giam = in.nextInt();
        tong = (gia * giam) / 100;
        gia = gia - tong;
        System.out.println(gia);
        System.out.println(tong);
         */
        //Sanpham sss = new Sanpham();
        //boolean kq = sss.capnhatSanPham("TBOSS", "KM001", "BH001", "Hiệp", "thhiep.jpg", "đỏ", "ttct", "ttsp", "ttkd",1);
        danhSachSanPham().forEach((sanpham) -> {
            System.out.println(sanpham);
        });
        System.out.println();
    }
}
