/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

    public String checkXeHD(XeHopDong205 xeHD) {
        if (xeHD.getNgayBatDau().isBefore(LocalDate.now()) || xeHD.getNgayBatDau().isAfter(xeHD.getNgayKetThuc())) {
            return "Ngày bắt đầu và ngày kết thức đều phải từ ngày hôm nay";
        }
        if(xeHD.getDonGia()<=0){
            return "Đơn giá phải lớn hơn 0";
        }
        final String sql = "SELECT * FROM tblxehopdong205 \n"
                + " WHERE tblXe205id = ? \n"
                + " AND ((ngayKetThuc >= ? AND ngayBatDau <= ?)OR (ngayKetThuc >= ? AND ngayBatDau <= ?))";
        List<DoiTac205> listDT = new ArrayList<>();
        try {
            PreparedStatement prepareStatement = this.conn.prepareStatement(sql);
            prepareStatement.setInt(1, xeHD.getXe().getId());
            prepareStatement.setDate(2, Date.valueOf(xeHD.getNgayBatDau()));
            prepareStatement.setDate(3, Date.valueOf(xeHD.getNgayBatDau()));
            prepareStatement.setDate(4, Date.valueOf(xeHD.getNgayKetThuc()));
            prepareStatement.setDate(5, Date.valueOf(xeHD.getNgayKetThuc()));
            ResultSet rs = prepareStatement.executeQuery();
            if (rs.next()) {
                String pattern = "dd-MM-yyyy";
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
                String resMess = "Xe đã được kí gửi từ " + formatter.format(rs.getDate("ngayBatDau").toLocalDate()) + " đến " + formatter.format(rs.getDate("ngayKetThuc").toLocalDate());
                return resMess;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Lỗi truy vấn dữ liệu";
        }
        return "";
    }
}
