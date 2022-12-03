package model;

import java.time.LocalDate;
import java.util.List;

public class HopDong205 {

	private int id;
	private String loai;
	private List<XeHopDong205> dsXeHD;
        private LocalDate ngayLap;
        private String trangThai;

    public HopDong205(int id, String loai, List<XeHopDong205> dsXeHD, LocalDate ngayLap, String trangThai) {
        this.id = id;
        this.loai = loai;
        this.dsXeHD = dsXeHD;
        this.ngayLap = ngayLap;
        this.trangThai = trangThai;
    }

    public LocalDate getNgayKi() {
        return ngayLap;
    }

    public void setNgayKi(LocalDate ngayLap) {
        this.ngayLap = ngayLap;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public List<XeHopDong205> getDsXeHD() {
        return dsXeHD;
    }

    public void setDsXeHD(List<XeHopDong205> dsXeHD) {
        this.dsXeHD = dsXeHD;
    }

}