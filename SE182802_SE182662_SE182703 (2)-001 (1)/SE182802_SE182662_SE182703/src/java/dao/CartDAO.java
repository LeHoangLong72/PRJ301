package dao;

import dto.gameDTO;
import utils.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    public List<gameDTO> getCartByUser(int userId) throws SQLException, ClassNotFoundException {
        List<gameDTO> cart = new ArrayList<>();
        String query = "SELECT g.id_game, g.name FROM cart c " +
                       "JOIN game g ON c.game_id = g.id_game " +
                       "WHERE c.user_id = ?";

        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cart.add(new gameDTO(
                    rs.getInt("id_game"),
                    rs.getString("name") // Dùng constructor mới với 2 tham số
                ));
            }
        }
        return cart;
    }
    
    public boolean isGameInCart(int userId, int gameId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM cart WHERE id_user = ? AND id_game = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, gameId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

    // Thêm game vào giỏ hàng
    public void addToCart(int userId, int gameId) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO cart (id_user, id_game, quantity) VALUES (?, ?, 1)";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, gameId);
            ps.executeUpdate();
        }
    }

    // Xóa game khỏi giỏ hàng
    public void removeFromCart(int userId, int gameId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM cart WHERE id_user = ? AND id_game = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, gameId);
            ps.executeUpdate();
        }
    }
}
