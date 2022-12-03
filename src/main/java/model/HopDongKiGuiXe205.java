package model;

import java.time.LocalDate;
import java.util.List;

public class HopDongKiGuiXe205 extends HopDong205{
	private QuanLy205 ql;
	private DoiTac205 dt;

    

    public HopDongKiGuiXe205(QuanLy205 ql, DoiTac205 dt, int id, List<XeHopDong205> dsXeHD, LocalDate ngayKi, String trangThai) {
        super(id, "kg", dsXeHD, ngayKi, trangThai);
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