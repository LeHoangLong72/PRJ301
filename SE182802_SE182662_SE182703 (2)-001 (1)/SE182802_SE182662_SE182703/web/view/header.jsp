<%@page import="dto.UserDTO"%>
<%@page import="dto.CategoryDTO"%>
<%@page import="dao.CategoryDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Start Header -->
<header class="header-top">
    <section class="container">
        <section class="logo">
            <img src="<%= request.getContextPath()%>/template/images/logo.gif" alt="Logo">
        </section>

        <!-- Tìm kiếm -->
        <form action="<%= request.getContextPath()%>/search" class="searchform cf" method="get">
            <input type="text" name="search" placeholder="Bạn muốn chơi game gì?" />
            <button type="submit">Search</button>
        </form>

        <!-- Thông tin người dùng -->
        <%
            UserDTO loggedInUser = (UserDTO) session.getAttribute("USER");
        %>
            <%
            if (loggedInUser != null) {
        %>
        <p class="welcome-message">Chào, <b><%= loggedInUser.getFullName()%></b>!</p>
        <button id="button-logout">
            <a href="<%= request.getContextPath()%>/LogoutServlet">Đăng xuất</a>
        </button>
        <% } else {%>
        <button id="button-login">
            <a href="<%= request.getContextPath()%>/view/login.jsp">Đăng nhập</a>
        </button>
        <button id="button-register">
            <a href="<%= request.getContextPath()%>/view/register.jsp">Đăng ký</a>
        </button>
        <% } %>
    </section>
</header>
<!-- End Header -->

<!-- Start Menu -->
<%
    CategoryDAO cdao = new CategoryDAO();
%>
<nav class="menu">
    <section class="container">
        <ul>
            <li><a href="<%= request.getContextPath()%>/view/index.jsp">Trang chủ</a></li>
                <%
                    for (CategoryDTO item : cdao.getListCategory()) {
                        if (item.isVisiableMenu()) {
                %>
            <li>
                <a href="theloaigame.jsp?id=<%= item.getCategoryID()%>">
                    <%= item.getCategoryName()%>
                </a>
            </li>
            <%
                    }
                }
            %>
            <!-- Nút Giỏ hàng đặt ở cuối danh sách -->
            <li id="cart-button">
                <a href="<%= request.getContextPath()%>/view/cart.jsp">🛒 Giỏ hàng</a>
            </li>
        </ul>
    </section>
</nav>
<!-- End Menu -->
