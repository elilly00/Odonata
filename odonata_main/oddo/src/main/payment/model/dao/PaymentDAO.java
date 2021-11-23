package main.payment.model.dao;

import static main.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import main.payment.model.vo.Payment;

public class PaymentDAO {
    
    private Properties prop = null;
    
    public PaymentDAO() {
        prop = new Properties();
        
        String fileName = PaymentDAO.class.getResource("/sql/payment-query.properties").getPath();
        
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
            pstmt.setInt(1, payment.getPaymentCode());
            pstmt.setString(2, payment.getpName());
            pstmt.setInt(3, payment.getpTel());
            pstmt.setString(4, payment.getpEmail());
            pstmt.setString(5, payment.getrName());
            pstmt.setDate(6, payment.getCheckIn());
            pstmt.setDate(7, payment.getCheckOut());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
}
