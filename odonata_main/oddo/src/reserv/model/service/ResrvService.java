package reserv.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import reserv.model.dao.ReservDAO;
import reserv.model.vo.Reserv;

public class ResrvService {
    
    private ReservDAO rvDAO = new ReservDAO();
    
    public int insertReserv(Reserv reserv) {
        Connection conn = getConnection();
        
        int result = rvDAO.insertReserv(conn, reserv);
        
        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result;
    }
    
    public ArrayList<Reserv> selectResrvY(int userCode) {
        Connection conn = getConnection();
        
        ArrayList<Reserv> yList = rvDAO.selectResrvY(conn, userCode);
        
        close(conn);
        
        return yList;
    }
    
    public ArrayList<Reserv> selectResrvAll(int userCode) {
        Connection conn = getConnection();
        
        ArrayList<Reserv> List = rvDAO.selectResrvAll(conn, userCode);
        
        close(conn);
        
        return List;
    }
    
}
