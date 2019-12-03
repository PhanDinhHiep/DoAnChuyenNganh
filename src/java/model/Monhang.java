/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Objects;

public class Monhang {
    int msp, soluong;
    double dongia;
    String tenmh, mabaohanh, makhuyenmai, mausac;
    public Monhang() {
    }

    public Monhang(int msp, String tenmh, double dongia, int soluong, String mabaohanh, String makhuyenmai, String mausac) {
        this.msp = msp;
        this.dongia = dongia;
        this.soluong = soluong;
        this.tenmh = tenmh;
        this.mabaohanh = mabaohanh;
        this.makhuyenmai = makhuyenmai;
        this.mausac = mausac;
    }

    public void setMsp(int msp) {
        this.msp = msp;
    }

    public void setDongia(int dongia) {
        this.dongia = dongia;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public void setTenmh(String tenmh) {
        this.tenmh = tenmh;
    }

    public void setMabaohanh(String mabaohanh) {
        this.mabaohanh = mabaohanh;
    }

    public void setMakhuyenmai(String makhuyenmai) {
        this.makhuyenmai = makhuyenmai;
    }

    public void setMausac(String mausac) {
        this.mausac = mausac;
    }

    public int getMsp() {
        return msp;
    }

    public double getDongia() {
        return dongia;
    }

    public int getSoluong() {
        return soluong;
    }

    public String getTenmh() {
        return tenmh;
    }

    public String getMabaohanh() {
        return mabaohanh;
    }

    public String getMakhuyenmai() {
        return makhuyenmai;
    }

    public String getMausac() {
        return mausac;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 43 * hash + this.msp;
        hash = 43 * hash + (int) (Double.doubleToLongBits(this.dongia) ^ (Double.doubleToLongBits(this.dongia) >>> 32));
        hash = 43 * hash + Objects.hashCode(this.tenmh);
        hash = 43 * hash + Objects.hashCode(this.mabaohanh);
        hash = 43 * hash + Objects.hashCode(this.makhuyenmai);
        hash = 43 * hash + Objects.hashCode(this.mausac);
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
        final Monhang other = (Monhang) obj;
        if (this.msp != other.msp) {
            return false;
        }
        if (this.dongia != other.dongia) {
            return false;
        }
        if (!Objects.equals(this.tenmh, other.tenmh)) {
            return false;
        }
        if (!Objects.equals(this.mabaohanh, other.mabaohanh)) {
            return false;
        }
        if (!Objects.equals(this.makhuyenmai, other.makhuyenmai)) {
            return false;
        }
        if (!Objects.equals(this.mausac, other.mausac)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Monhang{" + "msp=" + msp + ", dongia=" + dongia + ", soluong=" + soluong + ", tenmh=" + tenmh + ", mabaohanh=" + mabaohanh + ", makhuyenmai=" + makhuyenmai + ", mausac=" + mausac + '}';
    }

        
}
