<%-- 
    Document   : inc_login
    Created on : Mar 25, 2025, 9:01:00 AM
    Author     : LAM
--%>

<%@page import="tools.helper"%>
<%@page import="dto.gameDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.gameDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    gameDAO gdao = new gameDAO();

    CategoryDAO cdao = new CategoryDAO();
    List<gameDTO> listGameHot = gdao.getListGameHot();
    List<gameDTO> listGameChoiNhieuNhat = gdao.getListGameChoiNhieuNhat();

%>

<section class="wrapper">
    <section class="content-left">
        <section class="game-hot">
            <section class="slider">
                <div id="wowslider-container1">
                    <div class="ws_images">
                        <ul>
                            <%for (int i = 0; i < 5; i++) {%>
                            <li><a href="playgame.jsp?idGame=<%= listGameHot.get(i).getGameID()%>" target="_self">
                                    <img src="<%= request.getContextPath()%>/template/games/img/<%= listGameHot.get(i).getGameImage()%>" 
                                         alt="<%= listGameHot.get(i).getGameName()%>" title="<%= listGameHot.get(i).getGameName()%>"/>
                                </a>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                    <div class="ws_bullets">
                        <div>
                            <%for (int i = 0; i < 5; i++) {%>
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
                        for (int i = 5; i < 11; i++) {
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
        <section class="login">
            <header class="title-login-register">ĐĂNG NHẬP</header>



            <form action="<%= request.getContextPath()%>/LoginServlet" method="post" id="login-register-form">
                <div class="row">
                    <label for="username">Tên đăng nhập<span class="red asterisk bold"> *</span></label>
                    <input name="username" id="username" type="text" required autofocus >
                </div>
                <div class="row">
                    <label for="password">Mật khẩu<span class="red asterisk bold"> *</span></label>
                    <input name="password" id="password" type="password" required >
                </div>
                <div class="row-submit">
                    <input type="hidden" name="action" value="login"/>
                    <button type="submit" name="submit">Đăng nhập</button>

                    <% String errorMessage = (String) request.getAttribute("ERROR_MESSAGE"); %>
                    <% if (errorMessage != null) {%>
                    <p class="error-message" style="color: red; font-weight: bold;"><%= errorMessage%></p>
                    <% }%>
                </div>
                <div class="row">
                    <a href="<%= request.getContextPath()%>/view/register.jsp" class="dont-have-account">Chưa có tài khoản?</a>
                </div>

            </form>
        </section>
    </section>
    <aside class="content-right">

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
                    <a href="playgame.jsp?idGame=<%= item.getGameID()%>">
                        <img src="<%= request.getContextPath()%>/template/games/img/<%= item.getGameImage()%>" 
                             alt="<%= item.getGameName()%>"></a>
                    <section>
                        <a href="playgame.jsp?idGame=<%= item.getGameID()%>"><h5><%= helper.cutString(item.getGameName(), 20)%></h5></a>
                        <p>Lượt chơi: <%= helper.formatNumber(item.getGameLuotChoi())%></p>
                    </section>
                </article>
                <%}%>
            </section>
        </section>
    </aside>
</section>
