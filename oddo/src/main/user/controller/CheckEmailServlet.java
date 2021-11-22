package main.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.user.model.service.UserService;

/**
 * Servlet implementation class CheckEmailServlet
 */
@WebServlet("/checkEmail.us")
public class CheckEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailServlet() {
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String inputEmail = request.getParameter("inputEmail") + request.getParameter("inputDomain");
        
        int result = new UserService().checkEmail(inputEmail);
        
        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();
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
