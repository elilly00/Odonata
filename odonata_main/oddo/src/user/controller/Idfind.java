package user.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.model.service.UserService;
import user.model.vo.User;

// import member.model.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 *
 */
@WebServlet("/idfind.us")
// name="UpdatePwdServlet",urlPatterns=
public class Idfind extends HttpServlet {

  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public Idfind() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String email = request.getParameter("email");

    User id = new UserService().idfind(name, email);

    request.setAttribute("id", id);

    if (id == null) {
      request.setAttribute("msg", "아이디 찾기 실패");
      RequestDispatcher view = request.getRequestDispatcher(
        "WEB-INF/view/user/user_id_find.jsp"
      );
      view.forward(request, response);
    } else {
      response.sendRedirect(request.getContextPath());
      RequestDispatcher view = request.getRequestDispatcher(
        "WEB-INF/view/user/user_id_find_form.jsp"
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
