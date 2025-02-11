<%-- 
    Document   : output
    Created on : Feb 10, 2025, 11:06:11 AM
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
        <%
            int n = (int)request.getAttribute("n");
            %>
            <span style="font-size: 20px">Bảng cửu chương <%=n%>:</span><br/>
        <%
            for (int j = 1; j <= 10; j++) {
        %>
        <%=n%> x <%=j%> = <%=n * j%><br/>

        <%
            }
        %>
    </body>
</html>
