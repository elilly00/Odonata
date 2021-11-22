package payment.model.service;

import static main.common.JDBCTemplate.*;

import java.sql.Connection;

import payment.model.dao.PaymentDAO;
import payment.model.vo.Payment;

public class PaymentService {

	private PaymentDAO pDAO = new PaymentDAO();
	
	
	public int insertPayment(Payment payment) {
		Connection conn = getConnection();
		
		int result = pDAO.insertPayment(conn, payment);
		
		if( result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
