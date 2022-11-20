package model;

import java.util.List;

public class HopDong205  extends CaNhan205{

	private int id;
	private String loai;
	private List<XeHopDong205> dsXeHD;
	private List<XeHopDong205> listXeHD;

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

    public List<XeHopDong205> getListXeHD() {
        return listXeHD;
    }

    public void setListXeHD(List<XeHopDong205> listXeHD) {
        this.listXeHD = listXeHD;
    }

}