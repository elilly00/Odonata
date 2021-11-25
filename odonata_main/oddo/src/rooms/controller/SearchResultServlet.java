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
        // int listCount;
        // int currentPage;
        // int pageLimit;
        // int boardLimit;
        // int maxPage;
        // int startPage;
        // int endPage;
        
        RoomsService rService = new RoomsService();
        
        // listCount = rService.getListCount(); // �� �Խñ� ���� 
        
        // currentPage = 1;
        // if (request.getParameter("currentPage") != null) {
        //     currentPage = Integer.parseInt(request.getParameter("currentPage"));
        // }
        
        // pageLimit = 5;
        // boardLimit = 4;
        
        // maxPage = (int) Math.ceil((double) listCount / boardLimit);
        // startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        // endPage = startPage + (pageLimit - 1);
        // if (maxPage < endPage) {
        //     endPage = maxPage;
        // }
        
        // PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
        
        ArrayList<Rooms> rList = rService.selectTList(1); 		// 숙소
        ArrayList<sooksoImg> ImgList = rService.selectTList(2);   // 숙소 이미지
        
        String page = null;
        if (rList != null && sList != null) {
            request.setAttribute("rList", rList);
            request.setAttribute("ImgListfList", ImgList);
            // request.setAttribute("pi", pi);
            page = "WEB-INF/view/search_result.jsp";
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