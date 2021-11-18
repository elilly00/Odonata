package payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class paymentForm
 */
@WebServlet("/reservationPayment.do") //url다른거 없음 근데 왜 연결안돼냐고ㅠㅠ
public class paymentFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bName = request.getParameter("name"); // 주문자 이름
		int bTel = Integer.parseInt(request.getParameter("tel")); // 주문자 전화번호
		String bEmail = request.getParameter("email"); // 주문자 이메일
		int amount = Integer.parseInt(request.getParameter("")); // 숙소 가격 받아오기
		String rName = request.getParameter("");  // 숙소이름
		// 주문번호 따로 입력? 
		
		
		
		// i_mPort로 이동 : 가져갈 데이터가  필요하므로  forward 이용
		request.getRequestDispatcher("view/i_mPort.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
