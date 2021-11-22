package payment.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import  payment.model.service.PaymentService;
import payment.model.vo.Payment;



/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/payment.bo")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
//		
		String pName = request.getParameter("pName"); // 주문자 이름
		int pTel = Integer.parseInt(request.getParameter("pTel")); // 주문자 전화번호
		String pEmail = request.getParameter("pEmail"); // 주문자 이메일
		String rName = request.getParameter("rName");  // 숙소이름
		int price = Integer.parseInt(request.getParameter("price")); // 숙소 가격 
		String rGuest = request.getParameter("rGuest"); // 게스트 수 : 배열로 가야할지 단독?으로 가야할지 미정
		
		String checkIn = request.getParameter("checkIn"); // 체크인
		String checkOut = request.getParameter("checkOut");  // 체크아웃
		
		Date checkInDate = null;
		if(checkIn.equals("")) { //음... date가 비어있을수가 없긴한데...
			checkInDate = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] splitCheckIn = checkIn.split("-");
			int year = Integer.parseInt(splitCheckIn[0]);
			int month = Integer.parseInt(splitCheckIn[1])-1;
			int day = Integer.parseInt(splitCheckIn[2]);
			
			checkInDate = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		}
		
		Date checkOutDate = null;
		if(checkOut.equals("")) { //음... date가 비어있을수가 없긴한데...
			checkOutDate = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] splitCheckOut = checkOut.split("-");
			int year = Integer.parseInt(splitCheckOut[0]);
			int month = Integer.parseInt(splitCheckOut[1])-1;
			int day = Integer.parseInt(splitCheckOut[2]);
			
			checkOutDate = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		}

		Payment payment = new Payment(0, pName, pTel, pEmail, rName, checkInDate, checkOutDate, rGuest, null, null);
		
		int result = new PaymentService().insertPayment(payment);
		
		String page = null;
		if(result > 0) {
			// 결과값 보내기 : payment_finished로
			page="view/payment_finished.jsp";
			request.setAttribute("payment", payment);
		} else {
			// 에러페이지로 이동
			page="WEB-INF/errorPage.jsp";
			request.setAttribute("msg", "결제를 실패했습니다");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
