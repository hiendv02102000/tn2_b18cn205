<%-- 
    Document   : gdQuanLy205
    Created on : Nov 21, 2022, 9:48:20 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%@page import="dao.DoiTac205DAO"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%
        QuanLy205 ql = (QuanLy205) session.getAttribute("quanLy");
        if (ql == null) {
            response.sendRedirect("./gdQuanLy205.jsp");
            return;
        }
        DoiTac205DAO dao = new DoiTac205DAO();
        String hangXe = request.getParameter("hang_xe");
        String dongXe = request.getParameter("dong_xe");
        String doiXe = request.getParameter("doi_xe");
        if (hangXe == null) {
            hangXe = "";
        }
        if (dongXe == null) {
            dongXe = "";
        }
        if (doiXe == null) {
            doiXe = "";
        }

        Xe205 xe = new Xe205(0, "", hangXe, dongXe, doiXe, "", null);
        List<DoiTac205> dsDT = dao.getDSDoiTacTheoKieuXe(xe);

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Danh sách đối tác </title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>

        <div class="content">
            <nav class="navbar navbar-light navbar-color">
                <span class="navbar-brand mb-0 h1 grid wide">Danh sách đối tác</span>
            </nav>

            <form class="form-inline" method="GET" action="./gdDanhSachDT205.jsp"  >
                <label   for="hang_xe">         Hãng xe:</label>
                <input  type="text" id="hang_xe" name="hang_xe"><br><br>
                <label  for="dong_xe">          Dòng xe:</label>
                <input type="text" id="dong_xe" name="dong_xe"><br><br>
                <label  for="doi_xe">           Đời xe:</label>
                <input type="text" id="doi_xe" name="doi_xe"><br><br>
                <button type="submit">Tìm Kiếm Đối tác</button>
            </form>

            <div class="list-table grid wide">
                <table class="table table-bordered ">
                    <thead>
                        <tr>
                            <th scope="col">Số CCCD</th>
                            <th scope="col">Tên đối tác</th>
                            <th scope="col">SDT</th>
                            <th scope="col">Ghi chú</th>
                            <th scope="col">Chọn</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            for (DoiTac205 dt : dsDT) {
                        %>
                        <tr>
                            <td><%=dt.getSoCCCD()%></td>
                            <td><%=dt.getHoTen()%></td>
                            <td><%=dt.getSdt()%></td>
                            <td><%=dt.getGhiChu()%></td>
                            <td class="select-item" onclick=<%="\"location.href = './gdDanhSachXe205.jsp?dt_id=" + dt.getId() + "'\""%>></a>Chọn</td>
                        </tr>

                        <%
                            }
                        %>

                        <!--                        <tr>
                                                    <td>001200014478</td>
                                                    <td>Lò Văn Dự</td>
                                                    <td>0912345678</td>
                                                    <td>Dễ tính :></td>
                                                    <td class="select-item" onclick="location.href = './gdDanhsachXeDT.html'"></a>Chọn</td>
                                                </tr>
                                                <tr>
                                                    <td>001200014478</td>
                                                    <td>Lò Văn Dự</td>
                                                    <td>0912345678</td>
                                                    <td>Dễ tính :></td>
                                                    <td class="select-item" onclick="location.href = './gdDanhsachXeDT.html'"></a>Chọn</td>
                                                </tr>-->
                    </tbody>
                </table>
            </div>
        </div>


    </body>

</html>
