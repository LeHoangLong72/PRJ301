package controller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tools.Mail;

/**
 *
 * @author LAM
 */
public class UserServlet extends HttpServlet {

    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String command = request.getParameter("command");
        UserDTO user = new UserDTO();
        String url = "";

        user.setFullName(request.getParameter("name"));
        user.setAddress(request.getParameter("address"));

        switch (command) {
            case "insert":
                if ("true".equals(request.getParameter("user-result"))) {
                    user.setUserName(request.getParameter("username")); // ✅ Lấy đúng username
                    user.setPassword(request.getParameter("password"));
                    user.setEmail(request.getParameter("email"));
                    user.setFullName(request.getParameter("name")); // ✅ Lấy đúng fullname

                    if (request.getParameter("sex") != null) {
                        user.setSex("nam".equals(request.getParameter("sex")) ? "Nam" : "Nữ");
                    }

                    String birthday = request.getParameter("birthday");
                    user.setBirthday((birthday == null || birthday.isEmpty()) ? null : birthday);
                    user.setAddress(request.getParameter("address"));

                    try {
                        userDAO.insertUser(user);
                        Mail.sendEmail(user); // ✅ Gửi trực tiếp user (theo phương thức có 1 tham số UserDTO)
                        System.out.println("📧 Đã gửi email xác nhận đến: " + user.getEmail());
                    } catch (Exception e) {
                        e.printStackTrace();
                        System.out.println("❌ Lỗi khi gửi email!");
                    }

                    url = "/view/success.jsp";
                } else {
                    url = "/view/register.jsp";
                    request.setAttribute("error", "Tên đăng nhập đã tồn tại");
                }
                break;

            case "login":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                // 🛠 Xử lý đăng nhập (không thay đổi)
                break;
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
