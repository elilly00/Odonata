package main.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.msg.model.service.MessageService;
import main.msg.model.vo.Message;
import main.msg.model.vo.PageInfo;
import main.user.model.vo.User;

/**
 * Servlet implementation class MessageBoxFormServlet
 */
@WebServlet("/msgBoxForm.us")
public class MessageBoxFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageBoxFormServlet() {
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        String userId = loginUser.getUser_id();
        
        // 페이징 처리에 필요한 변수
        int listCount;      // 총 메세지 개수
        int currentPage;    // 현재 페이지
        int pageLimit;      // 한 페이지에서 보일 페이지 수
        int boardLimit;     // 한 페이지에서 보일 메세지 수
        int maxPage;        // 가장 마지막 페이지
        int startPage;      // 페이징이 된 페이지 중 시작 페이지
        int endPage;        // 페이징이 된 페이지 중 마지막 페이지
        
        MessageService mService = new MessageService();
        listCount = mService.getListCount(userId);
        
        currentPage = 1;
        if (request.getParameter("currentPage") != null)
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        
        pageLimit = 10;
        boardLimit = 10;
        
        maxPage = (int) Math.ceil((double) listCount / boardLimit);
        startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        endPage = startPage + pageLimit - 1;
        if (maxPage < endPage)
            endPage = maxPage;
        
        PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
        
        ArrayList<Message> list = mService.selectList(userId, pi);
        
        String page = null;
        if (list != null) {
            page = "WebContent/msg/messageBox.jsp";
            request.setAttribute("list", list);
            request.setAttribute("pi", pi);
        } else {
            page = "WebContent/errorPage.jsp";
            request.setAttribute("msg", "메세지 조회 실패");
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
