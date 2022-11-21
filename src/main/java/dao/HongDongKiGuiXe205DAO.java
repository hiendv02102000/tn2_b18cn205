/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

/**
 *
 * @author Admin
 */
public class HongDongKiGuiXe205DAO extends DAO {

    public HongDongKiGuiXe205DAO() {
        super();
    }

    public boolean createHopDongKiGui(HopDongKiGuiXe205 hd) {
        final String sqlHDKG = "INSERT INTO tblhopdong205 (`loai`, `tblThanhVien205id`, `tblCaNhan205id`) \n"
                + "VALUES (?, ?, ?);";

        try {
            this.conn.setAutoCommit(false);
            PreparedStatement prepareStatement = this.conn.prepareStatement(sqlHDKG, Statement.RETURN_GENERATED_KEYS);
            prepareStatement.setString(1, "kg");
            prepareStatement.setInt(2, hd.getQl().getId());
            prepareStatement.setInt(3, hd.getDt().getId());
            int rowCount = prepareStatement.executeUpdate();
            if (rowCount == 0) {
                throw new Exception("Thêm hợp đồng vào DB lỗi");
            }
            ResultSet rs = prepareStatement.getGeneratedKeys();
            int idHD = 0;
            if (rs.next()) {
                idHD = rs.getInt(1);
            }
            String sqlXeHD = "INSERT INTO tblxehopdong205 (`donGia`, `ngayKetThuc`, `ngayBatDau`, `tinhTrang`, `tblXe205id`, `tblHopDong205id`) \n";

            if (hd.getListXeHD().isEmpty()) {
                return false;
            }
            for (int i = 0; i < hd.getListXeHD().size(); i++) {
                sqlXeHD += "VALUES (?, ?, ?, ?, ?, ?)\n";
            }
            PreparedStatement prepareStatementXeHD = this.conn.prepareStatement(sqlXeHD);
            for (int i = 0; i < hd.getListXeHD().size(); i++) {
                XeHopDong205 xeHD = hd.getListXeHD().get(i);
                prepareStatement.setDouble(1 + i * 5, xeHD.getDonGia());
                prepareStatement.setDate(2 + i * 5, Date.valueOf(xeHD.getNgayKetThuc()));
                prepareStatement.setDate(3 + i * 5, Date.valueOf(xeHD.getNgayKetThuc()));
                prepareStatement.setInt(4 + i * 5, xeHD.getXe().getId());
                prepareStatement.setInt(5 + i * 5, idHD);
            }
            rowCount = prepareStatementXeHD.executeUpdate();
            if (rowCount < hd.getListXeHD().size()) {
                throw new Exception("Thêm Xe hợp đồng vào DB lỗi");
            }
            this.conn.setAutoCommit(true);
        } catch (Exception e) {
            e.printStackTrace();
            try {
                this.conn.rollback();
                this.conn.setAutoCommit(true);
            } catch (SQLException ex) {
                e.printStackTrace();
            }

            return false;
        }
        return true;
    }
}
