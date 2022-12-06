/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dao;

import java.time.LocalDate;
import java.util.*;
import model.DoiTac205;
import model.HopDongKiGuiXe205;
import model.QuanLy205;
import model.Xe205;
import model.XeHopDong205;
import static org.junit.Assert.*;
import org.junit.Test;

/**
 *
 * @author Admin
 */
public class HopDongKiGuiXe205DAOJUnitTest {

    HopDongKiGuiXe205DAO dao = new HopDongKiGuiXe205DAO();

    @Test
    public void createHopDongKiGui_testChuan1() {
        List<XeHopDong205> dsXeHD = new ArrayList<>();
        dsXeHD.add(new XeHopDong205(0, LocalDate.now().plusDays(100), LocalDate.now().plusDays(100), 1000000, "Tot", new Xe205(1, "", "", "", "", "", null)));
        QuanLy205 ql = new QuanLy205("", "", 1, "", null, "", "", "", "", "");
        DoiTac205 dt = new DoiTac205(3, "", null, "", "", "", "", "");
        HopDongKiGuiXe205 hd = new HopDongKiGuiXe205(ql, dt, 0, dsXeHD, LocalDate.now(), "chua_ki");
        boolean ok = dao.createHopDongKiGui(hd);
        assertEquals(ok, true);
    }

    @Test
    public void createHopDongKiGui_testNgoaile1() {
        List<XeHopDong205> dsXeHD = new ArrayList<>();
        //Hợp đồng có danh sách xe hợp đồng rỗng
        QuanLy205 ql = new QuanLy205("", "", 1, "", null, "", "", "", "", "");
        DoiTac205 dt = new DoiTac205(3, "", null, "", "", "", "", "");
        HopDongKiGuiXe205 hd = new HopDongKiGuiXe205(ql, dt, 0, dsXeHD, LocalDate.now(), "chua_ki");
        boolean ok = dao.createHopDongKiGui(hd);
        assertEquals(ok, false);
    }

    @Test
    public void createHopDongKiGui_testChuan2() {
        //Hợp đồng chứa đối tác không tồn tại
        List<XeHopDong205> dsXeHD = new ArrayList<>();
        dsXeHD.add(new XeHopDong205(0, LocalDate.now().plusDays(100), LocalDate.now().plusDays(100), 1000000, "Tot", new Xe205(1, "", "", "", "", "", null)));
        QuanLy205 ql = new QuanLy205("", "", 1, "", null, "", "", "", "", "");
        DoiTac205 dt = new DoiTac205(0, "", null, "", "", "", "", "");
        HopDongKiGuiXe205 hd = new HopDongKiGuiXe205(ql, dt, 0, dsXeHD, LocalDate.now(), "chua_ki");
        boolean ok = dao.createHopDongKiGui(hd);
        assertEquals(ok, false);
    }

    @Test
    public void createHopDongKiGui_testChuan3() {
        //Hợp đồng chứa quản lý không tồn tại
        List<XeHopDong205> dsXeHD = new ArrayList<>();
        dsXeHD.add(new XeHopDong205(0,  LocalDate.now().plusDays(100), LocalDate.now().plusDays(100), 1000000, "Tot", new Xe205(1, "", "", "", "", "", null)));
        QuanLy205 ql = new QuanLy205("", "", 0, "", null, "", "", "", "", "");
        DoiTac205 dt = new DoiTac205(1, "", null, "", "", "", "", "");
        HopDongKiGuiXe205 hd = new HopDongKiGuiXe205(ql, dt, 0, dsXeHD, LocalDate.now(), "chua_ki");
        boolean ok = dao.createHopDongKiGui(hd);
        assertEquals(ok, false);
    }
     @Test
    public void createHopDongKiGui_testChuan4() {
        //Hợp đồng null
        HopDongKiGuiXe205 hd = null;
        boolean ok = dao.createHopDongKiGui(hd);
        assertEquals(ok, false);
    }
    
}
