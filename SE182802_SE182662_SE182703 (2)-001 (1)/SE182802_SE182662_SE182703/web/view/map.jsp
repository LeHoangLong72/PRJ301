<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/template/css/style.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/template/wowslider/wowslider.css">
        <script type="text/javascript" src="<%= request.getContextPath()%>/template/wowslider/jquery.js"></script>
        <title>Về Chúng Tôi - Game Store</title>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <!-- Bắt đầu Wrapper -->
        <section class="wrapper support-page">
            <style>
                .support-page {
                    font-family: Arial, sans-serif;
                    text-align: center;
                    padding: 40px 0;
                }

                .support-page .container {
                    max-width: 900px;
                    margin: 0 auto;
                    padding: 20px;
                    background: #1e1e1e;
                    color: white;
                    border-radius: 10px;
                    box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
                }

                .support-page h1 {
                    color: white;
                }

                .founders {
                    display: flex;
                    justify-content: space-around;
                    margin-top: 20px;
                }

                .founder {
                    text-align: center;
                }

                .founder img {
                    width: 120px;
                    height: 120px;
                    border-radius: 50%;
                    border: 3px solid #ffcc00;
                }

                .story {
                    margin-top: 30px;
                    font-size: 18px;
                    line-height: 1.6;
                    text-align: justify;
                }

                footer {
                    margin-top: 50px;
                    padding: 20px;
                    background: #20232a;
                }
            </style>

            <div class="container">
                <h1>Về Chúng Tôi</h1>
                <p>Chào mừng bạn đến với Game Store! Chúng tôi là những game thủ và lập trình viên đầy đam mê đến từ Đại học FPT TP.HCM, Việt Nam.</p>

                <div class="founders">
                    <div class="founder">
                        <img src="images/solo_1.jpg" alt="Lê Hoàng Long">
                        <p>Lê Hoàng Long (K18)</p>
                    </div>
                    <div class="founder">
                        <img src="images/solo_3.jpg" alt="Đặng Hoàng Phúc"/>
                        <p>Đặng Hoàng Phúc (K18)</p>
                    </div>
                    <div class="founder">
                        <img src="images/solo_2.jpg" alt="Lê Nguyễn Diệp Huy">
                        <p>Lê Nguyễn Diệp Huy (K18)</p>
                    </div>
                </div>

                <div class="story">
                    <h2>Câu Chuyện Của Chúng Tôi</h2>
                    <p>Mọi chuyện bắt đầu từ một căn phòng ký túc xá nhỏ tại Đại học FPT, nơi ba game thủ đam mê cùng nhau ấp ủ một giấc mơ: tạo ra một cửa hàng game thực sự thấu hiểu nhu cầu của người chơi.
                        Chúng tôi đã trải qua vô số đêm thức trắng để cùng nhau lên ý tưởng, viết code, và thử nghiệm, sống nhờ mì gói và một niềm đam mê cháy bỏng với thế giới game.
                        Ngày nay, Game Store không chỉ là một nền tảng – mà còn là một cộng đồng nơi game thủ có thể tìm kiếm, khám phá và tận hưởng những tựa game tuyệt vời nhất trên thế giới.</p>
                    <p>Hãy cùng đồng hành với chúng tôi và làm cho thế giới game ngày càng tuyệt vời hơn nhé!</p>
                </div>
            </div>
        </section>
        <!-- Kết thúc Wrapper -->

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Bắt đầu Wowslider -->
        <script type="text/javascript" src="<%= request.getContextPath()%>/template/wowslider/wowslider.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath()%>/template/wowslider/script.js"></script>
        <!-- Kết thúc Wowslider -->
    </body>

</html>
