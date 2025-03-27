package dao;

import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import tools.MD5;
import tools.Mail;
import tools.helper;
import utils.DBUtils;

public class UserDAO {

    public boolean insertUser(UserDTO user) throws Exception {
    String query = "INSERT INTO [user] (username, password, email, fullname, sex, birthday, "
            + "address, randomkey, active, id_group) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    Connection connection = null;
    PreparedStatement ps = null;

    try {
        connection = DBUtils.getConnection();
        ps = connection.prepareStatement(query);

        String randomKey = helper.randomKey(20); // Tạo mã kích hoạt duy nhất

        ps.setString(1, user.getUserName());
        ps.setString(2, MD5.encryption(user.getPassword()));  // Mã hóa mật khẩu
        ps.setString(3, user.getEmail());
        ps.setString(4, user.getFullName());
        ps.setString(5, user.getSex());
        ps.setString(6, user.getBirthday());
        ps.setString(7, user.getAddress());
        ps.setString(8, randomKey);
        ps.setInt(9, 0);  // Tài khoản chưa kích hoạt
        ps.setInt(10, 3);

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            // ✅ Gọi đúng phương thức gửi email
            Mail.sendEmail(user);  
            System.out.println("📧 Đã gửi email kích hoạt đến: " + user.getEmail());

            return true;
        }

    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        DBUtils.closeConnection(connection);
    }
    return false;
}


    public boolean checkUsername(String username) {
        String query = "SELECT COUNT(*) FROM [user] WHERE username = ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0; // Nếu COUNT > 0, username đã tồn tại
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtils.closeConnection(connection);
        }
        return false;
    }
    

    public UserDTO login(String username, String password) {
        String query = "SELECT * FROM [user] WHERE username = ? AND password = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, MD5.encryption(password));  // Mã hóa mật khẩu nhập vào trước khi kiểm tra

            rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO user = new UserDTO();
                user.setUserID(rs.getInt("id"));
                user.setUserName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fullname"));
                user.setSex(rs.getString("sex"));
                user.setBirthday(rs.getDate("birthday").toString());
                user.setAddress(rs.getString("address"));

                return user;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBUtils.closeConnection(conn);
        }
        return null;
    }
}
