package payment.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import payment.model.vo.Payment;

public class PaymentDAO {

	private Properties prop = null;
	
	public PaymentDAO() {
		prop = new Properties();
		
		String fileName = PaymentDAO.class.getResource("/sql/payment/payment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertPayment(Connection conn, Payment payment) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, payment.getReservCode()); 
			pstmt.setDate(2, payment.getCheckIn());
			pstmt.setDate(3, payment.getCheckOut());
			pstmt.setInt(4, payment.getPrice());
			pstmt.setString(5, payment.getPersonnel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}

