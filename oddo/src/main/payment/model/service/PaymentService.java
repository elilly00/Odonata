package main.payment.model.service;

import static main.common.JDBCTemplate.close;
import static main.common.JDBCTemplate.commit;
import static main.common.JDBCTemplate.getConnection;
import static main.common.JDBCTemplate.rollback;

import java.sql.Connection;

import main.payment.model.dao.PaymentDAO;
import main.payment.model.vo.Payment;

public class PaymentService {
    
    private PaymentDAO pDAO = new PaymentDAO();
    
    public int insertPayment(Payment payment) {
        Connection conn = getConnection();
        
        int result = pDAO.insertPayment(conn, payment);
        
        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
    
}
