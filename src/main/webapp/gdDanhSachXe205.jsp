<%-- 
    Document   : gdDanhSachXe205
    Created on : Nov 24, 2022, 1:53:50 PM
    Author     : Admin
--%>


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
        }

        int dtID = 0;
        try {
            dtID = Integer.parseInt(request.getParameter("dt_id"));
        } catch (Exception ex) {
            response.sendRedirect("./gdDanhSachDT205.jsp");
        }
        if (dtID <= 0) {
            response.sendRedirect("./gdDanhSachDT205.jsp");
        }
        DoiTac205DAO daoDT = new DoiTac205DAO();
        DoiTac205 dt = daoDT.getDoiTacByID(dtID);
        Xe205DAO daoXe = new Xe205DAO();
        List<Xe205> dsXe = (List<Xe205>) session.getAttribute("ds_xe");
        if (dsXe == null) {
            dsXe = daoXe.getDSXeCuaDoiTac(dtID);
        }

        List<XeHopDong205> dsXeHD = (List<XeHopDong205>) session.getAttribute("ds_xe_hd");
        if (dsXeHD == null) {
            dsXeHD = new ArrayList<XeHopDong205>();
            session.setAttribute("ds_xe_hd", dsXeHD);
        }
        Map<Integer, String> m = new HashMap<>();
        for (XeHopDong205 xeHD : dsXeHD) {
            if (!m.containsKey(xeHD.getXe().getId())) {
                String ttXe = "Đơn giá" + xeHD.getDonGia() + "\n"
                        + "Tình Trạng:" + xeHD.getTinhTrang() + "\n"
                        + "Ngày Bắt đầu :" + xeHD.getNgayBatDau() + "\n"
                        + "Ngày Kết thúc:" + xeHD.getNgayKetThuc() + "\n";
                m.put(xeHD.getXe().getId(), ttXe);
            }
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title><%="Danh sách xe của đối tác:" + dt.getHoTen()%></title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        <div class="content">
            <nav class="navbar navbar-light navbar-color">
                <span class="navbar-brand mb-0 h1 grid wide"><%="Danh sách xe của đối tác " + dt.getHoTen()%> </span>
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
                        <%
                            for (Xe205 xe : dsXe) {
                                if (!m.containsKey(xe.getId())) {
                                    continue;
                                }
                                String ttHD = m.get(xe.getId());
                        %>
                        <tr>
                            <td><%=xe.getBienSo()%></td>
                            <td><%=xe.getHangXe()%></td>
                            <td><%=xe.getDongXe()%></td>
                            <td><%=xe.getDoiXe()%></td>
                            <td><%=xe.getMoTa()%></td>
                            <td class="select-item" onclick=<%="\"location.href = './gdNhapThongTinXeHD205.jsp?xe_id=" + xe.getId()+"&dt_id="+dtID + "'\""%>></a>Sửa</td>
                            <td><%=ttHD%>
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
                            <td class="select-item" onclick=<%="\"location.href = './gdNhapThongTinXeHD205.jsp?xe_id=" + xe.getId()+"&dt_id="+dtID + "'\""%>></a>Chọn</td>
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
                                                </tr>-->
                    </tbody>
                </table>
            </div>
        </div>

    </body>

</html>
