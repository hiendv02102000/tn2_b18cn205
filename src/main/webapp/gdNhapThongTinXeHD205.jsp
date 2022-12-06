<%-- 
    Document   : gdNhapThongTinXeHD205.jsp
    Created on : Nov 24, 2022, 1:54:30 PM
    Author     : Admin
--%>

<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.time.LocalDate"%>
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
        int xeId = 0;
        try {
            xeId = Integer.parseInt(request.getParameter("xe_id"));
        } catch (Exception ex) {
            response.sendRedirect("./gdQuanLy205.jsp");
            return;
        }
        if (xeId <= 0) {
            response.sendRedirect("./gdQuanLy205.jsp");
            return;
        }
        Xe205DAO daoXe = new Xe205DAO();
        List<Xe205> dsXe = (List<Xe205>) session.getAttribute("ds_xe"+request.getParameter("dt_id"));
        List<XeHopDong205> dsXeHD = (List<XeHopDong205>) session.getAttribute("ds_xe_hd");
        if (dsXeHD == null || dsXe == null) {
            response.sendRedirect("./gdDanhSachXe205.jsp?" + "dt_id=" + request.getParameter("dt_id"));
            return;
        }
        Xe205 xe = null;
        for (Xe205 x : dsXe) {
            if (x.getId() == xeId) {
                xe = x;
            }
        }
        if (xe == null) {
            response.sendRedirect("./gdDanhSachXe205.jsp?" + "dt_id=" + request.getParameter("dt_id"));
            return;
        }
        XeHopDong205 xeHD = new XeHopDong205(0, LocalDate.now(), LocalDate.now(), 0, "", xe);
        for (XeHopDong205 x : dsXeHD) {
            if (x.getXe().getId() == xeId) {
                xeHD = x;
            }
        }
        String urlThem = "\"./doThemXeHD205.jsp?xe_id=" + xeId + "&dt_id=" + request.getParameter("dt_id") + '"';
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title><%="Nhập thông tin của xe " + "abc" + " trong hợp đồng"%> </title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        <div class="content">
            <nav class="navbar navbar-light navbar-color">
                <span class="navbar-brand mb-0 h1 grid wide"><%="Nhập thông tin của xe " + xe.getBienSo() + " trong hợp đồng"%></span>
            </nav>
            <form method="POST" action=<%=urlThem%>>
                <label for="hang_xe">Đơn giá:</label>
                <input type="text" id="don_gia" name="don_gia" value=<%="\"" + xeHD.getDonGia() + "\""%>><br><br>

                <label for="hang_xe">Tình trạng:</label>
                <input type="text" id="tinh_trang" name="tinh_trang" value=<%="\"" + xeHD.getTinhTrang() + "\""%>><br><br>

                <label for="dong_xe">Ngày bắt đầu:</label>
                <input type="date" placeholder="dd-mm-yyyy" id="ngay_bd" name="ngay_bd" value=<%="\"" + xeHD.getNgayBatDau().toString() + "\""%>><br><br>
                <label for="doi_xe">Ngày kết thúc</label>
                <input type="date" id="ngay_kt" name="ngay_kt" value=<%="\"" + xeHD.getNgayKetThuc().toString() + "\""%>><br><br>
                <input type="submit" value="Thêm xe">
            </form>
        </div>
    </body>

</html>