package main.user.model.service;

import static main.common.JDBCTemplate.close;
import static main.common.JDBCTemplate.getConnection;

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
    
    
}
