package model;

import java.time.LocalDate;

public class ThanhVien205  extends CaNhan205{

	private int id;
	private String username;
	private String password;
	private String chucVu;

    public ThanhVien205(String username, String password, String chucVu, int id, String soCCCD, LocalDate ngaySinh, String hoTen, String diaChi, String email, String ghiChu, String loai) {
        super(id, soCCCD, ngaySinh, hoTen, diaChi, email, ghiChu, loai);
        this.username = username;
        this.password = password;
        this.chucVu = chucVu;
    }

    public int getId() {
        return id;
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