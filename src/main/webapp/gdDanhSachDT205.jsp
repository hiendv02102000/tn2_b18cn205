<%-- 
    Document   : gdQuanLy205
    Created on : Nov 21, 2022, 9:48:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Danh sách đối tác</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        <div class="content">
            <nav class="navbar navbar-light navbar-color">
                <span class="navbar-brand mb-0 h1 grid wide">Danh sách đối tác</span>
            </nav>

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
                        <tr>
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
                        </tr>
                        <tr>
                            <td>001200014478</td>
                            <td>Lò Văn Dự</td>
                            <td>0912345678</td>
                            <td>Dễ tính :></td>
                            <td class="select-item" onclick="location.href = './gdDanhsachXeDT.html'"></a>Chọn</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


    </body>

</html>
