package user.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.model.service.UserService;
import user.model.vo.User;

// import member.model.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 *
 */
@WebServlet(name = "LoginServlet", urlPatterns = "/login.us")
// name="UpdatePwdServlet",urlPatterns=
public class LoginServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public LoginServlet() {}

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    String userId = request.getParameter("userId");
    String userPwd = request.getParameter("userPwd");

    User loginUser = new UserService().loginUser(userId, userPwd);

    if (loginUser != null) {
      HttpSession session = request.getSession();
      session.setMaxInactiveInterval(1200);
      session.setAttribute("loginUser", loginUser);
      response.sendRedirect(request.getContextPath());
    } else {
      request.setAttribute("msg", "아이디 또는 비밀번호가 다릅니다.");
      RequestDispatcher view = request.getRequestDispatcher("view/login.jsp");
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
