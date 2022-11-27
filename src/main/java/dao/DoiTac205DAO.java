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
public class DoiTac205DAO extends DAO {

    public DoiTac205DAO() {
        super();
    }

    public List<DoiTac205> getDSDoiTacTheoKieuXe(Xe205 xe) {
        final String sql = "SELECT * from tblcanhan205 dt \n"
                + "INNER JOIN (\n"
                + "SELECT tblCaNhan205id as dt_id from tblxe205 \n"
                + "WHERE dongXe LIKE ? AND hangXe LIKE ? AND doiXe LIKE ?\n"
                + ") as xe_tk \n"
                + "ON dt.id = xe_tk.dt_id\n"
                + "group by dt.id";
        List<DoiTac205> listDT = new ArrayList<>();
        try {
            PreparedStatement prepareStatement = this.conn.prepareStatement(sql);
            prepareStatement.setString(1, '%' + xe.getDongXe() + '%');
            prepareStatement.setString(2, '%' + xe.getHangXe() + '%');
            prepareStatement.setString(3, '%' + xe.getDoiXe() + '%');
            ResultSet rs = prepareStatement.executeQuery();
            while (rs.next()) {
                DoiTac205 dt = new DoiTac205(rs.getInt("id"),
                        rs.getString("cccd"),
                        rs.getDate("ngaySinh").toLocalDate(),
                        rs.getNString("hoTen"),
                        rs.getNString("diaChi"),
                        rs.getString("email"),
                        rs.getNString("ghiChu"),
                        rs.getString("sdt")
                );
                listDT.add(dt);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return listDT;
    }

    public DoiTac205 getDoiTacByID(int id){
         final String sql = "SELECT * from tblcanhan205 \n"
                + "WHERE id = ?";
        DoiTac205 dt = null;
        try {
            PreparedStatement prepareStatement = this.conn.prepareStatement(sql);
            prepareStatement.setInt(1, id);
            ResultSet rs = prepareStatement.executeQuery();
            if (rs.next()) {
                 dt = new DoiTac205(rs.getInt("id"),
                        rs.getString("cccd"),
                        rs.getDate("ngaySinh").toLocalDate(),
                        rs.getNString("hoTen"),
                        rs.getNString("diaChi"),
                        rs.getString("email"),
                        rs.getNString("ghiChu"),
                        rs.getString("sdt")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return dt;
    }
}
