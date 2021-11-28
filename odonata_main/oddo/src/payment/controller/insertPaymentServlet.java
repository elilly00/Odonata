package payment.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.model.service.PaymentService;
import payment.model.vo.Payment;



/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/payment.bo")
public class insertPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int reservCode = Integer.parseInt(request.getParameter("reservCode"));
		
		// 체크인
		String checkInD = request.getParameter("checkIn");
		Date checkInDate = null;
		if(checkInD.equals("")) {
			checkInDate = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] splitCheckIn = checkInD.split("-");
			int year = Integer.parseInt(splitCheckIn[0]);
			int month = Integer.parseInt(splitCheckIn[1])-1;
			int day = Integer.parseInt(splitCheckIn[2]);
			
			checkInDate = new Date(new GregorianCalendar(year,month, day).getTimeInMillis());
		}
			
		// 체크아웃
		String checkOutD = request.getParameter("checkOut");
		Date checkOutDate = null;
		if(checkOutD.equals("")) {
			checkOutDate = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] splitCheckOut = checkOutD.split("-");
			int year = Integer.parseInt(splitCheckOut[0]);
			int month = Integer.parseInt(splitCheckOut[1])-1;
			int day = Integer.parseInt(splitCheckOut[2]);
					
			checkOutDate = new Date(new GregorianCalendar(year,month, day).getTimeInMillis());
		}
		
		int price = Integer.parseInt(request.getParameter("price")); 
		String person = request.getParameter("person");

		Payment payment = new Payment(0, null, reservCode, null, checkInDate, checkOutDate, price, person);
		
		int result = new PaymentService().insertPayment(payment);
		
		String page = null;
		if(result > 0) {
			// 결과값 보내기 : payment_finished로
			page="WEB-INF/view/payment/payment_finished.jsp";
			request.setAttribute("payment", payment);
		} else {
			// 에러페이지로 이동
			page="errorPage.jsp";
			request.setAttribute("msg", "결제를 실패했습니다");
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