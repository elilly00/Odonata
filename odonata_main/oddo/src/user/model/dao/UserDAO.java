package user.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import user.model.vo.User;

public class UserDAO {
    
    private Properties prop = null;
    
    public UserDAO() {
        prop = new Properties();
        
        String fileName = UserDAO.class.getResource("/sql/user/user-query.properties").getPath();
        
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
        
        String query = prop.getProperty("loginUser");
        // String query = prop.getProperty("login");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPwd);
            
            rset = pstmt.executeQuery();
            
            if (rset.next()) {
                loginUser = new User(rset.getInt("USER_CODE"), rset.getString("USER_NAME"), rset.getString("USER_PWD"),
                        rset.getString("USER_EMAIL"), rset.getString("USER_PHONE"), rset.getDate("USER_BIRTH"),
                        rset.getString("USER_ID"), rset.getString("USER_TYPE"), rset.getString("STATUS").charAt(0));
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
    
    public User selectUser(Connection conn, String userId) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        User user = null;
        
        String query = prop.getProperty("selectUser");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
            
            rset = pstmt.executeQuery();
            
            if (rset.next())
                user = new User(rset.getInt("USER_CODE"), rset.getString("USER_NAME"), rset.getString("USER_PWD"),
                        rset.getString("USER_EMAIL"), rset.getString("USER_PHONE"), rset.getDate("USER_BIRTH"),
                        rset.getString("USER_ID"), rset.getString("USER_TYPE"), rset.getString("STATUS").charAt(0));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return user;
    }
    
    public User idfind(Connection conn, String name, String email) {
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;
        
        ResultSet rset = null;
        ResultSet rset2 = null;
        User user = null;
        
        String sql = prop.getProperty("idfind");
        
        String sql2 = prop.getProperty("idfind");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            rset = pstmt.executeQuery();
            
            pstmt2 = conn.prepareStatement(sql2);
            pstmt2.setString(1, name);
            pstmt2.setString(2, email);
            rset2 = pstmt2.executeQuery();
            
            if (rset.next())
                user = new User(rset.getInt("USER_CODE"), rset.getString("USER_NAME"), rset.getString("USER_PWD"),
                        rset.getString("USER_EMAIL"), rset.getString("USER_PHONE"), rset.getDate("USER_BIRTH"),
                        rset.getString("USER_ID"), rset.getString("USER_TYPE"), rset.getString("STATUS").charAt(0));
            
            if (rset2.next())
                user = new User(rset.getInt("USER_CODE"), rset.getString("USER_NAME"), rset.getString("USER_PWD"),
                        rset.getString("USER_EMAIL"), rset.getString("USER_PHONE"), rset.getDate("USER_BIRTH"),
                        rset.getString("USER_ID"), rset.getString("USER_TYPE"), rset.getString("STATUS").charAt(0));
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return user;
    }
    
    public User pwdfind(Connection conn, String id, String name, String email) {
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;
        
        ResultSet rset = null;
        ResultSet rset2 = null;
        User user = null;
        
        String sql = prop.getProperty("pwdfind");
        
        String sql2 = prop.getProperty("pwdfind");
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, email);
            pstmt.setString(3, name);
            rset = pstmt.executeQuery();
            
            pstmt2 = conn.prepareStatement(sql2);
            pstmt2.setString(1, id);
            pstmt2.setString(2, email);
            pstmt2.setString(3, name);
            rset2 = pstmt2.executeQuery();
            
            if (rset.next())
                user = new User(rset.getInt("USER_CODE"), rset.getString("USER_NAME"), rset.getString("USER_PWD"),
                        rset.getString("USER_EMAIL"), rset.getString("USER_PHONE"), rset.getDate("USER_BIRTH"),
                        rset.getString("USER_ID"), rset.getString("USER_TYPE"), rset.getString("STATUS").charAt(0));
            
            if (rset2.next())
                user = new User(rset.getInt("USER_CODE"), rset.getString("USER_NAME"), rset.getString("USER_PWD"),
                        rset.getString("USER_EMAIL"), rset.getString("USER_PHONE"), rset.getDate("USER_BIRTH"),
                        rset.getString("USER_ID"), rset.getString("USER_TYPE"), rset.getString("STATUS").charAt(0));
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return user;
    }
    
    public int updateUser(Connection conn, User u) {
        PreparedStatement pstmt = null;
        int result = 0;
        
        String query = prop.getProperty("updateUser");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, u.getUser_name());
            pstmt.setString(2, u.getUser_email());
            pstmt.setString(3, u.getUser_phone());
            pstmt.setDate(4, u.getUser_birth());
            pstmt.setString(5, u.getUser_id());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public int updatePwd(Connection conn, HashMap<String, String> map) {
        PreparedStatement pstmt = null;
        int result = 0;
        
        String query = prop.getProperty("updatePwd");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, map.get("newPwd"));
            pstmt.setString(2, map.get("userId"));
            pstmt.setString(3, map.get("userPwd"));
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public int deleteUser(Connection conn, String userId) {
        PreparedStatement pstmt = null;
        int result = 0;
        
        String query = prop.getProperty("deleteUser");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
}
