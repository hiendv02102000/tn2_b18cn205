package model;

import java.time.LocalDate;


public class XeHopDong205 {

	private int id;
	private LocalDate ngayBatDau;
	private LocalDate ngayKetThuc;
	private double donGia;
	private String tinhTrang;
	private Xe205 xe;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(LocalDate ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public LocalDate getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(LocalDate ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }

    public double getDonGia() {
        return donGia;
    }

    public void setDonGia(double donGia) {
        this.donGia = donGia;
    }

    public String getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(String tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public Xe205 getXe() {
        return xe;
    }

    public void setXe(Xe205 xe) {
        this.xe = xe;
    }

}