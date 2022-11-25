<%-- 
    Document   : gdXemTruocHopDong205
    Created on : Nov 24, 2022, 1:54:49 PM
    Author     : Admin
--%>

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

            <div class="hop-dong grid wide">
                <div class="hop-dong__title">
                    <p class="cong-hoa">Cộng hoà xã hội chủ nghĩa Việt Nam</p>
                    <p class="doc-lap">Độc lập – Tự do – Hạnh phúc</p>
                </div>
                <div class="hop-dong__content">
                    <div class="user">Bên A: Công ty TNHH HDV</div>
                    <div class="user">Bên B : Ông Tư Mã Trọng Đạt</div>
                    <span class="hop-dong__text">1.Xe biển số 30Y512345 với đơn giá 500000/ngày từ 22/12/2022 đến 29/12/2022
                        Xe được xác thực tình trạng tốt
                        Tổng giá trị hợp đồng dự kiến là 3000000 đồng
                        Nếu quá thời hạn thì đơn giá sẽ tăng thêm 20% đối với mỗi xe quá hạn được ông Tư Mã Trọng Đạt kí gửi
                        Mọi hỏng hóc của xe sẽ được bồi hoàn theo giá trị thị trường
                    </span>
                </div>
                <div class="sign">
                    <div class="sign1">
                        <p class="title">Bên A</p>
                        <p class="note">(Ký rõ họ tên)</p>
                    </div>
                    <div class="sign2">
                        <p class="title">Bên B</p>
                        <p class="note">(Ký rõ họ tên)</p>
                    </div>
                </div>
            </div>
            <div class="fun-button grid wide">
                <button type="button" class="btn btn-success btn-fun" onclick="location.href = './gdTimkiemdoitac.html'">In hợp đồng</button>
            </div>
        </div>
    </body>

</html>
