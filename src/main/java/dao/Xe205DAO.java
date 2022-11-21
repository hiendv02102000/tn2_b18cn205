/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.*;

/**
 *
 * @author Admin
 */
public class Xe205DAO extends DAO {

    public Xe205DAO() {
        super();
    }

    public List<Xe205> getDSXeCuaDoiTac(int dtID) {
        final String sql = "SELECT * FROM tblxe205 \n"
                + "WHERE tblCaNhan205id = ?";
        List<Xe205> listXe = new ArrayList<>();
        try {
            PreparedStatement prepareStatement = this.conn.prepareStatement(sql);
            prepareStatement.setInt(1, dtID);
            ResultSet rs = prepareStatement.executeQuery();
            while (rs.next()) {
               Xe205 xe = new Xe205(rs.getInt("id"),
                       rs.getString("bienSo"),
                       rs.getString("dongXe"),
                       rs.getString("hangXe"),
                       rs.getString("doiXe"),
                       rs.getNString("moTa"),
                       null);
                listXe.add(xe);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return listXe;
    }
}
