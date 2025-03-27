
<%@page import="dto.advertisingDTO"%>
<%@page import="tools.helper"%>
<%@page import="dto.gameDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.advertisingDAO"%>
<%@page import="dao.gameDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    gameDAO gdao = new gameDAO();
    advertisingDAO adao = new advertisingDAO();
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
            <header class="title-login-register">ĐĂNG KÝ THÀNH VIÊN</header>
            <form action="<%= request.getContextPath()%>/UserServlet" method="post" id="login-register-form">
                <% if (request.getAttribute("error") != null) {%>
                <div class="error-message" style="background-color: #f76565; color: white; padding: 8px 16px; margin-bottom: 12px; border-radius: 4px;">
                    <%= request.getAttribute("error")%>
                </div>
                <% } %>

                <div class="row">
                    <label for="username">Tên đăng nhập<span class="red asterisk bold"> *</span></label>
                    <input name="username" id="username" type="text" required autofocus
                           pattern="^[A-Za-z0-9](?:[A-Za-z0-9_]{0,18}[A-Za-z0-9])?$"
                           title="Tên đăng nhập chỉ được phép chứa chữ cái, chữ số và dấu gạch dưới ( _ ).
                           Nó phải bắt đầu và kết thúc bằng chữ cái hoặc chữ số, và tối đa 20 ký tự.
                           Tên đăng nhập có thể đã tồn tại.">
                    <span id="user-result" style="position: relative; top: 8px"></span>
                </div>
                <div class="row">
                    <label for="password">Mật khẩu<span class="red asterisk bold"> *</span></label>
                    <input name="password" id="password" type="password"
                           required pattern="^.{1,20}$"
                           title="Mật khẩu tối đa 20 ký tự">
                </div>
                <div class="row">
                    <label for="email">Email<span class="red asterisk bold"> *</span></label>
                    <input name="email" id="email" type="email" required>
                </div>
                <div class="row">
                    <label for="name">Họ & tên</label>
                    <input name="name" id="name" type="text">
                </div>
                <div class="row">
                    <label for="">Giới tính</label>
                    <input name="sex" value="nam" type="radio">Nam&nbsp;&nbsp;
                    <input name="sex" value="nu" type="radio">Nữ
                </div>
                <div class="row">
                    <label for="birthday">Ngày sinh</label>
                    <input name="birthday" id="birthday" type="date">
                </div>
                <div class="row">
                    <label for="address">Địa chỉ</label>
                    <input name="address" id="address" type="text">
                </div>
                <div class="row-submit">
                    <input type="hidden" name="command" value="insert"/>
                    <button type="submit" name="submit">Đăng ký</button>
                    <button type="reset">Làm lại</button>
                </div>


            </form>
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