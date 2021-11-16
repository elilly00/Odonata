package main.user.controller;

import java.io.IOException;

import main.user.model.service.UserService;
import main.user.model.vo.User;

// import member.model.service.MemberService;


/**
 * Servlet implementation class LoginServlet 
 */
@WebServlet("/login.me")
// name="UpdatePwdServlet",urlPatterns=
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내용 기술

		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");

		User loginUser = new UserService().loginUser(userId, userPwd);

		// 1. SELECT COUNT(*) 를 사용하지 않은 이유 : 계정이 있다/ 없다만 판별하는게 아니라 계정 정보를 이용하기 위해서
		// 2. 계정 정보 이용에 첫 번쨰는 가지고 온 데이터를 메인 화면에 뿌리기 : forward()
		// 3. 로그인 후 다른 서비스를 이용할 때 계속해서 추가적인 로그인을 하지 않음 : request 영역이 아니라 session영역 활용

		if(loginUser != null) {
			// 로그인 성공시

			HttpSession session = request.getSession(); // session 영역
			session.setMaxInactiveInterval(600); // 10분 뒤 세션 종료
			session.setAttribute("loginUser",loginUser);
			// response.sendRedirect("index.jsp"); // 방법 1. 좋은 방법이 아니다 url 창에 그대로 나옴
			// request.getRequestDispatcher("index.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath()); // 방법 2. url 에 안나옴
		} else {
			// 로그인 실패시 에러 페이지로 넘어감

			request.setAttribute("msg", "로그인 실패");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			view.forward(request, response);

		}
		

		// 로그인에 대한 내용은 세션에 저장함 대대분



		// System.out.println(loginUser);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
