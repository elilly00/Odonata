package rooms.model.DAO;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import rooms.model.vo.Rooms;
import sooksoimg.model.vo.sooksoImg;

public class RoomsDAO {
    
    private Properties prop = null;
    
    public RoomsDAO() {
        prop = new Properties();
        
        String fileName = RoomsDAO.class.getResource("/sql/rooms/rooms-query.properties").getPath();
        
        try {
            prop.load(new FileReader(fileName));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public int insertRooms(Connection conn, Rooms r) {
        PreparedStatement pstmt = null;
        int result = 0;
        
        String query = prop.getProperty("insertRooms");
        
        try {
            
            pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, r.getRooms_Host());
            pstmt.setString(2, r.getRooms_Type());
            pstmt.setString(3, r.getRooms_Addr());
            pstmt.setString(4, r.getRooms_Price());
            pstmt.setString(5, r.getRooms_Personnel());
            pstmt.setString(6, r.getRooms_RoomCnt());
            pstmt.setString(7, r.getRooms_ToiletCnt());
            pstmt.setString(8, r.getRooms_DogAvail());
            pstmt.setString(9, r.getAmenity());
            pstmt.setString(10, r.getRooms_Desc());
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public int insertsooksoImg(Connection conn, ArrayList<sooksoImg> ImgList) {
        PreparedStatement pstmt = null;
        int result = 0;
        
        String query = prop.getProperty("insertsooksoImg");
        
        try {
            for (int e = 0; e < ImgList.size(); e++) {
                pstmt = conn.prepareStatement(query);
                
                pstmt.setString(1, ImgList.get(e).getOrigin_name());
                pstmt.setString(2, ImgList.get(e).getChange_name());
                pstmt.setString(3, ImgList.get(e).getImage_path());
                pstmt.setInt(4, ImgList.get(e).getImage_Level());
                
                result += pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public int getListCount(Connection conn) {
        Statement stmt = null;
        ResultSet rset = null;
        int listCount = 0;
        
        String query = prop.getProperty("getListCount");
        
        try {
            stmt = conn.createStatement();
            rset = stmt.executeQuery(query);
            if (rset.next()) {
                listCount = rset.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(stmt);
        }
        return listCount;
    }
    
    public ArrayList selectRList(Connection conn) {
        Statement stmt = null;
        ResultSet rset = null;
        ArrayList<Rooms> list = null;
        
        String query = prop.getProperty("selectRList");
        
        try {
            stmt = conn.createStatement();
            rset = stmt.executeQuery(query);
            
            list = new ArrayList<Rooms>();
            while (rset.next()) {
                list.add(new Rooms(rset.getInt("rooms_code"), rset.getString("rooms_host"),
                        rset.getString("rooms_type"), rset.getString("rooms_addr"), rset.getString("rooms_price"),
                        rset.getString("rooms_personnel"), rset.getString("rooms_roomcnt"),
                        rset.getString("rooms_toiletcnt"), rset.getString("rooms_dogavail"), rset.getString("amenity"),
                        rset.getString("rooms_desc"), rset.getDate("rooms_regdate"), rset.getString("status"),
                        rset.getInt("user_code")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(stmt);
        }
        return list;
    }
    
    public ArrayList selectFList(Connection conn) {
        Statement stmt = null;
        ResultSet rset = null;
        ArrayList<sooksoImg> list = null;
        
        String query = prop.getProperty("selectFList");
        // image_Level�� 0�� �� (�����)�� ������
        
        try {
            stmt = conn.createStatement();
            rset = stmt.executeQuery(query);
            
            list = new ArrayList<sooksoImg>();
            while (rset.next()) {
                sooksoImg s = new sooksoImg();
                s.setImage_number(rset.getInt("image_number"));
                s.setChange_name(rset.getString("chang_name"));
                
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(stmt);
        }
        
        return list;
    }
}
