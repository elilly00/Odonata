package reserv.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import reserv.model.vo.Reserv;

public class ReservDAO {
    
    private Properties prop = null;
    
    public ReservDAO() {
        prop = new Properties();
        String fileName = ReservDAO.class.getResource("/sql/reserv/reserv-query.properties").getPath();
        
        try {
            prop.load(new FileReader(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public int insertReserv(Connection conn, Reserv reserv) {
        PreparedStatement pstmt = null;
        int result = 0;
        
        String query = prop.getProperty("insertReserv");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, reserv.getCheck_in());
            pstmt.setDate(2, reserv.getCheck_out());
            pstmt.setString(3, reserv.getPersonnel());
            pstmt.setInt(4, reserv.getRooms_code());
            pstmt.setInt(5, reserv.getUser_code());
            pstmt.setInt(6, reserv.getReserv_Price());
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public ArrayList<Reserv> selectResrvY(Connection conn, int userCode) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<Reserv> list = null;
        
        String query = prop.getProperty("selectResrvY");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userCode);
            
            rset = pstmt.executeQuery();
            
            list = new ArrayList<Reserv>();
            while (rset.next())
                list.add(new Reserv(rset.getInt("V_CODE"), rset.getString("STATUS"), rset.getDate("CHECK_IN"),
                        rset.getDate("CHECK_OUT"), rset.getString("PERSONNEL"), rset.getInt("ROOMS_CODE"),
                        rset.getString("ROOMS_HOST"), rset.getInt("USER_CODE"), rset.getInt("RESERV_PRICE")));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
    }
    
    public ArrayList<Reserv> selectResrvAll(Connection conn, int userCode) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<Reserv> list = null;
        
        String query = prop.getProperty("selectResrvAll");
        
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userCode);
            
            rset = pstmt.executeQuery();
            
            list = new ArrayList<Reserv>();
            while (rset.next())
                list.add(new Reserv(rset.getInt("V_CODE"), rset.getString("STATUS"), rset.getDate("CHECK_IN"),
                        rset.getDate("CHECK_OUT"), rset.getString("PERSONNEL"), rset.getInt("ROOMS_CODE"),
                        rset.getString("ROOMS_HOST"), rset.getInt("USER_CODE"), rset.getInt("RESERV_PRICE")));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
    }
    
}
