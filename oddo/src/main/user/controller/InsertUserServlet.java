package main.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.user.model.service.UserService;
import main.user.model.vo.User;

/**
 * Servlet implementation class InsertUserServlet
 */
@WebServlet(name = "InsertUserServlet", urlPatterns = "/insert.us")
public class InsertUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUserServlet() {
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("uId");
        String userPwd = request.getParameter("uPwd1");
        String userName = request.getParameter("uName");
        String userEmail = request.getParameter("uEmailId") + request.getParameter("uEmailDomain");
        String userPhone = request.getParameter("uPhone");
        String uBirth = request.getParameter("uBirth");
        String[] splitDate = uBirth.split("-");
        int year = Integer.parseInt(splitDate[0]);
        int month = Integer.parseInt(splitDate[1]) - 1;
        int day = Integer.parseInt(splitDate[2]);
        Date userBirth = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
        
        User u = new User(0, userName, userPwd, userEmail, userPhone, userBirth, userId, null, '\u0000');
        
        int result = new UserService().insertUser(u);
        
        if (result > 0)
            response.sendRedirect("index.jsp");
        else {
            request.setAttribute("msg", "회원가입 실패");
            request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
