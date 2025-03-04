<%-- 
    Document   : search
    Created on : Mar 2, 2025, 9:40:04 AM
    Author     : LAM
--%>

<%@page import="java.util.List"%>
<%@page import="dto.StartupProjectsDTO"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (session.getAttribute("user") != null) {
                UserDTO user = (UserDTO)session.getAttribute("user");
        %>
        <h1>Welcome <%= user.getName()%></h1>
        
        <% 
            String searchTerm = request.getAttribute("searchTerm") + "";
            searchTerm = searchTerm.equals("null") ? "" : searchTerm;
        %>
        <form action="MainController">
            <input type="hidden" name="action" value="logout"/>
            <input type="submit" value="Logout"/>
        </form>
        <form action="MainController">
            <input type="hidden" name="action" value="search"/>
            Search: <input type="text" name="searchTerm" value="<%=searchTerm%>"/><br/>
            <input type="submit" value="Search"/>
        </form>
            
            <%
                if (request.getAttribute("projects") != null) {
                    List<StartupProjectsDTO> projects = (List<StartupProjectsDTO>) request.getAttribute("projects");
           %>
        
           <br/>
            <table border="1">
                <thead>
                    <tr>
                        <th>ProjectID</th>
                        <th>ProjectName</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>EstimatedLaunch</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (StartupProjectsDTO p : projects) {
                             
                    %>
                    <tr>
                        <td><%=p.getProjectID()%></td>
                        <td><%=p.getProjectName()%></td>
                        <td><%=p.getDescription()%></td>
                        <td><%=p.getStatus()%></td>
                        <td><%=p.getEstimatedLaunch()%></td>
                    </tr>
                    
                    <% 
                        }
                    %>
                </tbody>
            </table>
            
            <% }
                } else{
            %>
            <span style="font-weight: bold; color: red"> 
                ⚠ You do not have permission to access this page! Please log in.
            </span>
           
            <%
                }
            %>
        
    </body>
</html>
