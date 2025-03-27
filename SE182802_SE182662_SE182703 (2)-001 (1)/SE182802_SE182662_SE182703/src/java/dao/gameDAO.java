/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CategoryDTO;
import dto.gameDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class gameDAO {

    private List<Integer> listGameHot = new ArrayList<>();
    private List<Integer> listGameChoiNhieuNhat = new ArrayList<>();
    private List<Integer> listGameYeuThichNhat = new ArrayList<>();
    private List<Integer> listGameHotByCategory = new ArrayList<>();
    private List<Integer> listGameChoiNhieuNhatByIDGame = new ArrayList<>();

    private String arrayID(List<Integer> array) {
        String str = "";
        if (array.size() != 0) {
            for (Integer integer : array) {
                str += integer.toString() + ",";
            }
            str = str.substring(0, str.length() - 1);
        }
        return str;
    }

    public List<gameDTO> getListGameHot() throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT TOP 11 * FROM game WHERE hot = 1 AND kiemduyet = 1 ORDER BY luotchoi DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
            listGameHot.add(game.getGameID());
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public List<gameDTO> getListGameChoiNhieuNhat() throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT TOP 5 * FROM game "
                + "WHERE kiemduyet = 1"
                + "AND id_game NOT IN (" + arrayID(listGameHot) + ")"
                + "ORDER BY luotchoi DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
            listGameChoiNhieuNhat.add(game.getGameID());
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public List<gameDTO> getListGameYeuThichNhat() throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String arrayID = arrayID(listGameHot) + "," + arrayID(listGameChoiNhieuNhat);
        System.out.println(arrayID);
        String query = "SELECT TOP 3 * FROM game "
                + "WHERE kiemduyet = 1 and id_game NOT IN ("
                + "    SELECT TOP 20 id_game FROM game WHERE hot = 1 AND kiemduyet = 1 ORDER BY luotchoi DESC"
                + ") "
                + "AND id_game NOT IN (" + arrayID + ") "
                + "ORDER BY luotyeuthich DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
            listGameYeuThichNhat.add(game.getGameID());
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public int countGameByCategory(int id_theloai) throws SQLException, ClassNotFoundException {
        int soluong = 0;
        Connection connection = DBUtils.getConnection();
        String query = "SELECT COUNT(id_game) AS soluong FROM game WHERE id_theloai = '" + id_theloai + "'";
        PreparedStatement ps = connection.prepareCall(query);
        ResultSet result = ps.executeQuery();
        if (result.next()) {
            soluong = Integer.parseInt(result.getString("soluong"));
        }
        DBUtils.closeConnection(connection);
        return soluong;
    }

    public List<gameDTO> getListGameCategoryAndPage(int id_theloai, int currentPage, int itemPerPage) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        int position = (currentPage - 1) * itemPerPage;
        String query = "SELECT * FROM game "
                + "WHERE kiemduyet = 1 "
                + "AND id_theloai = '" + id_theloai + "' "
                + "ORDER BY luotyeuthich DESC OFFSET " + position + " ROWS FETCH NEXT " + itemPerPage + " ROWS ONLY";

        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public ArrayList<gameDTO> getListGameDetail(int id_theloai) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String arrayID = arrayID(listGameHot) + "," + arrayID(listGameChoiNhieuNhat) + "," + arrayID(listGameYeuThichNhat);

        String query = "SELECT TOP 8 * FROM game "
                + "WHERE kiemduyet = 1 AND id_game NOT IN (" + arrayID + ") "
                + "AND id_theloai = ? "
                + "ORDER BY luotchoi DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, id_theloai);
        ResultSet result = ps.executeQuery();

        ArrayList<gameDTO> list = new ArrayList<>();
        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public List<gameDTO> getListGameHotByCategoty(int id_theloai) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT TOP 5 * FROM game "
                + "WHERE hot = 1 AND kiemduyet = 1 AND id_theloai = ? "
                + "ORDER BY luotchoi DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, id_theloai);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();
        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
            listGameHotByCategory.add(game.getGameID());

        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public List<gameDTO> getListGameYeuThichNhatByCategory(int id_theloai) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT TOP 3 * FROM game "
                + "WHERE kiemduyet = 1 and id_game NOT IN ("
                + "    SELECT TOP 20 id_game FROM game WHERE hot = 1 AND kiemduyet = 1 ORDER BY luotyeuthich DESC"
                + ") "
                + "AND id_game NOT IN (" + arrayID(listGameHotByCategory) + ") AND id_theloai = ? "
                + "ORDER BY luotyeuthich DESC";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, id_theloai);
        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            list.add(game);
            listGameYeuThichNhat.add(game.getGameID());
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public gameDTO getGame(int id_game) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtils.getConnection();
        String query = "SELECT * FROM game where id_game = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, id_game);
        ResultSet result = ps.executeQuery();
        if (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            game.setGameHot(result.getByte("hot") != 0);
            DBUtils.closeConnection(conn);
            listGameHotByCategory.add(game.getGameID());
            return game;
        }
        DBUtils.closeConnection(conn);
        return null;
    }

    public ArrayList<gameDTO> getListGameChoiNhieuNhatByIDGame(int id_game) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        listGameChoiNhieuNhatByIDGame.clear(); // <--- dòng này rất quan trọng!

        String query = "SELECT * FROM game AS g1 "
                + "WHERE g1.id_theloai = (SELECT g2.id_theloai FROM game AS g2 WHERE g2.id_game = ?) "
                + "AND g1.id_game != ? "
                + "ORDER BY g1.luotchoi DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, id_game);
        ps.setInt(2, id_game);

        ResultSet result = ps.executeQuery();
        ArrayList<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            boolean gameHot = result.getByte("hot") != 0;
            game.setGameHot(gameHot);
            list.add(game);
            listGameChoiNhieuNhatByIDGame.add(game.getGameID());
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public ArrayList<gameDTO> getListGameYeuThichNhatByIDGame(int id_game) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String notInList = arrayID(listGameChoiNhieuNhatByIDGame);
        String query = "SELECT * FROM game AS g1 "
                + "WHERE g1.id_theloai = (SELECT g2.id_theloai FROM game AS g2 WHERE g2.id_game = ?) "
                + "AND g1.id_game != ? "
                + "AND g1.id_game NOT IN (" + notInList + ") "
                + "ORDER BY g1.luotyeuthich DESC";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, id_game);
        ps.setInt(2, id_game);

        ResultSet result = ps.executeQuery();
        ArrayList<gameDTO> list = new ArrayList<>();

        boolean hasResult = false;
        while (result.next()) {
            hasResult = true;
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptingame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            boolean gameHot = result.getByte("hot") != 0;
            game.setGameHot(gameHot);
            list.add(game);
        }

        DBUtils.closeConnection(connection);
        return list;
    }

    public List<gameDTO> getListGameSearch(String keyword, int position, int item) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();

        String query = "SELECT * FROM game "
                + "WHERE LOWER(tengame) LIKE LOWER(?) "
                + "ORDER BY id_game "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, "%" + keyword + "%");
        ps.setInt(2, position);
        ps.setInt(3, item);

        ResultSet result = ps.executeQuery();
        List<gameDTO> list = new ArrayList<>();

        while (result.next()) {
            gameDTO game = new gameDTO();
            game.setGameID(result.getInt("id_game"));
            game.setGameName(result.getString("tengame"));
            game.setGameImage(result.getString("hinhgame"));
            game.setGameFile(result.getString("taptinGame"));
            game.setGameContent(result.getString("noidunggame"));
            game.setGameLuotChoi(result.getLong("luotchoi"));
            game.setGameLuotYeuThich(result.getLong("luotyeuthich"));
            boolean gameHot = (result.getByte("hot") != 0);
            game.setGameHot(gameHot);
            list.add(game);
        }

        DBUtils.closeConnection(connection);
        return list;
    }


    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        gameDAO ga = new gameDAO();

