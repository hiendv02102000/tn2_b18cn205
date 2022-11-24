/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.DoiTac205;
import model.XeHopDong205;

/**
 *
 * @author Admin
 */
public class XeHopDong205DAO extends DAO {

    public XeHopDong205DAO() {
        super();
    }

    public boolean checkXeHD(XeHopDong205 xeHD) {
        if (xeHD.getNgayBatDau().isBefore(LocalDate.now()) || xeHD.getNgayBatDau().isAfter(xeHD.getNgayKetThuc())) {
            return false;
        }
        final String sql = "SELECT * FROM tblxehopdong205 \n"
                + " WHERE tblXe205id = ? \n"
                + " AND ngayKetThuc >= ?";
        List<DoiTac205> listDT = new ArrayList<>();
        try {
            PreparedStatement prepareStatement = this.conn.prepareStatement(sql);
            prepareStatement.setInt(1, xeHD.getXe().getId());
            prepareStatement.setDate(2, Date.valueOf(xeHD.getNgayBatDau()));
            ResultSet rs = prepareStatement.executeQuery();
            return !rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
}
