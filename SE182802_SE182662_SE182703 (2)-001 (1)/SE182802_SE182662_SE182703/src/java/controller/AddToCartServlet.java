package controller;
import dao.gameDAO;
import dto.gameDTO;
import dao.CartDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // Lấy ID người dùng từ session
        String action = request.getParameter("action");
        int gameId;

        // Kiểm tra người dùng đã đăng nhập chưa
        if (userId == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("User not logged in");
            return;
        }

        // Kiểm tra ID game hợp lệ
        try {
            gameId = Integer.parseInt(request.getParameter("gameId"));
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid game ID");
            return;
        }

        gameDAO gameDAO = new gameDAO();
        CartDAO cartDAO = new CartDAO();

        try {
            gameDTO game = gameDAO.getGame(gameId);
            if (game == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("Game not found");
                return;
            }

            if ("add".equals(action)) {
                boolean exists = cartDAO.isGameInCart(userId, gameId);
                if (!exists) {
                    cartDAO.addToCart(userId, gameId);
                    response.getWriter().write("Added successfully");
                } else {
                    response.getWriter().write("Game already in cart");
                }
            } else if ("remove".equals(action)) {
                cartDAO.removeFromCart(userId, gameId);
                response.getWriter().write("Removed successfully");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Database error");
            ex.printStackTrace();
        }
    }
}
