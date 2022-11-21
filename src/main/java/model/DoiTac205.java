package model;

import java.time.LocalDate;

public class DoiTac205 extends CaNhan205{

    public DoiTac205(int id, String soCCCD, LocalDate ngaySinh, String hoTen, String diaChi, String email, String ghiChu) {
        super(id, soCCCD, ngaySinh, hoTen, diaChi, email, ghiChu, "dt");
    }
}