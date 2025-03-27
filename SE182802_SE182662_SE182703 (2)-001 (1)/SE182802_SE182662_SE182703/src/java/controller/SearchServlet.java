package controller;
import dao.gameDAO;
import dto.gameDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "search", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("search");
        List<gameDTO> games = new ArrayList<>();

        if (keyword != null && !keyword.trim().isEmpty()) {
            gameDAO dao = new gameDAO();
            try {
                games = dao.getListGameSearch(keyword, 0, 20);
                System.out.println("Số game tìm được: " + games.size());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("games", games);
        request.getRequestDispatcher("view/search.jsp").forward(request, response);
    }
}
