/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dao;

import java.util.List;
import model.DoiTac205;
import model.Xe205;
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
public class DoiTac205DAOJUnitTest {

    DoiTac205DAO dao = new DoiTac205DAO();

    @Test
    public void getDoiTacTheoID_testChuan1() {
        //Đối tác tồn tại
        DoiTac205 dt = dao.getDoiTacTheoID(3);
        assertNotNull(dt);
        assertEquals(dt.getId(), 3);
    }

    @Test
    public void getDoiTacTheoID_testNgoaile1() {
        //Đối tác không tồn tại
        DoiTac205 dt = dao.getDoiTacTheoID(0);
        assertNull(dt);
    }

    @Test
    public void getDSDoiTacTheoKieuXe_testChuan1() {
        // Xe khác null
        String hangXe = "";
        String dongXe = "";
        String doiXe = "";
        List<DoiTac205> dsDT = dao.getDSDoiTacTheoKieuXe(new Xe205(0, dongXe, hangXe, doiXe, "", "", null));
        assertNotNull(dsDT);
    }

    @Test
    public void getDSDoiTacTheoKieuXe_testNgoaile1() {
        //Xe là null
        List<DoiTac205> dsDT = dao.getDSDoiTacTheoKieuXe(null);
        assertNull(dsDT);
    }
}
