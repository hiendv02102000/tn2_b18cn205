<%-- 
    Document   : gdDanhSachXe205
    Created on : Nov 24, 2022, 1:53:50 PM
    Author     : Admin
--%>


<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.DoiTac205"%>
<%@page import="dao.DoiTac205DAO"%>
<%@page import="java.util.*"%>
<%@page import="model.XeHopDong205"%>
<%@page import="model.Xe205"%>
<%@page import="java.util.List"%>
<%@page import="dao.Xe205DAO"%>
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

        int dtID = 0;
        try {
            dtID = Integer.parseInt(request.getParameter("dt_id"));
        } catch (Exception ex) {
            response.sendRedirect("./gdDanhSachDT205.jsp");
            return;
        }
        if (dtID <= 0) {
            response.sendRedirect("./gdDanhSachDT205.jsp");
            return;
        }
        DoiTac205DAO daoDT = new DoiTac205DAO();
        DoiTac205 dt = daoDT.getDoiTacTheoID(dtID);
        session.setAttribute("dt_kg", dt);
        Xe205DAO daoXe = new Xe205DAO();
        List<Xe205> dsXe = (List<Xe205>) session.getAttribute("ds_xe"+dtID);
        if (dsXe == null) {
            dsXe = daoXe.getDSXeCuaDoiTac(dtID);
            session.setAttribute("ds_xe"+dtID, dsXe);
        }

        List<XeHopDong205> dsXeHD = (List<XeHopDong205>) session.getAttribute("ds_xe_hd"+dtID);
        if (dsXeHD == null) {
            dsXeHD = new ArrayList<XeHopDong205>();
            session.setAttribute("ds_xe_hd"+dtID, dsXeHD);
        }
        Map<Integer, XeHopDong205> m = new HashMap<>();
        for (XeHopDong205 xeHD : dsXeHD) {
            if (!m.containsKey(xeHD.getXe().getId())) {

                m.put(xeHD.getXe().getId(), xeHD);
            }
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title><%="Danh s??ch xe c???a ?????i t??c:" + dt.getHoTen()%></title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        <div class="content">
            <nav class="navbar navbar-light navbar-color">
                <span class="navbar-brand mb-0 h1 grid wide"><%="Danh s??ch xe c???a ?????i t??c " + dt.getHoTen()%> </span>
            </nav>

            <div class="list-table grid wide">
                <table class="table table-bordered ">
                    <thead>
                        <tr>
                            <th scope="col">Bi???n s???</th>
                            <th scope="col">H??ng xe</th>
                            <th scope="col">D??ng xe</th>
                            <th scope="col">?????i xe</th>
                            <th scope="col">M?? t???</th>
                            <th scope="col">Ch???n xe</th>
                            <th scope="col">Th??ng tin xe h???p ?????ng (Xe ???? ???????c ch???n)</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String pattern = "dd-MM-yyyy";
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
                            for (Xe205 xe : dsXe) {
                                if (!m.containsKey(xe.getId())) {
                                    continue;
                                }
                                XeHopDong205 xeHD = m.get(xe.getId());
                                 
                                String bd = formatter.format(xeHD.getNgayBatDau());
                                String kt = formatter.format(xeHD.getNgayKetThuc());
                        %>
                        <tr>
                            <td><%=xe.getBienSo()%></td>
                            <td><%=xe.getHangXe()%></td>
                            <td><%=xe.getDongXe()%></td>
                            <td><%=xe.getDoiXe()%></td>
                            <td><%=xe.getMoTa()%></td>
                            <td class="select-item" onclick=<%="\"location.href = './gdNhapThongTinXeHD205.jsp?xe_id=" + xe.getId() + "&dt_id=" + dtID + "'\""%>></a>S???a</td>
                            <td>
                                <p>????n gi??: <%=xeHD.getDonGia()%>VND</p>
                                <p>Ng??y b???t ?????u:<%=bd%> </p>
                                <p>Ng??y k???t th??c:<%=kt%> </p>
                                <p>T??nh tr???ng:<%=xeHD.getTinhTrang()%> </p>
                            </td>

                        </tr>
                        <%
                            }
                        %>
                        <%
                            for (Xe205 xe : dsXe) {
                                if (m.containsKey(xe.getId())) {
                                    continue;
                                }

                        %>
                        <tr>
                            <td><%=xe.getBienSo()%></td>
                            <td><%=xe.getHangXe()%></td>
                            <td><%=xe.getDongXe()%></td>
                            <td><%=xe.getDoiXe()%></td>
                            <td><%=xe.getMoTa()%></td>
                            <td class="select-item" onclick=<%="\"location.href = './gdNhapThongTinXeHD205.jsp?xe_id=" + xe.getId() + "&dt_id=" + dtID + "'\""%>></a>Ch???n</td>
                            <td>
                            </td>

                        </tr>
                        <%
                            }
                        %>
                        <!--                        <tr>
                                                    <td>30Y512345</td>
                                                    <td>Mercedes-Benz</td>
                                                    <td>Sedans</td>
                                                    <td>EQS</td>
                                                    <td></td>
                                                    <td class="select-item" onclick="location.href = './gdNhaptt.html'"></a>Ch???n</td>
                                                    <td>????n gi?? :500000
                                                        T??nh Tr???ng:T???t
                                                        Ng??y B???t ?????u :22/12/2022
                                                        Ng??y K???t th??c:29/12/2022
                                                    </td>
                        
                                                </tr>
                                                <tr>
                                                    <td>30Y512345</td>
                                                    <td>Mercedes-Benz</td>
                                                    <td>Sedans</td>
                                                    <td>EQS</td>
                                                    <td></td>
                                                    <td class="select-item" onclick="location.href = './gdNhaptt.html'"></a>Ch???n</td>
                                                    <td>????n gi?? :500000
                                                        T??nh Tr???ng:T???t
                                                        Ng??y B???t ?????u :22/12/2022
                                                        Ng??y K???t th??c:29/12/2022
                                                    </td>
                        
                                                </tr>
                                                <tr>
                                                    <td>30Y512345</td>
                                                    <td>Mercedes-Benz</td>
                                                    <td>Sedans</td>
                                                    <td>EQS</td>
                                                    <td></td>
                                                    <td class="select-item" onclick="location.href = './gdNhaptt.html'"></a>Ch???n</td>
                                                    <td>????n gi?? :500000
                                                        T??nh Tr???ng:T???t
                                                        Ng??y B???t ?????u :22/12/2022
                                                        Ng??y K???t th??c:29/12/2022
                                                    </td>
                                                </tr>-->
                    </tbody>
                </table>
                <div class="fun-button grid wide">
                    <button type="button" class="btn btn-success btn-fun" onclick="location.href = './gdXemTruocHopDong205.jsp'">X??c nh???n</button>
                </div>
            </div>
        </div>

    </body>

</html>
