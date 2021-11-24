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
//		
		// 주문자 이름, 전화번호, 이메일, 숙소이름, 게스트 수, 체크인, 체크아웃은 RESERV테이블에 INSERT
		int price = Integer.parseInt(request.getParameter("price")); // 숙소 가격 
		int vCode = Integer.parseInt(request.getParameter("vCode"));
		// NumberFormatException : 숫자 형식의 오류
		// -> [0] 바이트에서 시작하고 [11] 바이트에서 끝나며 값이 [=price=1000]인, 유효하지 않은 chunk는 무시됩니다. 
		// : 값이 왜 저렇게 들어갔지 => location.href로 보낼때 ?뒤에 =이 있었음

		Payment payment = new Payment(0, vCode, price, null, null);
		
		int result = new PaymentService().insertPayment(payment);
		
		String page = null;
		if(result > 0) {
			// 결과값 보내기 : payment_finished로
			page="view/payment/payment_finished.jsp";
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
