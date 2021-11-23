package main.rooms.model.service;

import static main.common.JDBCTemplate.close;
import static main.common.JDBCTemplate.commit;
import static main.common.JDBCTemplate.getConnection;
import static main.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import main.rooms.model.DAO.RoomsDAO;
import main.rooms.model.vo.Rooms;
import main.sooksoimg.model.vo.sooksoImg;

public class RoomsService {
    
    private RoomsDAO rDAO = new RoomsDAO();
    
    public int insertRooms(Rooms r, ArrayList<sooksoImg> ImgList) {
        Connection conn = getConnection();
        
        int result1 = rDAO.insertRooms(conn, r);
        int result2 = rDAO.insertsooksoImg(conn, ImgList);
        
        if (result1 > 0 && result2 > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        close(conn);
        
        return result1 + result2;
    }
    
    public int getListCount() {  // ��ü �� ����Ʈ 
        Connection conn = getConnection();
        
        int listCount = rDAO.getListCount(conn);
        
        close(conn);
        
        return listCount;
    }
    
    public ArrayList selectTList(int i) {
        Connection conn = getConnection();
        
        ArrayList list = null;
        
        if (i == 1) {
            list = rDAO.selectRList(conn);	// �Խñ�
        } else {
            list = rDAO.selectFList(conn);	// ����
        }
        
        close(conn);
        
        return list;
    }
}