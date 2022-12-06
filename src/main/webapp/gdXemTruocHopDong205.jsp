<%-- 
    Document   : gdXemTruocHopDong205
    Created on : Nov 24, 2022, 1:54:49 PM
    Author     : Admin
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.Duration"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page import="model.QuanLy205"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        QuanLy205 ql = (QuanLy205) session.getAttribute("quanLy");
        if (ql == null) {
            response.sendRedirect("./gdQuanLy205.jsp");
            return;
        }
        DoiTac205 dt = (DoiTac205) session.getAttribute("dt_kg");
        List<XeHopDong205> dsXeHD = (List<XeHopDong205>) session.getAttribute("ds_xe_hd");
        HopDongKiGuiXe205 hd = new HopDongKiGuiXe205(ql, dt, 0, dsXeHD,LocalDate.now(),"chua_ki");
        if (hd.getDsXeHD().size() == 0) {
            response.sendRedirect("./gdDanhSachXe205.jsp?" + "dt_id=" + dt.getId());
        }
        session.setAttribute("hd_kg_moi", hd);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Xem trước hợp đồng</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        <div class="content">
            <nav class="navbar navbar-light navbar-color">
                <span class="navbar-brand mb-0 h1 grid wide">Xem trước hợp đồng</span>
            </nav>

            <div class=" grid wide">
                <div class="hop-dong__title">
                    <p class="cong-hoa">Cộng hoà xã hội chủ nghĩa Việt Nam</p>
                    <p class="doc-lap">Độc lập – Tự do – Hạnh phúc</p>
                </div>
                <div class="hop-dong__content">
                    <div class="user">Bên A: Công ty TNHH HDV</div>
                    <div class="user">Bên B : Ông/Bà <%=dt.getHoTen()%></div>
                    <%
                        int i = 0;
                        String pattern = "dd-MM-yyyy";
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
                        long tong = 0;
                        for (XeHopDong205 xeHD : dsXeHD) {
                            i++;
                            Duration diff = Duration.between(xeHD.getNgayBatDau().atStartOfDay(), xeHD.getNgayKetThuc().atStartOfDay());
                            tong += xeHD.getDonGia() * (diff.toDays()+1);
                    %>
                    <span class="hop-dong__text">
                        <%=i%>.Xe biển số <%=xeHD.getXe().getBienSo()%> từ <%= formatter.format(xeHD.getNgayBatDau())%> đến <%= formatter.format(xeHD.getNgayKetThuc())%> <br>
                        Với đơn giá <%=xeHD.getDonGia()%>VND/ngày <br>
                        Xe được xác thực tình trạng: <%=xeHD.getTinhTrang()%><br>
                        Tổng giá trị thuê xe này dự kiến: <%=xeHD.getDonGia() * (diff.toDays()+1)%> VND<br>
                    </span><br>
                    <%
                        }
                    %>
                    <span class="hop-dong__text">
                        Tổng giá trị hợp đồng dự kiến là <%=tong%> VND
                        Nếu quá thời hạn thì đơn giá sẽ tăng thêm 20% đối với mỗi xe quá hạn được ông Tư Mã Trọng Đạt kí gửi.
                        Mọi hỏng hóc của xe sẽ được bồi hoàn theo giá trị thị trường.
                    </span>
                </div>
                <div class="sign">
                    <div class="sign1">
                        <p class="title">Đại diện Bên A</p>
                        <p class="note">(Ký rõ họ tên)</p><br><br>

                        <p class="note"><%=ql.getHoTen()%></p>
                    </div>
                    <div class="sign2">
                        <p class="title">Bên B</p>
                        <p class="note">(Ký rõ họ tên)</p><br><br>

                        <p class="note"><%=dt.getHoTen()%></p>
                    </div>
                </div>
            </div>
            <div class="fun-button grid wide">
                <button type="button" class="btn btn-success btn-fun" onclick="location.href = './doLuuHDKiGui205.jsp'">In hợp đồng</button>
            </div>
        </div>
    </body>

</html>
