
<%@page import="dto.CategoryDTO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.advertisingDAO"%>
<%@page import="dto.advertisingDTO"%>
<%@page import="tools.helper"%>
<%@page import="dto.gameDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="dao.gameDAO"%>

<%
    int id_game = 1;
    if (request.getParameter("id") != null) {
        try {
            id_game = Integer.parseInt(request.getParameter("id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    gameDAO gdao = new gameDAO();
    advertisingDAO adao = new advertisingDAO();
    CategoryDAO cdao = new CategoryDAO();

    gameDTO game = gdao.getGame(id_game);

    List<gameDTO> listGameChoiNhieuNhat = gdao.getListGameChoiNhieuNhatByIDGame(id_game);
    List<gameDTO> listGameYeuThichNhat = gdao.getListGameYeuThichNhatByIDGame(id_game);

%>
<section class="content-left">
    <header class="title-box-playgame"><%= game.getGameName()%></header>
    <section class="box-playgame">
        <object>
            <param name="movie" value="<%= request.getContextPath()%>/template/games/data/<%= game.getGameFile()%>">
            <param name="quality" value="high">
            <a href="<%= request.getContextPath()%>/template/games/data/<%= game.getGameFile()%>" target="_blank">
                <img src="<%= request.getContextPath()%>/template/games/img/<%= game.getGameImage()%>" 
                     alt="<%= game.getGameName()%>" 
                     style="width: 100%; max-height: 500px; object-fit: cover;" />
            </a>

        </object>
        <section class="content-box-playgame">
            <div class="like">
                <p id="like">
                    <input class="star" id="star" type="checkbox" name="star" />
                    <label class="star" for="star"></label>
                </p>
                <p class="soluong"><%= helper.formatNumber(game.getGameLuotYeuThich())%></p>
                <p id="dow">
                    <input id="dow" class="dow" type="button" name="dow" />
                    <label class="dow" for="dow"></label>
                </p>
                <p class="soluong"><%= helper.formatNumber(game.getGameLuotChoi())%></p>
                <p id="share">
                    <input id="share" class="share" type="button" name="share" />
                    <label class="share" for="share"></label>
                </p>
                <!-- ✅ Thêm nút giỏ hàng -->
                <p>
                    <input id="cartButton" class="cart" type="button" name="cart" onclick="addToCart(<%= game.getGameID()%>)" />
                    <label class="cart" for="cartButton"></label>
                </p>

            </div>
            <%= game.getGameContent()%>
        </section>
    </section>

</section>
<aside class="content-right">
    <section class="quangcao">
        <%
            for (advertisingDTO item : adao.getListAds(1)) {
        %>
        <a href="<%= item.getAdsURL()%>" target="<%= item.getAdsTarget()%>">
            <img src="<%= request.getContextPath()%>/template/images/quangcao/<%= item.getAdsFile()%>" 
                 alt="<%= item.getAdsTitle()%>"></a>
            <%}%>
    </section>
    <section class="game-choinhieunhat">
        <header class="title-game-choinhieunhat">Game chơi nhiều nhất</header>
        <section class="content-game-choinhieunhat">
            <%
                int count_2 = 0;
                int size_2 = listGameChoiNhieuNhat.size();
                for (gameDTO item : listGameChoiNhieuNhat) {
                    count_2++;
                    String className = (count_2 % size_2 == 0) ? "box-game-choinhieunhat-last" : "box-game-choinhieunhat";
            %>
            <article class="<%= className%>">
                <a href="playgame.jsp?id=<%= item.getGameID()%>">
                    <img src="<%= request.getContextPath()%>/template/games/img/<%= item.getGameImage()%>" 
                         alt="<%= item.getGameName()%>"></a>
                <section>
                    <a href="playgame.jsp?id=<%= item.getGameID()%>"><h5><%= helper.cutString(item.getGameName(), 20)%></h5></a>
                    <p>Lượt chơi: <%= helper.formatNumber(item.getGameLuotChoi())%></p>
                </section>
            </article>
            <%}%>
        </section>
    </section>
    <section class="game-choinhieunhat">
        <header class="title-game-choinhieunhat">Game yêu thích nhiều nhất</header>
        <section class="content-game-choinhieunhat">
            <%
                int count_3 = 0;
                int size_3 = listGameYeuThichNhat.size();
                for (gameDTO item : listGameYeuThichNhat) {
                    count_3++;
                    String className = (count_3 % size_3 == 0) ? "box-game-choinhieunhat-last" : "box-game-choinhieunhat";
            %>
            <article class="<%= className%>">
                <a href="playgame.jsp?idGame=<%= item.getGameID()%>">
                    <img src="<%= request.getContextPath()%>/template/games/img/<%=  item.getGameImage()%>" 
                         alt="<%= item.getGameName()%>"></a>
                <section>
                    <a href="playgame.jsp?idGame=<%= item.getGameID()%>"><h5><%= helper.cutString(item.getGameName(), 20)%></h5></a>
                    <p>Lượt yêu thích: <%= helper.formatNumber(item.getGameLuotYeuThich())%></p>
                </section>
            </article>
            <%}%>
        </section>
    </section>

</aside>
