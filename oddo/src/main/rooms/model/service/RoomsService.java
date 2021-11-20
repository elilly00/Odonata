package main.rooms.model.service;

import static main.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import main.rooms.model.dao.RoomsDAO;
import main.rooms.model.vo.PageInfo;
import main.rooms.model.vo.ResultPage;
import main.rooms.model.vo.Rooms;
import main.sooksoimg.model.vo.sooksoImg;

public class RoomsService {
	
    private RoomsDAO rDAO = new RoomsDAO();
    
    public int insertRooms(Rooms room, ArrayList<sooksoImg> ImgList) {
		Connection conn = getConnection();
		
		int result1 = rDAO.insertRooms(conn, room);
		int result2 = rDAO.insertsooksoImg(conn, ImgList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 + result2;
	}