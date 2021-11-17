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
}
