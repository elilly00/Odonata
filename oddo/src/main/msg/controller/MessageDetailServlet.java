package main.msg.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import msg.model.service.MessageService;
import msg.model.vo.Message;

/**
 * Servlet implementation class MessageDetailServlet
 */
@WebServlet("/msgDetail.ms")
public class MessageDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageDetailServlet() {
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int mId = Integer.parseInt(request.getParameter("mId"));
        
        Message msg = new MessageService().selectMessage(mId);
        
        String page = null;
        if (msg != null) {
            page = "WEB-INF/views/msg/messageBox.jsp";
            request.setAttribute("msgDetail", msg);
        } else {
            page = "WEB-INF/views/common/errorPage.jsp";
            request.setAttribute("msg", "쪽지 상세보기 실패");
        }
        request.getRequestDispatcher(page).forward(request, response);
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
