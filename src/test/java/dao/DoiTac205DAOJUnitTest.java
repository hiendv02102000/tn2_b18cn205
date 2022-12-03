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
    public void hello() {
        dao.getDSDoiTacTheoKieuXe(null);
        dao.getDoiTacByID(0);
    }

    @Test
    public void getDSDoiTacTheoKieuXe_testChuan1() {
        String hangXe = "";
        String dongXe = "";
        String doiXe = "";
        List<DoiTac205> dsDT = dao.getDSDoiTacTheoKieuXe(new Xe205(0, dongXe, hangXe, doiXe, "", "", null));
        assertNotNull(dsDT);
    }

    @Test
    public void getDSDoiTacTheoKieuXe_testNgoaile1() {
        List<DoiTac205> dsDT = dao.getDSDoiTacTheoKieuXe(null);
        assertNull(dsDT);
    }
}
