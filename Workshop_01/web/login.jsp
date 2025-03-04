<%-- 
    Document   : login
    Created on : Mar 2, 2025, 9:17:19 AM
    Author     : LAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            Username <input type="text" name="txtUsername"/><br/>
            Password <input type="password" name="txtPassword"/><br/>
            <input type="submit" value="Login"/>
            
            <%
                String message = request.getAttribute("message") + "";
            %>
            
            <br/>
            <span style="color: red;"><%= message.equals("null") ? "" : message%></span>
        </form>
    </body>
</html>
