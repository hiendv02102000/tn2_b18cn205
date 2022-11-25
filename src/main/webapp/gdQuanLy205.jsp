<%-- 
    Document   : gdQuanLy205
    Created on : Nov 24, 2022, 1:52:16 PM
    Author     : Admin
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="model.QuanLy205"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        QuanLy205 ql = (QuanLy205) session.getAttribute("quanLy");
        if (ql == null) {
            ql = new QuanLy205("admin", "123456", 1, "001200014413", LocalDate.of(2000, 02, 02), "Trần Thị Lý", "chân trời", "admin@hien.com", "","");
            session.setAttribute("quanLy", ql);
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Trang chủ Quản lí</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>

        <div class="content">
            <nav class="navbar navbar-light navbar-color">
                <span class="navbar-brand mb-0 h1 grid wide">Giao diện Quản lí</span>
            </nav>

            <div class="fun-button grid wide">
                <button type="button" class="btn btn-success btn-fun" onclick="location.href = './gdTimKiemDT205.jsp'">Tạo hợp đồng
                    kí gửi</button>
            </div>
        </div>

    </body>

</html>
