package reserv.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserv.model.service.ResrvService;
import reserv.model.vo.Reserv;

/**
 * Servlet implementation class insertResrvServlet
 */
@WebServlet("/reservation.bo")
public class insertResrvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertResrvServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 받아올 값 : 체크인, 체크아웃, 인원, 가격
		
		// 체크인
		String checkIn = request.getParameter("checkIn");
		Date checkInDate = null;
		if(checkIn.equals("")) {
			checkInDate = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] splitCheckIn = checkIn.split("-");
			int year = Integer.parseInt(splitCheckIn[0]);
			int month = Integer.parseInt(splitCheckIn[1])-1;
			int day = Integer.parseInt(splitCheckIn[2]);
			
			checkInDate = new Date(new GregorianCalendar(year,month, day).getTimeInMillis());
		}
		
		// 체크아웃
		String checkOut = request.getParameter("checkOut");
		Date checkOutDate = null;
		if(checkOut.equals("")) {
			checkOutDate = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] splitCheckOut = checkOut.split("-");
			int year = Integer.parseInt(splitCheckOut[0]);
			int month = Integer.parseInt(splitCheckOut[1])-1;
			int day = Integer.parseInt(splitCheckOut[2]);
			
			checkOutDate = new Date(new GregorianCalendar(year,month, day).getTimeInMillis());
		}
		
		String personnel = request.getParameter("personnel");
		int rCode = Integer.parseInt(request.getParameter("roomCode"));
		int uCode = Integer.parseInt(request.getParameter("userCode"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		Reserv reserv = new Reserv(0, null, checkInDate, checkOutDate, personnel, rCode, uCode, price);
		
		int result = new ResrvService().insertReserv(reserv);
		
		String page = null;
		if(result > 0) {
			// 결과값 보내기 : Rv_design01로
			page = "WEB-INF/view/payment/Rv_design01.jsp";
			request.setAttribute("reserv", reserv);
		} else {
			// 에러 페이지로 이동
			page="errorPage.jsp";
			request.setAttribute("msg", "숙소 예약을 실패했습니다");
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
