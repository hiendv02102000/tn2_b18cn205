package dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
import java.time.LocalDate;
import model.Xe205;
import model.XeHopDong205;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class XeHopDong205DAOJUnitTest {

    XeHopDong205DAO dao = new XeHopDong205DAO();

    @Test
    public void checkXeHD_testChuan1() {
        XeHopDong205 xeHD = new XeHopDong205(0, LocalDate.now(), LocalDate.now(), 1000000, "Tot", new Xe205(1, "", "", "", "", "", null));
        String res = dao.checkXeHD(xeHD);
        assertEquals(res, "");
    }

    @Test
    public void checkXeHD_testNgoaile1() {
//Xe hợp đồng là null
        XeHopDong205 xeHD = null;
        String res = dao.checkXeHD(xeHD);
        assertEquals(res, "Đối tượng chưa được khởi tạo");
    }

    @Test
    public void checkXeHD_testNgoaile2() {
//Xe hợp đồng chứa xe không tồn tại
        XeHopDong205 xeHD = new XeHopDong205(0, LocalDate.now(), LocalDate.now(), 1000000, "Tot", new Xe205(0, "", "", "", "", "", null));
        String res = dao.checkXeHD(xeHD);
        assertEquals(res, "Xe không tồn tại");
    }

    @Test
    public void checkXeHD_testNgoaile3() {
//Xe hợp đồng có ngày bắt đầu trước ngày hiện tại
        XeHopDong205 xeHD = new XeHopDong205(0, LocalDate.now().plusDays(-1), LocalDate.now().plusDays(1), 1000000, "Tot", new Xe205(1, "", "", "", "", "", null));
        String res = dao.checkXeHD(xeHD);
        assertEquals(res, "Ngày bắt đầu đều phải từ ngày hôm nay");
    }

    @Test
    public void checkXeHD_testNgoaile4() {
//Xe hợp đồng có ngày kết thức trước ngày hiện tại
        XeHopDong205 xeHD = new XeHopDong205(0, LocalDate.now(), LocalDate.now().plusDays(-1), 1000000, "Tot", new Xe205(1, "", "", "", "", "", null));
        String res = dao.checkXeHD(xeHD);
        assertEquals(res, "Ngày bắt đầu không thể sau ngày kết thúc");
    }

    @Test
    public void checkXeHD_testNgoaile5() {
//Xe hợp đồng có đơn giá nhỏ hơn bằng 0
        XeHopDong205 xeHD = new XeHopDong205(0, LocalDate.now(), LocalDate.now().plusDays(-1), 0, "Tot", new Xe205(1, "", "", "", "", "", null));
        String res = dao.checkXeHD(xeHD);
        assertEquals(res, "Ngày bắt đầu không thể sau ngày kết thúc");
    }
}
