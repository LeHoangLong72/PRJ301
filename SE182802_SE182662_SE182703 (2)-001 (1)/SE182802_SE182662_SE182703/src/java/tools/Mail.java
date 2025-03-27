package tools;

import dto.UserDTO;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class Mail {

    private static final String EMAIL = "nganlang9377@gmail.com";  // Email gửi đi
    private static final String PASSWORD = "jjmrwarefoyfoszr";  // Mật khẩu ứng dụng

    public static void sendEmail(UserDTO user) throws Exception {
        String to = user.getEmail(); // Lấy email của người nhận
        String subject = MimeUtility.encodeText("Xác nhận Đăng ký tài khoản", "UTF-8", "B"); // Fix lỗi Unicode
        
        String loginUrl = "http://localhost:8080/GameVui/view/login.jsp";
        
        // Nội dung email sử dụng fullname và username chính xác
        String messageText = "<html><body style='font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f4; padding: 20px;'>"
    + "<div style='max-width: 500px; background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);'>"
    + "<h2 style='color: #007bff;'>Xác nhận Đăng ký Tài khoản</h2>"
    + "<p style='font-size: 16px; color: #333;'>Chào <b>" + user.getFullName() + "</b>,</p>"
    + "<p style='font-size: 14px; color: #555;'>Bạn đã đăng ký thành công tài khoản trên hệ thống.</p>"
    + "<p><b>Tên đăng nhập:</b> " + user.getUserName() + "</p>"
    + "<p><b>Email:</b> " + user.getEmail() + "</p>"
    + "<a href='" + loginUrl + "' style='display: inline-block; background-color: #28a745; color: white; text-decoration: none; padding: 10px 20px; border-radius: 5px; font-weight: bold;'>Đăng nhập ngay</a>"
    + "<p style='margin-top: 20px; font-size: 14px; color: #777;'>Nếu bạn không yêu cầu đăng ký, vui lòng bỏ qua email này.</p>"
    + "<p style='font-size: 12px; color: #999;'>Trân trọng,<br><b>Đội ngũ hỗ trợ</b></p>"
    + "</div></body></html>";


        // Cấu hình SMTP server của Gmail
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Xác thực tài khoản gửi email
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL, PASSWORD);
            }
        });

        // Tạo email
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(EMAIL, MimeUtility.encodeText("Hệ thống Đăng ký", "UTF-8", "B"))); // Fix lỗi Unicode // Tên hiển thị của email gửi
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setContent(messageText, "text/html; charset=UTF-8"); // Định dạng HTML + UTF-8

        // Gửi email
        Transport.send(message);
        System.out.println("✅ Email xác nhận đã gửi thành công!");
    }


}
