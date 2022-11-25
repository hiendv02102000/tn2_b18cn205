package model;

import java.time.LocalDate;

public class ThanhVien205  extends CaNhan205{

	private String username;
	private String password;
	private String chucVu;

//    public ThanhVien205(String username, String password, String chucVu, int id, String soCCCD, LocalDate ngaySinh, String hoTen, String diaChi, String email, String ghiChu) {
//        super(id, soCCCD, ngaySinh, hoTen, diaChi, email, ghiChu, "tv");
//        this.username = username;
//        this.password = password;
//        this.chucVu = chucVu;
//    }

    public ThanhVien205(String username, String password, String chucVu, int id, String soCCCD, LocalDate ngaySinh, String hoTen, String diaChi, String email, String ghiChu, String sdt) {
        super(id, soCCCD, ngaySinh, hoTen, diaChi, email, ghiChu, "tv", sdt);
        this.username = username;
        this.password = password;
        this.chucVu = chucVu;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getChucVu() {
        return chucVu;
    }

}