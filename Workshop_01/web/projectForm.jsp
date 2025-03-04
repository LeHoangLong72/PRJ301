<%-- 
    Document   : projectForm
    Created on : Mar 4, 2025, 1:49:50 PM
    Author     : LAM
--%>

<%@page import="dto.StartupProjectsDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            StartupProjectsDTO project = new StartupProjectsDTO();
            try {
                    project = (StartupProjectsDTO) request.getAttribute("project");
                } catch (Exception e) {
                    project = new StartupProjectsDTO();
                }
        %>
        
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="add"/>
            Project ID: <input type="text" name="txtProjectID"/><br/>
            Project Name: <input type="text" name="txtProjectName"/><br/>
            Description: <input type="text" name="txtDecription"/><br/>
            Status: <input type="text" name="txtStatus"/><br/>
            Estimated Launch: <input type="text" name="txtEstimatedLaunch"/><br/>
            <input type="submit" value="Save"/>
            <input type="reset" value="Reset"/>
        </form>
    </body>
</html>
