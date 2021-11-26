package rooms.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import msg.model.vo.PageInfo;
import rooms.model.service.RoomsService;
import rooms.model.vo.Rooms;
import sooksoimg.model.vo.sooksoImg;

/**
 * Servlet implementation class FileListServlet
 */
@WebServlet("/list.re")
public class SearchResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RoomsService rService = new RoomsService();
        
        ArrayList<Rooms> rList = rService.selectTList(1); 		// 숙소
        ArrayList<sooksoImg> ImgList = rService.selectTList(2);   // 숙소 이미지
        
        String page = null;
        if (rList != null && ImgList != null) {
            request.setAttribute("rList", rList);
            request.setAttribute("ImgList", ImgList);
            page = "WEB-INF/view/rooms/Search_result.jsp";
        } else {
            request.setAttribute("msg", "검색 조회 실패");
            page = "WEB-INF/view/errorPage.jsp";
        }
        
        request.getRequestDispatcher(page).forward(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
    
}