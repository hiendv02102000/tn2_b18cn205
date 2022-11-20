package model;

import java.util.List;

public class HopDongKiGuiXe205 extends HopDong205{
	private QuanLy205 ql;
	private DoiTac205 dt;

    public HopDongKiGuiXe205(QuanLy205 ql, DoiTac205 dt, int id, String loai, List<XeHopDong205> dsXeHD, List<XeHopDong205> listXeHD) {
        super(id, loai, dsXeHD, listXeHD);
        this.ql = ql;
        this.dt = dt;
    }

    public QuanLy205 getQl() {
        return ql;
    }

    public DoiTac205 getDt() {
        return dt;
    }
        
}