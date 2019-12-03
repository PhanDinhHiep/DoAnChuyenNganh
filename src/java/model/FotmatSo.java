/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author phand
 */
public class FotmatSo {

    public static String fm(double gia) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String tien = String.valueOf(formatter.format(gia)) + " VNĐ";
        return tien;
    }

    public static String fmgia(double gia) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String tien = String.valueOf(formatter.format(gia));
        return tien;
    }
    public static void main(String[] args) {
        double d = 34.0;
        Locale l = new Locale("vi", "VN");
        NumberFormat format = NumberFormat.getInstance(l);
        System.out.println(format.format(d));
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        System.out.println(formatter.format(34.000) + " VNĐ");
        Sanpham s = new Sanpham(1);
        System.out.println(s.dongia);
        System.out.println(formatter.format(s.getDongia()) + "VNĐ");
        System.out.println(fm(2000));
        String sa = fm(d);
        System.out.println(sa);
    }
}
