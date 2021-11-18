package main.user.model.dao;

import static main.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import main.user.model.vo.User;

public class UserDAO {

  private Properties prop = null;

  public UserDAO() {
    prop = new Properties();

    String fileName =
      UserDAO.class.getResource("/sql/user/user-query.properties").getPath();

    try {
      prop.load(new FileReader(fileName));
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public User loginUser(String userId, String userPwd, Connection conn) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    User loginUser = null;

    String query = prop.getProperty("login");

    try {
      pstmt = conn.prepareStatement(query);
      pstmt.setString(1, userId);
      pstmt.setString(2, userPwd);

      rset = pstmt.executeQuery();

      if (rset.next()) {
        loginUser =
          new User(
            rset.getInt("User_code"),
            rset.getString("User_pwd"),
            rset.getString("User_name"),
            rset.getString("User_email"),
            rset.getString("User_phone"),
            rset.getString("User_birth"),
            rset.getString("User_id"),
            rset.getString("User_type"),
            rset.getString("Status")
          );
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }

    return loginUser;
  }
    
    public int insertUser(Connection conn, User u) {
        PreparedStatement pstmt = null;
        int result = 0;
        
        String query = prop.getProperty("insertUser");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, u.getUser_name());
            pstmt.setString(2, u.getUser_pwd());
            pstmt.setString(3, u.getUser_email());
            pstmt.setString(4, u.getUser_phone());
            pstmt.setDate(5, u.getUser_birth());
            pstmt.setString(6, u.getUser_id());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public int checkId(Connection conn, String inputId) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        int result = 0;
        
        String query = prop.getProperty("checkId");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, inputId);
            
            rset = pstmt.executeQuery();
            
            if (rset.next())
                result = rset.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return result;
    }
    
    public int checkEmail(Connection conn, String inputEmail) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        int result = 0;
        
        String query = prop.getProperty("checkEmail");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, inputEmail);
            
            rset = pstmt.executeQuery();
            
            if (rset.next())
                result = rset.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return result;
    }
}
