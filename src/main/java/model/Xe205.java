package model;

public class Xe205 {

    private int id;
    private String bienSo;
    private String dongXe;
    private String hangXe;
    private String doiXe;
    private String moTa;
    private DoiTac205 doiTac;

    public Xe205(int id, String bienSo, String dongXe, String hangXe, String doiXe, String moTa, DoiTac205 doiTac) {
        this.id = id;
        this.bienSo = bienSo;
        this.dongXe = dongXe;
        this.hangXe = hangXe;
        this.doiXe = doiXe;
        this.moTa = moTa;
        if (this.moTa == null) {
            this.moTa = "";
        }
        this.doiTac = doiTac;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBienSo() {
        return bienSo;
    }

    public void setBienSo(String bienSo) {
        this.bienSo = bienSo;
    }

    public String getDongXe() {
        return dongXe;
    }

    public void setDongXe(String dongXe) {
        this.dongXe = dongXe;
    }

    public String getHangXe() {
        return hangXe;
    }

    public void setHangXe(String hangXe) {
        this.hangXe = hangXe;
    }

    public String getDoiXe() {
        return doiXe;
    }

    public void setDoiXe(String doiXe) {
        this.doiXe = doiXe;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public DoiTac205 getDoiTac() {
        return doiTac;
    }

    public void setDoiTac(DoiTac205 doiTac) {
        this.doiTac = doiTac;
    }

}
