package msg.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import msg.model.service.MessageService;

/**
 * Servlet implementation class DeleteMessageServlet
 */
@WebServlet("/deleteMessage.ms")
public class DeleteMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMessageServlet() {
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int mId = Integer.parseInt(request.getParameter("mId"));
        
        int result = new MessageService().deleteMessage(mId);
        
        if (result > 0)
            response.sendRedirect("msgBoxForm.ms");
        else {
            request.setAttribute("msg", "쪽지 삭제 실패");
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
