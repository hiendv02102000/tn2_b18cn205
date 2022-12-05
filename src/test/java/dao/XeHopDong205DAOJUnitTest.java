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
        XeHopDong205 xeHD = new XeHopDong205(0, LocalDate.MAX, LocalDate.MAX, 0, "", new Xe205(0, "","", "", "", "", null));
    }

    @Test
    public void getDoiTacTheoID_testNgoaile1() {

    }
}
