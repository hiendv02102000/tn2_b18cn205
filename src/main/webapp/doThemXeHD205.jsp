<%-- 
    Document   : doThemXeHD
    Created on : Nov 24, 2022, 1:55:18 PM
    Author     : Admin
--%>

<%@page import="dao.XeHopDong205DAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Xe205"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.XeHopDong205"%>
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
            if (xeId <= 0) {
                response.sendRedirect("./gdQuanLy205.jsp");
            }
            XeHopDong205 xeHD = new XeHopDong205(0,
                    LocalDate.parse(request.getParameter("ngay_bd")),
                    LocalDate.parse(request.getParameter("ngay_kt")),
                    Long.parseLong(request.getParameter("don_gia")),
                    request.getParameter("tinh_trang"),
                    new Xe205(xeId, "", "", "", "", "", null));
            List<Xe205> dsXe = (List<Xe205>) session.getAttribute("ds_xe");

            String resCheck = new XeHopDong205DAO().checkXeHD(xeHD);
            Boolean isOk = false;
            if (resCheck.isEmpty()) {
                isOk = true;
            }

            if (dsXe == null) {
                isOk = false;
            } else {
                for (Xe205 x : dsXe) {
                    if (x.getId() == xeId) {
                        xeHD.setXe(x);
                        break;
                    }
                }
            }
            if (isOk) {
                List<XeHopDong205> dsXeHD = (List<XeHopDong205>) session.getAttribute("ds_xe_hd");
                for (XeHopDong205 x : dsXeHD) {
                    if (x.getXe().getId() == xeId) {
                        dsXeHD.remove(x);
                        break;
                    }
                }
                dsXeHD.add(xeHD);
                session.setAttribute("ds_xe_hd", dsXeHD);
                String url = "'" + "./gdDanhSachXe205.jsp?" + "dt_id=" + request.getParameter("dt_id") + "'";
    %>
    <script>
        alert("Thêm Thành công");
        location.href = <%=url%>
    </script>
    <%
    } else {
        String url = "'" + "./gdNhapThongTinXeHD205.jsp?xe_id=" + request.getParameter("xe_id") + "&dt_id=" + request.getParameter("dt_id") + "'";
    %>
    <script>
        alert(<%='"' + resCheck + '"'%>);
        location.href = <%=url%>
    </script>
    <%
        }

    } catch (Exception ex) {
        String url = "'" + "./gdNhapThongTinXeHD205.jsp?xe_id=" + request.getParameter("xe_id") + "&dt_id=" + request.getParameter("dt_id") + "'";
        ex.printStackTrace();
    %>
    <script>

        alert(<%='"' +"Lỗi nhập" + '"'%>);
        location.href = <%=url%>
    </script>
    <%
        }
        // response.sendRedirect("./gdDanhSachXe205.jsp?" + "dt_id=" + request.getParameter("dt_id"));
    %>
</html>
