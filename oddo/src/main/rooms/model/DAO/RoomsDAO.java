package main.rooms.model.dao;

import static main.common.JDBCTemplate.*;

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

import main.rooms.model.vo.PageInfo;
import main.rooms.model.vo.ResultPage;
import main.rooms.model.vo.Rooms;
import main.sooksoimg.model.vo.sooksoImg;

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

    public int insertRooms(Connection conn, Rooms room) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRooms");
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, room.getRooms_Type());
			pstmt.setString(2, room.getRooms_Addr());
			pstmt.setString(3, room.getRooms_Price());
			pstmt.setString(4, room.getRooms_Personnel());
			pstmt.setString(5, room.getRooms_RoomCnt());
			pstmt.setString(6, room.getRooms_ToiletCnt());
			pstmt.setString(7, room.getRooms_DogAvail());
			pstmt.setString(8, room.getAmenity());
			pstmt.setString(9, room.getRooms_Desc());
			
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
			for(int i = 0; i  < ImgList.size(); i++) {	
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, ImgList.get(i).getOrigin_name());
				pstmt.setString(2, ImgList.get(i).getChange_name());
				pstmt.setString(3, ImgList.get(i).getImage_path());
				pstmt.setInt(4, ImgList.get(i).getImage_Level());
				
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
			if(rset.next()) {
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

		public ArrayList<ResultPage> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ResultPage> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
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
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

    