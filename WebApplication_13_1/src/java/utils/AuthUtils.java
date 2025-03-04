package utils;

import dao.UserDAO;
import dto.UserDTO;
import javax.servlet.http.HttpSession;

public class AuthUtils {
    public static final String ADMIN_ROLE = "AD";
    public static final String USER_ROLE = "US";
    
    public static UserDTO getUser(String strUserID){
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readById(strUserID);
        return user;
    }
    
    public static boolean isValidLogin(String strUserID, String strPassword){
        UserDTO user = getUser(strUserID);
        System.out.println(user);
        System.out.println(strPassword);
        return user != null && user.getPassword().equals(strPassword);
    }
    
    public static UserDTO getUser(HttpSession session){
        Object obj = session.getAttribute("user");
        return (obj!=null)?(UserDTO)obj:null;
    }
    
    public static boolean isLoggedIn(HttpSession session){
        return session.getAttribute("user") != null;
    }
    
    public static boolean isAdmin(HttpSession session){
        if (!isLoggedIn(session)) {
            return false;
        }
        UserDTO user = (UserDTO) session.getAttribute("user");
        return user.getRoleID().equals(ADMIN_ROLE);
    }
}
