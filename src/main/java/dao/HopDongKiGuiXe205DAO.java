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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

/**
 *
 * @author Admin
 */
public class HopDongKiGuiXe205DAO extends DAO {

    public HopDongKiGuiXe205DAO() {
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
            String sqlXeHD = "INSERT INTO tblxehopdong205 (`donGia`, `ngayKetThuc`, `ngayBatDau`, `tinhTrang`, `tblXe205id`, `tblHopDong205id`) VALUES\n";

            if (hd.getDsXeHD().isEmpty()) {
                return false;
            }
            for (int i = 0; i < hd.getDsXeHD().size(); i++) {
                sqlXeHD += " (?, ?, ?, ?, ?, ?)\n";
            }
            PreparedStatement prepareStatementXeHD = this.conn.prepareStatement(sqlXeHD);
            for (int i = 0; i < hd.getDsXeHD().size(); i++) {
                XeHopDong205 xeHD = hd.getDsXeHD().get(i);
                prepareStatementXeHD.setDouble(1 + i * 6, xeHD.getDonGia());
                prepareStatementXeHD.setDate(2 + i * 6, Date.valueOf(xeHD.getNgayKetThuc()));
                prepareStatementXeHD.setDate(3 + i * 6, Date.valueOf(xeHD.getNgayBatDau()));
                prepareStatementXeHD.setString(4 + i * 6, xeHD.getTinhTrang());
                prepareStatementXeHD.setInt(5 + i * 6, xeHD.getXe().getId());
                prepareStatementXeHD.setInt(6 + i * 6, idHD);
            }
            rowCount = prepareStatementXeHD.executeUpdate();
            if (rowCount < hd.getDsXeHD().size()) {
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

//    public static void main(String[] args) {
//        HongDongKiGuiXe205DAO dao = new HongDongKiGuiXe205DAO();
//        QuanLy205 ql = new QuanLy205("", "", 1, "", LocalDate.MIN, "", "", "", "", "");
//        DoiTac205 dt = new DoiTac205(3, "", LocalDate.MIN, "", "", "", "", "");
//        List<XeHopDong205> dsXeHD = new ArrayList<>();
//        dsXeHD.add(new XeHopDong205(0, LocalDate.now(), LocalDate.now(), 0, "", new Xe205(1, "", "", "", "", "", dt)));
//        dao.createHopDongKiGui(new HopDongKiGuiXe205(ql, dt, 0, dsXeHD));
//    }
}
