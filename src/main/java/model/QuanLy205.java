package model;

import java.time.LocalDate;

public class QuanLy205 extends ThanhVien205{

    public QuanLy205(String username, String password,  int id, String soCCCD, LocalDate ngaySinh, String hoTen, String diaChi, String email, String ghiChu,String sdt) {
        super(username, password, "ql", id, soCCCD, ngaySinh, hoTen, diaChi, email, ghiChu,sdt);
    }
    
}