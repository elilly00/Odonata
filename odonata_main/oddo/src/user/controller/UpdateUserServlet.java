package user.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/updateUser.us")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = ((User) request.getSession().getAttribute("loginUser")).getUser_id();
        String userName = request.getParameter("uName");
        String userEmail = request.getParameter("uEmailId") + request.getParameter("uEmailDomain");
        String userPhone = request.getParameter("uPhone");
        String uBirth = request.getParameter("uBirth");
        String[] splitDate = uBirth.split("-");
        int year = Integer.parseInt(splitDate[0]);
        int month = Integer.parseInt(splitDate[1]) - 1;
        int day = Integer.parseInt(splitDate[2]);
        Date userBirth = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
        
        User u = new User();
        u.setUser_id(userId);
        u.setUser_name(userName);
        u.setUser_email(userEmail);
        u.setUser_phone(userPhone);
        u.setUser_birth(userBirth);
        
        int result = new UserService().updateUser(u);
        
        if (result > 0) {
            User loginUser = new UserService().selectUser(userId);
            request.getSession().setAttribute("loginUser", loginUser);
            response.sendRedirect("myPageForm.us");
        } else {
            request.setAttribute("msg", "회원정보 수정 실패");
            request.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(request, response);
        }
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
}
