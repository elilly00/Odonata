package main.user.model.service;

import static main.common.JDBCTemplate.close;
import static main.common.JDBCTemplate.commit;
import static main.common.JDBCTemplate.getConnection;
import static main.common.JDBCTemplate.rollback;

import java.sql.Connection;

import main.user.model.dao.UserDAO;
import main.user.model.vo.User;

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
    
    public User idfind(String id, String name, String email) {
        Connection conn = getConnection();
        
        User user = uDAO.pwdfind(conn, id, name, email);
        
        close(conn);
        
        return user;
    }
}
