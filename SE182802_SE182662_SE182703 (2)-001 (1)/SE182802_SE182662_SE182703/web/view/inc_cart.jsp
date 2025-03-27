<%@page import="utils.DBUtils"%>
<%@page import="dto.gameDTO"%>
<%@page import="dto.UserDTO"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    UserDTO user = (UserDTO) session.getAttribute("USER");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = user.getUserID();
    List<gameDTO> cart = new ArrayList<>();

    try {
        Connection conn = DBUtils.getConnection();
        String sql = "SELECT g.id_game, g.tengame FROM cart c JOIN game g ON c.id_game = g.id_game WHERE c.id_user = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            cart.add(new gameDTO(rs.getInt("id_game"), rs.getString("tengame")));
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    session.setAttribute("cart", cart); // Cập nhật giỏ hàng vào session để sử dụng lại
%>

<section class="content-left">
    <header class="title-box-playgame">🛒 Giỏ hàng của bạn</header>

    <section class="box-playgame">
        <% if (cart.isEmpty()) {%>
        <div class="empty-cart">
            <img src="<%= request.getContextPath()%>/template/images/empty-cart.jpg" 
                 alt="Giỏ hàng trống" class="empty-cart-img">
            <h2>Giỏ hàng của bạn đang trống! 😔</h2>
            <p>Bạn chưa thêm sản phẩm nào vào giỏ hàng.</p>
            <a href="index.jsp" class="shop-now-btn">Mua sắm ngay</a>
        </div>
        <% } else { %>
        <table class="cart-table">
            <tr>
                <th>Tên game</th>
                <th>Hành động</th>
            </tr>
            <% for (gameDTO game : cart) {%>
            <tr>
                <td><%= game.getGameName()%></td>
                <td>
                    <form action="AddToCartServlet" method="post">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="gameId" value="<%= game.getGameID()%>">
                        <button type="submit" class="remove-btn">Xóa</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
        <% }%>
    </section>
</section>

<style>
    .empty-cart {
        text-align: center;
        padding: 30px;
    }
    .empty-cart-img {
        width: 150px;
        margin-bottom: 20px;
    }
    .empty-cart h2 {
        font-size: 24px;
        color: #ff4d4d;
        margin-bottom: 10px;
    }
    .empty-cart p {
        font-size: 18px;
        color: #666;
    }
    .shop-now-btn {
        display: inline-block;
        margin-top: 15px;
        padding: 10px 20px;
        background-color: #28a745;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
    }
    .shop-now-btn:hover {
        background-color: #218838;
    }
    .cart-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .cart-table th, .cart-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    .cart-table th {
        background-color: #f8f9fa;
    }
    .remove-btn {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 8px 12px;
        cursor: pointer;
        border-radius: 5px;
    }
    .remove-btn:hover {
        background-color: #c82333;
    }
</style>
