package reserv.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserv.model.service.ResrvService;
import reserv.model.vo.Reserv;
import user.model.vo.User;

/**
 * Servlet implementation class MyResrvFormServlet
 */
@WebServlet("/myResrvForm.rv")
public class MyResrvFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyResrvFormServlet() {
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userCode = ((User) request.getSession().getAttribute("loginUser")).getUser_code();
        
        ArrayList<Reserv> yList = new ResrvService().selectResrvY(userCode);
        ArrayList<Reserv> List = new ResrvService().selectResrvAll(userCode);
        
        request.setAttribute("myResrvY", yList);
        request.setAttribute("myResrvAll", List);
        request.getRequestDispatcher("WEB-INF/view/user/myRevPage.jsp").forward(request, response);
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
