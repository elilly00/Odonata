package reserv.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import reserv.model.dao.ReservDAO;
import reserv.model.vo.Reserv;

public class ResrvService {

	private ReservDAO rvDAO = new ReservDAO();
	
	public int insertReserv(Reserv reserv) {
		Connection conn = getConnection();
		
		int result = rvDAO.insertReserv(conn, reserv);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
