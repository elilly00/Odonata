package rooms.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rooms.model.service.RoomsService;
import rooms.model.vo.Rooms;
import rooms.model.vo.sooksoImg;

/**
 * Servlet implementation class RoomPageServlet
 */
@WebServlet("/detail.ro")
public class RoomPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rCd = Integer.parseInt(request.getParameter("rCd"));
		
		// 사진게시판 상세조회이기 때문에 Board와 관련된 것과 image에 관련된 것들을 가져 와야함
		RoomsService service = new RoomsService();
		Rooms room = service.selectRooms(rCd);
		ArrayList<sooksoImg> ImgList = service.selectSooksoImg(rCd);
		
		String page = null;
		if(room != null) {
			request.setAttribute("room", room);
			request.setAttribute("ImgList", ImgList);
			page = "WEB-INF/view/rooms/Roompage_guest.jsp";
		} else {
			request.setAttribute("msg", "숙소 상세보기 실패");
			page = "WEB-INF/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}