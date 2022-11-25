<%-- 
    Document   : gdTimKiemDT205
    Created on : Nov 24, 2022, 1:52:49 PM
    Author     : Admin
--%>

<%@page import="model.DoiTac205"%>
<%@page import="dao.DoiTac205DAO"%>
<%@page import="model.QuanLy205"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        QuanLy205 ql = (QuanLy205) session.getAttribute("quanLy");
        if (ql == null) {
            response.sendRedirect("./gdQuanLy205.jsp");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Tìm kiếm đối tác</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        <div class="content">
            <nav class="navbar navbar-light navbar-color">
                <span class="navbar-brand mb-0 h1 grid wide">Tìm kiếm đối tác</span>
            </nav>
            <form action="./gdDanhSachDT205.jsp">
                <label for="hang_xe">Hãng xe:</label>
                <input type="text" id="hang_xe" name="hang_xe"><br><br>
                <label for="dong_xe">Dòng xe:</label>
                <input type="text" id="dong_xe" name="dong_xe"><br><br>
                <label for="doi_xe">Đời xe:</label>
                <input type="text" id="doi_xe" name="doi_xe"><br><br>
                <input type="submit" value="Tìm kiếm">
            </form>
        </div>



        <div class="fun-button grid wide">
            <button type="button" class="btn btn-success btn-fun" onclick="location.href = './gdDanhsachdoitac.html'">Tìm
                kiếm</button>
        </div>
    </div>

</body>

</html>
