<%-- 
    Document   : footer
    Created on : Mar 15, 2025, 9:04:34 AM
    Author     : as
--%>

<%@page import="dao.CategoryDAO"%>
<%@page import="dto.CategoryDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    CategoryDAO cdao = new CategoryDAO();
%>
<section class="sitemap">

    <%
        int count = 0;
        for (CategoryDTO item : cdao.getListCategory()) {
            count ++;
            String className = (count % 5 == 0) ? "box-sitemap-last" : "box-sitemap";
    %>
    <div class="<%= className%>"><a href="theloaigame.jsp?id=<%= item.getCategoryID()%>"><%= item.getCategoryName()%></a></div>
    <%   
        }    
    %>
    
</section>

<footer class="footer">
    <a href="https://www.facebook.com/profile.php?id=61559721891185"><img src="<%= request.getContextPath()%>/template/images/facebook.png" /></a>
    <a href="https://www.google.co.uk/"><img src="<%= request.getContextPath()%>/template/images/gmail.png" /></a>
    <a href="<%= request.getContextPath()%>/view/contact.jsp"><img src="<%= request.getContextPath()%>/template/images/contact.png" /></a>
    <a href="<%= request.getContextPath()%>/view/map.jsp"><img src="<%= request.getContextPath()%>/template/images/map.png" /></a>
    <div>
        <p>Chơi game lành mạnh, vui vẻ, sắp xếp thời gian hợp lý, tận hưởng cuộc sống lành mạnh, học tập tốt và lao động
            tốt.
            </br>
            Chịu trách nhiệm nội dung: Hoàng Phúc - Hoàng Long - Diệp Huy. ©2026 Đệ tử Thầy Tùng, sinh viên Đại học FPT Hồ Chí Minh, Địa chỉ: Nhà Trắng, Q9,
            tp.HCM . Điện thoại lừa đảo: 028 7300 5585.</p>
    </div>

</footer>