//        System.out.println("===== Danh sách game hot =====");
//        for (gameDTO g : ga.getListGameHot()) {
//            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotChoi());
//        }
//
//        System.out.println("\n===== Danh sách game có lượt chơi cao nhất (không trùng game hot) =====");
//        for (gameDTO g : ga.getListGameChoiNhieuNhat()) {
//            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotChoi());
//        }
//
//        System.out.println("\n===== Danh sách game được yêu thích nhất (không trùng game hot và lượt chơi cao nhất) =====");
//        for (gameDTO g : ga.getListGameYeuThichNhat()) {
//            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotYeuThich());
//        for (gameDTO g : ga.getListGameHotByCategoty(1)) {
//            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotChoi());
//        }
//        System.out.println("\n===== ");
//        for (gameDTO g : ga.getListGameYeuThichNhatByCategory(1)) {
//            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotChoi());
//        }
//        System.out.println("\n===== ");
//        for (gameDTO g : ga.getListGameCategoryAndPage(1, 1, 16)) {
//            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotChoi());
//        }
        System.out.println("\n===== ");
        for (gameDTO g : ga.getListGameChoiNhieuNhatByIDGame(4)) {
            System.out.println(g.getGameID() + "__" + g.getGameName() + "__" + g.getGameLuotChoi());
        }
        System.out.println("\n===== ");
        System.out.println(">> ListGameYeuThichNhatByIDGame:");
        for (gameDTO g : ga.getListGameYeuThichNhatByIDGame(2)) {
            System.out.println(g.getGameID());
        }
        System.out.println(">> End of List");

    }

}
