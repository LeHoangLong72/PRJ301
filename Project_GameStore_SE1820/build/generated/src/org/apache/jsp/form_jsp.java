package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class form_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Login Form - Game Store</title>\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                background: url('images/pixel-art-fantasy-art-mini-shrine-wallpaper.jpg');\n");
      out.write("                background-size: 100%;\n");
      out.write("                font-family: 'Press Start 2P', cursive;\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-items: center;\n");
      out.write("                height: 100vh;\n");
      out.write("                margin: 0;\n");
      out.write("            }\n");
      out.write("            .login-container{\n");
      out.write("                background: rgba(0, 0, 0, 0.8);\n");
      out.write("                padding: 20px;\n");
      out.write("                border-radius: 8px;\n");
      out.write("                box-shadow: 4px 4px 0px #ffffff;\n");
      out.write("                text-align: left;\n");
      out.write("                max-width: 400px;\n");
      out.write("                width: 100%;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            .form-group{\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("            .form-group label{\n");
      out.write("                display: block;\n");
      out.write("                margin-bottom: 10px;   \n");
      out.write("            }\n");
      out.write("            .form-group input{\n");
      out.write("                width: 90%;\n");
      out.write("                padding: 10px;\n");
      out.write("                border: 2px solid #fff;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                font-size: 16px;\n");
      out.write("                text-align: center;\n");
      out.write("                background: black;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            .submit-btn{\n");
      out.write("                background-color: #ffcc00;\n");
      out.write("                color: black;\n");
      out.write("                padding: 10px;\n");
      out.write("                border: 2px solid white;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                font-size: 16px;\n");
      out.write("                width: 100%;\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("            .submit-btn:hover{\n");
      out.write("                background-color: #ffaa00;\n");
      out.write("                box-shadow: 3px 3px 0px #fff;\n");
      out.write("            }\n");
      out.write("            .login-container a{\n");
      out.write("                font-size: 12px;\n");
      out.write("                text-decoration: none;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            .login-container span{\n");
      out.write("                font-size: 12px;\n");
      out.write("                margin-top: 10px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"login-container\">\n");
      out.write("            <h2>Login</h2>\n");
      out.write("            <form action=\"MainController\" method=\"post\">\n");
      out.write("                <input type=\"hidden\" name=\"action\" value=\"login\"/>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label>UserID</label>\n");
      out.write("                    <input type=\"text\" name=\"txtUserID\" required placeholder=\"Enter userID\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label>Password</label>\n");
      out.write("                    <input type=\"password\" name=\"txtPassword\" required placeholder=\"Enter password\">\n");
      out.write("                </div>\n");
      out.write("                <input type=\"submit\" value=\"Login\" class=\"submit-btn\"/>\n");
      out.write("                <a href=\"forgotPassword.jsp\">Forgot password</a><br/>\n");
      out.write("                \n");
      out.write("                <span>Don't have an account? <a href='register.jsp'>Register</a></span>\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
