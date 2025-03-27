<%@page import="dto.gameDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.advertisingDAO"%>
<%@page import="dto.advertisingDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    advertisingDAO adao = new advertisingDAO();
    List<gameDTO> games = (List<gameDTO>) request.getAttribute("games");

    // DEBUG
    out.println("<!-- DEBUG: games is " + (games == null ? "null" : games.size() + " items") + " -->");
%>

<section class="content-left">
    <header class="title-box-playgame">Kết quả tìm kiếm</header>

    <%
        if (games != null && !games.isEmpty()) {
            for (gameDTO game : games) {
    %>
    <div class="box-game">
        <a href="<%= request.getContextPath()%>/view/playgame.jsp?id=<%= game.getGameID()%>" class="game-link">
            <div class="game-image-container">
                <img src="<%= request.getContextPath()%>/template/games/img/<%= game.getGameImage()%>" 
                     alt="<%= game.getGameName()%>" 
                     class="game-image" />
            </div>
            <div class="game-info">
                <p class="game-name"><%= game.getGameName()%></p>
            </div>
        </a>
    </div>


    <%
        }
    } else {
    %>
        <p class="no-game-message">Không tìm thấy game nào.</p>
    <%
        }
    %>
</section>

<aside class="content-right">
    <section class="quangcao">
        <%
            for (advertisingDTO item : adao.getListAds(1)) {
        %>
        <a href="<%= item.getAdsURL()%>" target="<%= item.getAdsTarget()%>">
            <img src="<%= request.getContextPath()%>/template/images/quangcao/<%= item.getAdsFile()%>" 
                 alt="<%= item.getAdsTitle()%>"></a>
            <% }%>
    </section>

    <section class="game-cung-theloai">
        <header class="title-game-cung-theloai">
            <section class="tentheloai"><a href="#">Game bắn súng</a></section>
        </header>
        <section class="list-game">
            <button type="button" class="box-game-xemthem">Xem thêm</button>
        </section>
    </section>
</aside>
