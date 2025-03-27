/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author as
 */
@WebServlet(name = "CheckUsernameServlet", urlPatterns = {"/CheckUsernameServlet"})
public class CheckUsernameServlet extends HttpServlet {

    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");

            // Kiểm tra pattern
            String usernamePattern = "^[A-Za-z0-9](?:[A-Za-z0-9_]{0,18}[A-Za-z0-9])?$";
            if (!username.matches(usernamePattern)) {
                response.getWriter().print("<img src=\"" + request.getContextPath() + "/template/images/delete.png\" >");
                return;
            }

            // Kiểm tra username trong database
            if (userDAO.checkUsername(username)) {
                response.getWriter().print("<img src=\"" + request.getContextPath() + "/template/images/delete.png\" >"
                        + "<input type=\"hidden\" name=\"user-result\" value=\"false\">");
            } else {
                response.getWriter().print("<img src=\"" + request.getContextPath() + "/template/images/check.png\" >"
                        + "<input type=\"hidden\" name=\"user-result\" value=\"true\">");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("<img src=\"" + request.getContextPath() + "/template/images/delete.png\" > ");
        }
    }

}
