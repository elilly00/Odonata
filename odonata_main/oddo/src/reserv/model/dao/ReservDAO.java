package reserv.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

}
