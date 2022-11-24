<%-- 
    Document   : gdDanhSachXe205
    Created on : Nov 24, 2022, 1:53:50 PM
    Author     : Admin
--%>


<%@page import="model.QuanLy205"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        QuanLy205 ql = (QuanLy205) session.getAttribute("quanLy");
        if (ql == null) {
            response.sendRedirect("gdQuanLy205.jsp");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Danh sách xe của đối tác</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        <div class="content">
            <nav class="navbar navbar-light navbar-color">
                <span class="navbar-brand mb-0 h1 grid wide">Danh sách xe của đối tác: </span>
            </nav>

            <div class="list-table grid wide">
                <table class="table table-bordered ">
                    <thead>
                        <tr>
                            <th scope="col">Biển số</th>
                            <th scope="col">Hãng xe</th>
                            <th scope="col">Dòng xe</th>
                            <th scope="col">Đời xe</th>
                            <th scope="col">Mô tả</th>
                            <th scope="col">Chọn xe</th>
                            <th scope="col">Thông tin xe hợp đồng (Xe đã được chọn)</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>30Y512345</td>
                            <td>Mercedes-Benz</td>
                            <td>Sedans</td>
                            <td>EQS</td>
                            <td></td>
                            <td class="select-item" onclick="location.href = './gdNhaptt.html'"></a>Chọn</td>
                            <td>Đơn giá :500000
                                Tình Trạng:Tốt
                                Ngày Bắt đầu :22/12/2022
                                Ngày Kết thúc:29/12/2022
                            </td>

                        </tr>
                        <tr>
                            <td>30Y512345</td>
                            <td>Mercedes-Benz</td>
                            <td>Sedans</td>
                            <td>EQS</td>
                            <td></td>
                            <td class="select-item" onclick="location.href = './gdNhaptt.html'"></a>Chọn</td>
                            <td>Đơn giá :500000
                                Tình Trạng:Tốt
                                Ngày Bắt đầu :22/12/2022
                                Ngày Kết thúc:29/12/2022
                            </td>

                        </tr>
                        <tr>
                            <td>30Y512345</td>
                            <td>Mercedes-Benz</td>
                            <td>Sedans</td>
                            <td>EQS</td>
                            <td></td>
                            <td class="select-item" onclick="location.href = './gdNhaptt.html'"></a>Chọn</td>
                            <td>Đơn giá :500000
                                Tình Trạng:Tốt
                                Ngày Bắt đầu :22/12/2022
                                Ngày Kết thúc:29/12/2022
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </body>

</html>
