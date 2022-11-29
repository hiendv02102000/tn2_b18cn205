package model;

import java.time.LocalDate;

public class CaNhan205 {

	private int id;
	private String soCCCD;
	private LocalDate ngaySinh;
	private String hoTen;
	private String diaChi;
	private String email;
	private String ghiChu;
	private String loai;
        private String sdt;
    public CaNhan205(int id, String soCCCD, LocalDate ngaySinh, String hoTen, String diaChi, String email, String ghiChu, String loai, String sdt) {
        this.id = id;
        this.soCCCD = soCCCD;
        this.ngaySinh = ngaySinh;
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.email = email;
        this.ghiChu = ghiChu;
        if(this.ghiChu==null) this.ghiChu = "";
        this.loai = loai;
        this.sdt = sdt;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSoCCCD() {
        return soCCCD;
    }

    public void setSoCCCD(String soCCCD) {
        this.soCCCD = soCCCD;
    }

    public LocalDate getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(LocalDate ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }
        
}