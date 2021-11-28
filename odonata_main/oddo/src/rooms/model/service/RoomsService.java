package rooms.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import rooms.model.DAO.RoomsDAO;
import rooms.model.vo.Rooms;
import rooms.model.vo.sooksoImg;

public class RoomsService {
    
    private RoomsDAO rDAO = new RoomsDAO();
    
    public int insertRooms(Rooms r, ArrayList<sooksoImg> ImgList) {
        Connection conn = getConnection();
        
        int result1 = rDAO.insertRooms(conn, r);
        int result2 = rDAO.insertsooksoImg(conn, ImgList);
        
        if (result1 > 0 || (result1 > 0 && result2 > 0)) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result1 + result2;
    }
    
    public int getListCount() {
        Connection conn = getConnection();
        
        int listCount = rDAO.getListCount(conn);
        
        close(conn);
        
        return listCount;
    }
    
    public ArrayList selectTList(int i) {
        Connection conn = getConnection();
        
        ArrayList list = null;
        
        if (i == 1) {
            list = rDAO.selectRList(conn);
        } else {
            list = rDAO.selectImgList(conn);
        }
        
        close(conn);
        
        return list;
    }
    
    public Rooms selectRooms(int Rooms_Code) {
        Connection conn = getConnection();
        
        Rooms room = rDAO.selectRooms(conn, Rooms_Code);
        
        if (room != null) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        return room;
    }
    
    public ArrayList<sooksoImg> selectSooksoImg(int Rooms_Code) {
        Connection conn = getConnection();
        
        ArrayList<sooksoImg> list = rDAO.selectSooksoImg(conn, Rooms_Code);
        
        close(conn);
        
        return list;
    }
}