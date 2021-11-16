package main.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

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
  protected void doGet(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("userId");
    String userPwd = request.getParameter("userPwd");

    User loginUser = new UserService().loginUser(userId, userPwd);

    if (loginUser != null) {
      HttpSession session = request.getSession();
      session.setMaxInactiveInterval(1200);
      session.setAttribute("loginUser", loginUser);
      response.sendRedirect(request.getContextPath());
    } else {
      request.setAttribute("msg", "로그인 실패");
      RequestDispatcher view = request.getRequestDispatcher(
        "WEB-INF/views/common/errorPage.jsp"
      );
      view.forward(request, response);
    }
  }

  protected void doPost(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    doGet(request, response);
  }
}
