/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Vector;

/**
 *
 * @author phand
 */
public class Giohang {

    Vector<Monhang> giohang;

    public Giohang() {
        giohang = new Vector<>(5, 5);
    }

    public void themMonHang(Monhang mhmoi) {
        if (giohang.contains(mhmoi)) {
            Monhang hangmoi = giohang.get(giohang.indexOf(mhmoi));
            hangmoi.setSoluong(hangmoi.getSoluong() + mhmoi.getSoluong());
        } else {
            giohang.add(mhmoi);
        }
    }

    public void capnhatMonHang(Monhang mhmoi) {
        if (giohang.contains(mhmoi)) {
            Monhang hangmoi = giohang.get(giohang.indexOf(mhmoi));
            hangmoi.setSoluong(mhmoi.getSoluong());
        } else {
            giohang.add(mhmoi);
        }
    }

    public boolean xoaMonHang(int mmh) {
        for (int i = 0; i < giohang.size(); i++) {
            if (mmh == giohang.get(i).getMsp()) {
                giohang.remove(giohang.get(i));
            }
        }
        return true;
    }

    @Override
    public String toString() {
        return "Giohang{" + "giohang=" + giohang + '}';
    }
// tính tiền khuyến mãi

    public int tinhKhuyenMai() {
        int khuyenmai = 0;
        for (Monhang monhang : giohang) {
            khuyenmai = (khuyenmai + Khuyenmai.layTiengiam(monhang.getMakhuyenmai())*monhang.getSoluong());
        }
        return khuyenmai;
    }
// tính tổng tiền
    public double tinhTongtien(){
        double tongtien = 0;
        for (Monhang monhang : giohang) {
            tongtien = tongtien + monhang.getDongia() * monhang.getSoluong();
        }
        return tongtien;
    }

    public Vector<Monhang> getGH() {
        return giohang;
    }

    public static void main(String[] args) {
        Giohang gh = new Giohang();
        Monhang n = new Monhang(1, "món 1", 20, 1, "", "", "");
        Monhang nx = new Monhang(1, "món 1", 20, 1, "", "", "");
        Monhang nxx = new Monhang(1, "món 1", 20, 1, "", "", "");
        Monhang nxxx = new Monhang(1, "món 1", 20, 1, "", "", "");
      
        gh.themMonHang(n);
        gh.themMonHang(nx);
        gh.themMonHang(nxx);
        gh.themMonHang(nxxx);
        System.out.println(gh.tinhTongtien());
        System.out.println(gh);

    }
}
