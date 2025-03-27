<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

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
            <section class="wrapper support-page">
                <style>
                    .support-page {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        min-height: 100vh;
                        background-color: #121212;
                        color: #ffffff;
                        padding: 40px 20px;
                        box-sizing: border-box;
                    }

                    .support-page .container {
                        max-width: 800px;
                        width: 100%;
                        background: #1e1e1e;
                        border-radius: 12px;
                        padding: 30px;
                        box-shadow: 0 0 20px rgba(255, 255, 255, 0.05);
                        text-align: center;
                    }

                    .support-page h1 {
                        color: #ffcc00;
                        font-size: 32px;
                        margin-bottom: 10px;
                    }

                    .support-page .contact p,
                    .support-page .faq p {
                        font-size: 16px;
                        line-height: 1.6;
                    }

                    .support-page .contact {
                        margin: 25px 0;
                    }

                    .support-page .faq {
                        text-align: left;
                        margin-top: 30px;
                    }

                    .support-page .faq h2 {
                        color: #ffcc00;
                        font-size: 22px;
                        margin-bottom: 15px;
                    }

                    .support-page a {
                        color: #ffcc00;
                        text-decoration: none;
                    }

                    .support-page a:hover {
                        text-decoration: underline;
                    }
                </style>

                <div class="container">
                    <h1>- Support Center - Game Mini</h1>
                    <p>We're here to assist you! If you have any issues, feel free to reach out through the channels below:</p>

                    <div class="contact">
                        <p><strong>Email:</strong> <a href="mailto:support@gamestore.com">support@gamestore.com</a></p>
                        <p><strong>Phone:</strong> 1900-123-456</p>
                        <p><strong>Time:</strong> 8:00 AM - 10:00 PM (Daily)</p>
                    </div>

                    <div class="faq">
                        <h2>FAQ - Frequently Asked Questions</h2>
                        <p><strong>• Can I get a refund after purchasing a game?</strong><br>
                            Yes. You can request a refund within <strong>14 days</strong> if you haven’t played more than <strong>2 hours</strong>.</p>
                        <p><strong>• How can I contact customer support?</strong><br>
                            Send us an email or call our hotline for quick assistance.</p>
                        <p><strong>• I'm experiencing an error while downloading a game. What should I do?</strong><br>
                            Check your internet connection and try again. If the issue continues, contact support.</p>
                        <p><strong>• How do I update my payment details?</strong><br>
                            Visit the “Account Settings” section to update your payment info.</p>
                        <p><strong>• Are there any special discounts for students?</strong><br>
                            Yes! Please verify your student status to enjoy the discount.</p>
                    </div>
                </div>
            </section>


            <!-- End Wrapper -->

        <jsp:include page="footer.jsp"></jsp:include>
            <!-- Start Wowslider -->
            <script type="text/javascript" src="<%= request.getContextPath()%>/template/wowslider/wowslider.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath()%>/template/wowslider/script.js"></script>
        <!-- End Wowslider -->
    </body>

</html>