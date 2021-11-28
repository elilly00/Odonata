package user.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;

import user.model.dao.UserDAO;
import user.model.vo.User;

public class UserService {
    
    private UserDAO uDAO = new UserDAO();
    
    public User loginUser(String userId, String userPwd) {
        Connection conn = getConnection();
        
        User loginUser = uDAO.loginUser(userId, userPwd, conn);
        
        close(conn);
        
        return loginUser;
    }
    
    public int insertUser(User u) {
        Connection conn = getConnection();
        
        int result = uDAO.insertUser(conn, u);
        
        if (result > 0)
            commit(conn);
        else
            rollback(conn);
        
        close(conn);
        
        return result;
    }
    
    public int checkId(String inputId) {
        Connection conn = getConnection();
        
        int result = uDAO.checkId(conn, inputId);
        
        close(conn);
        
        return result;
    }
    
    public int checkEmail(String inputEmail) {
        Connection conn = getConnection();
        
        int result = uDAO.checkEmail(conn, inputEmail);
        
        close(conn);
        
        return result;
    }
    
    public User selectUser(String userId) {
        Connection conn = getConnection();
        
        User user = uDAO.selectUser(conn, userId);
        
        close(conn);
        
        return user;
    }
    
    public User idfind(String name, String email) {
        Connection conn = getConnection();
        
        User user = uDAO.idfind(conn, name, email);
        
        close(conn);
        
        return user;
    }
    
    public User pwdfind(String id, String name, String email) {
        Connection conn = getConnection();
        
        User user = uDAO.pwdfind(conn, id, name, email);
        
        close(conn);
        
        return user;
    }
    
    public int updateUser(User u) {
        Connection conn = getConnection();
        
        int result = uDAO.updateUser(conn, u);
        
        if (result > 0)
            commit(conn);
        else
            rollback(conn);
        
        close(conn);
        
        return result;
    }
    
    public int updatePwd(HashMap<String, String> map) {
        Connection conn = getConnection();
        
        int result = uDAO.updatePwd(conn, map);
        
        if (result > 0)
            commit(conn);
        else
            rollback(conn);
        
        close(conn);
        
        return result;
    }
    
    public int deleteUser(String userId) {
        Connection conn = getConnection();
        
        int result = uDAO.deleteUser(conn, userId);
        
        if (result > 0)
            commit(conn);
        else
            rollback(conn);
        
        close(conn);
        
        return result;
    }
}
