package dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
import java.util.ArrayList;
import java.util.List;
import model.*;
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
public class Xe205DAOJUnitTest {

    Xe205DAO dao = new Xe205DAO();

    @Test
    public void getDSXeCuaDoiTac_testChuan1() {
        //doi tac ton tai co so huu xe
        int dtId = 3;
        List<Xe205> dsXe = dao.getDSXeCuaDoiTac(dtId);
        assertNotNull(dsXe);
        assertEquals(2, dsXe.size());
         for(Xe205 xe: dsXe){
//            assertNull(xe.getDoiTac());
//            assertEquals(xe.getDoiTac().getId(), dtId);
        }
    }

    @Test
    public void getDSXeCuaDoiTac_testNgoaile1() {
        //doi tac khong ton tai
        int dtId = 10000;
        List<Xe205> dsXe = dao.getDSXeCuaDoiTac(dtId);
        assertNotNull(dsXe);
        assertEquals(0, dsXe.size());
    }

    
}
