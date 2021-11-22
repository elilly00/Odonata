package main.msg.model.dao;

import static main.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import main.msg.model.vo.Message;
import main.msg.model.vo.PageInfo;

public class MessageDAO {
    
    private Properties prop = null;
    
    public MessageDAO() {
        prop = new Properties();
        
        String fileName = MessageDAO.class.getResource("/sql/msg/msg-query.properties").getPath();
        
        try {
            prop.load(new FileReader(fileName));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public int getListCount(Connection conn, String userId) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        int listCount = 0;
        
        String query = prop.getProperty("getListCount");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
            
            rset = pstmt.executeQuery();
            
            if (rset.next())
                listCount = rset.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return listCount;
    }
    
    public ArrayList<Message> selectList(Connection conn, String userId, PageInfo pi) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<Message> list = null;
        
        String query = prop.getProperty("selectList");
        
        int startRow = (pi.getCurrentPage() - 1) * pi.getMessageLimit() + 1;
        int endRow = startRow + pi.getMessageLimit() - 1;
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);
            
            rset = pstmt.executeQuery();
            
            list = new ArrayList<Message>();
            while (rset.next())
                list.add(new Message(rset.getInt("MESSAGE_CODE"), rset.getString("MESSAGE_TITLE"),
                        rset.getDate("SENDTIME"), rset.getDate("READTIME"), rset.getString("MSGTEXT"),
                        rset.getString("SEND_ID"), rset.getString("RECEIVE_ID"), rset.getString("STATUS").charAt(0)));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
    }
    
    public Message selectMessage(Connection conn, int mId) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        Message m = null;
        
        String query = prop.getProperty("selectMessage");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, mId);
            
            rset = pstmt.executeQuery();
            if (rset.next())
                m = new Message(rset.getInt("MESSAGE_CODE"), rset.getString("MESSAGE_TITLE"), rset.getDate("SENDTIME"),
                        rset.getDate("READTIME"), rset.getString("MSGTEXT"), rset.getString("SEND_ID"),
                        rset.getString("RECEIVE_ID"), rset.getString("STATUS").charAt(0));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return m;
    }
}
