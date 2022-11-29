<%-- 
    Document   : doLuuHDKiGui
    Created on : Nov 24, 2022, 1:55:43 PM
    Author     : Admin
--%>

<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        QuanLy205 ql = (QuanLy205) session.getAttribute("quanLy");
        if (ql == null) {
            response.sendRedirect("./gdQuanLy205.jsp");
            return;
        }
        HopDongKiGuiXe205 hd = (HopDongKiGuiXe205) session.getAttribute("hd_kg_moi");
        HongDongKiGuiXe205DAO dao = new HongDongKiGuiXe205DAO();
        boolean ok = dao.createHopDongKiGui(hd);
        if (ok) {
    %>
    <script>
        alert("Tạo hợp đồng kí gửi thành côngThành công");
        location.href = './gdQuanLy205.jsp';
    </script>
    <%
        //response.sendRedirect("./gdQuanLy205.jsp");
    } else {
    %>
    <script>
        alert("Có lỗi xảy ra");
        location.href = './gdXemTruocHopDong205.jsp';
    </script>
    <%
            //response.sendRedirect("./gdXemTruocHopDong205.jsp");
        }

    %>

</html>
