<%-- 
    Document   : login
    Created on : Mar 25, 2025, 9:00:33 AM
    Author     : LAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/template/css/style.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/template/wowslider/wowslider.css">
        <script type="text/javascript" src="<%= request.getContextPath()%>/template/wowslider/jquery.js"></script>
        <title>Document</title>
        
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Start Wrapper  -->
            <section class="wrapper">
            <jsp:include page="inc_login.jsp"></jsp:include>
            </section>
            <!-- End Wrapper -->

        <jsp:include page="footer.jsp"></jsp:include>
            <!-- Start Wowslider -->
            <script type="text/javascript" src="<%= request.getContextPath()%>/template/wowslider/wowslider.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath()%>/template/wowslider/script.js"></script>
        <!-- End Wowslider -->
    </body>
</html>
