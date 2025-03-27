
<%@page import="dao.CategoryDAO"%>
<%@page import="tools.Pagination"%>
<%@page import="dto.advertisingDTO"%>
<%@page import="tools.helper"%>
<%@page import="dto.gameDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dao.advertisingDAO"%>
<%@page import="dao.gameDAO"%>
<%
    int id_theloai = Integer.parseInt(request.getParameter("id"));
    int paramPage = 1;
    if (request.getParameter("page") != null) {
        try {
            paramPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    gameDAO gdao = new gameDAO();
    advertisingDAO adao = new advertisingDAO();
    CategoryDAO cdao = new CategoryDAO();
    String nameCategory = cdao.getNameCategory(id_theloai);

    //List GameHot & Game Yêu thích 
    List<gameDTO> listGameHot = gdao.getListGameHotByCategoty(id_theloai);
    List<gameDTO> listGameYeuThichNhat = gdao.getListGameYeuThichNhatByCategory(id_theloai);

    //Phần Phân Trang
    int amountItem        = gdao.countGameByCategory(id_theloai);
    Pagination pagination = new Pagination(amountItem, 3, 5, paramPage);
    String link           = "theloaigame.jsp?id=" + id_theloai;
    String showPagination = pagination.showPagination(link);

    //List Game theo page
    List<gameDTO> listGame = gdao.getListGameCategoryAndPage(id_theloai, pagination.getCurrentPage(), pagination.getTotalItemsPerPage());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="content-left">
    <section class="game-hot">
        <section class="slider">
            <div id="wowslider-container1">
                <div class="ws_images">
                    <ul>  
                        <%for (int i = 0; i < listGameHot.size(); i++) {%>
                        <li><a href="playgame.jsp?id=<%= listGameHot.get(i).getGameID()%>" target="_self">
                                <img src="<%= request.getContextPath()%>/template/games/img/<%= listGameHot.get(i).getGameImage()%>" 
                                     alt="<%= listGameHot.get(i).getGameName()%>" title="<%= listGameHot.get(i).getGameName()%>"/>
                            </a>
                        </li>
                        <%}%>       
                    </ul>
                </div>
                <div class="ws_bullets">
                    <div>
                        <%for (int i = 0; i < listGameHot.size(); i++) {%>
                        <a href="playgame.jsp?idGame=<%= listGameHot.get(i).getGameID()%>" title="<%= listGameHot.get(i).getGameName()%>"><%=(i + 1)%></a>
                        <%}%>
                    </div>
                </div>
            </div>
        </section>
        <aside class="sidebar">
            <header class="title-gamehot">Game hay</header>
            <section class="content-gamehot">
                <%
                    int count_1 = 0;
                    for (int i = 0; i < listGameHot.size(); i++) {
                        count_1++;
                        String className = (count_1 % 3 == 0) ? "box-gamehot-last" : "box-gamehot";
                %>
                <article class="<%= className%>">
                    <a href="playgame.jsp?idGame=<%= listGameHot.get(i).getGameID()%>">
                        <img src="<%= request.getContextPath()%>/template/games/img/<%= listGameHot.get(i).getGameImage()%>" 
                             alt="<%= listGameHot.get(i).getGameName()%>"></a>
                    <h3><a href="playgame.jsp?idGame=<%= listGameHot.get(i).getGameID()%>"><%= helper.cutString(listGameHot.get(i).getGameName(), 18)%></a></h3>
                </article>
                <%}%> 
            </section>
        </aside>
    </section>
    <section class="game-cung-theloai">
        <header class="title-game-cung-theloai">
            <section class="tentheloai"><a><%= nameCategory %></a></section>
        </header>
        <section class="list-game">
            <%
                int count_3 = 0;
                for (gameDTO item : listGame) {
                    count_3++;
                    String className = (count_3 % 4 == 0) ? "box-game-last" : "box-game";
            %>
            <article class="<%= className %>">
                <a href="playgame.jsp?id=<%= item.getGameID()%>"><img src="<%= request.getContextPath()%>/template/games/img/<%= item.getGameImage() %>" 
                                 alt="<%= item.getGameName()%>"></a>
                <section>
                    <a href="playgame.jsp?id=<%= item.getGameID()%>"><h5> <%= helper.cutString(item.getGameName(), 20)%> </h5></a>
                    <p>Lượt chơi: <%= helper.formatNumber(item.getGameLuotChoi())%></p>
                </section>
            </article>
            <%}%>
            <div style="text-align: center;">
                <%= showPagination%>
            </div>
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
        <header class="title-game-choinhieunhat">Game yêu thích nhiều nhất</header>
        <section class="content-game-choinhieunhat">
            <article class="box-game-choinhieunhat">
                <%
                    int count_2 = 0;
                    int size_2 = listGameYeuThichNhat.size();
                    for (gameDTO item : listGameYeuThichNhat) {
                        count_2++;
                        String className = (count_2 % size_2 == 0) ? "box-game-choinhieunhat-last" : "box-game-choinhieunhat";
                %>
                <article class="<%= className%>">
                    <a href="playgame.jsp?idGame=<%= item.getGameID()%>">
                        <img src="<%= request.getContextPath()%>/template/games/img/<%= item.getGameImage()%>" 
                             alt="<%= item.getGameName()%>"></a>
                    <section>
                        <a href="playgame.jsp?idGame=<%= item.getGameID()%>"><h5><%= helper.cutString(item.getGameName(), 20)%></h5></a>
                        <p>Lượt thích: <%= helper.formatNumber(item.getGameLuotYeuThich())%></p>
                    </section>
                </article>
                <%}%>
        </section>
    </section>
</aside>
