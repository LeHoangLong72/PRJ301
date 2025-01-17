/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LAM
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    public boolean isValidLogin(String username, String password) {
        return username.equals("admin") && password.equals("12345678");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        String txtUsername = request.getParameter("txtUsername");
        String txtPassword = request.getParameter("txtPassword");

        if (txtUsername.trim().length() == 0) {
            out.println("Please enter username!");
            return;
        }
        if (txtPassword.trim().length() == 0 || txtPassword.trim().length() < 8) {
            out.println("Password must be greater than 8 characters!");
            return;
        }

        // login process
        if (isValidLogin(txtUsername, txtPassword)) {
            // forward search.html
            RequestDispatcher rd = request.getRequestDispatcher("search.html");
            rd.forward(request, response);
        } else {

            // forward / redirect invalid.html
            // forward search.html
            // RequestDispatcher rd = request.getRequestDispatcher("invalid.html);
            // rd.forward(request, response);
            // redirect serach.html
            response.sendRedirect("invalid.html");

            // compare RequestDispatcher / response.sendRedirect ? khac biet? khi nao nen dung?
            /*
            1. RequestDispatcher
            RequestDispatcher là một phương pháp chuyển tiếp (forward) yêu cầu từ servlet này sang servlet hoặc JSP khác trong cùng một ứng dụng web mà không thay đổi URL trên trình duyệt.

            Đặc điểm của RequestDispatcher:
            Thực hiện chuyển tiếp (forward) yêu cầu nội bộ bên trong server.
            Không thay đổi URL trên trình duyệt.
            Dữ liệu trong request và response được giữ nguyên khi chuyển tiếp.
            Không yêu cầu trình duyệt thực hiện yêu cầu mới.
Cách sử dụng:
java
Sao chép
Chỉnh sửa
RequestDispatcher dispatcher = request.getRequestDispatcher("target.jsp");
dispatcher.forward(request, response);
Ưu điểm:
Nhanh hơn vì không cần tạo một yêu cầu HTTP mới.
Giữ nguyên dữ liệu trong request, giúp truyền dữ liệu dễ dàng giữa các trang.
Thích hợp cho các trang trong cùng một ứng dụng.
Nhược điểm:
Chỉ hoạt động trong cùng ứng dụng web.
Không thể chuyển hướng đến một URL bên ngoài.
Khi nào nên dùng RequestDispatcher?
Khi cần chuyển tiếp yêu cầu đến một servlet hoặc JSP khác trong cùng ứng dụng mà không thay đổi URL.
Khi cần truyền dữ liệu giữa các servlet/JSP.
📝 2. response.sendRedirect
response.sendRedirect là một phương pháp chuyển hướng (redirect) mà server yêu cầu trình duyệt thực hiện một yêu cầu HTTP mới đến một URL khác.

Đặc điểm của response.sendRedirect:
Thực hiện chuyển hướng (redirect) bên ngoài server.
Thay đổi URL trên trình duyệt.
Yêu cầu trình duyệt thực hiện một yêu cầu mới.
Có thể chuyển hướng đến một URL bên ngoài ứng dụng web.
Cách sử dụng:
java
Sao chép
Chỉnh sửa
response.sendRedirect("https://example.com");
Ưu điểm:
Có thể chuyển hướng đến các URL bên ngoài ứng dụng web.
Thay đổi URL trên trình duyệt, giúp phản ánh đúng tài nguyên hiện tại.
Nhược điểm:
Chậm hơn vì tạo một yêu cầu HTTP mới.
Không giữ nguyên dữ liệu trong request, do đó cần sử dụng session hoặc URL parameters để truyền dữ liệu.
Khi nào nên dùng response.sendRedirect?
Khi cần chuyển hướng đến một URL bên ngoài ứng dụng.
Khi cần thay đổi URL trên trình duyệt để phản ánh trạng thái mới.
Khi cần thực hiện các chuyển hướng dựa trên logic nghiệp vụ (ví dụ: chuyển hướng người dùng đến trang đăng nhập nếu chưa đăng nhập).
⚖️ So sánh nhanh:
Tiêu chí	RequestDispatcher	response.sendRedirect
Phương thức	forward (chuyển tiếp)	redirect (chuyển hướng)
URL trên trình duyệt	Không thay đổi	Thay đổi
Yêu cầu HTTP mới	Không	Có
Giữ nguyên request	Có	Không
Phạm vi	Chỉ trong cùng ứng dụng web	Có thể đến URL ngoài ứng dụng
Hiệu suất	Nhanh hơn	Chậm hơn (do yêu cầu mới)
Trường hợp sử dụng	Chuyển tiếp nội bộ giữa các servlet/JSP	Chuyển hướng đến trang khác (có thể là bên ngoài)
🛠 Khi nào nên sử dụng cái nào?
Tình huống	Nên sử dụng
Chuyển đến một trang khác trong cùng ứng dụng	RequestDispatcher
Chuyển hướng đến một URL ngoài ứng dụng	response.sendRedirect
Giữ nguyên dữ liệu trong request	RequestDispatcher
Thay đổi URL trên trình duyệt	response.sendRedirect
Chuyển hướng sau khi xử lý logic (POST-Redirect-GET)	response.sendRedirect
🚀 Ví dụ minh họa:
Ví dụ với RequestDispatcher:
java
Sao chép
Chỉnh sửa
// Servlet A
RequestDispatcher dispatcher = request.getRequestDispatcher("B.jsp");
dispatcher.forward(request, response);
Trình duyệt vẫn hiển thị URL của Servlet A.
Dữ liệu trong request được truyền đến B.jsp.
Ví dụ với response.sendRedirect:
java
Sao chép
Chỉnh sửa
// Servlet A
response.sendRedirect("B.jsp");
Trình duyệt hiển thị URL của B.jsp.
Trình duyệt gửi một yêu cầu HTTP mới đến B.jsp.
             */
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
