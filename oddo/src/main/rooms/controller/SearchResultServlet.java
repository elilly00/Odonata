package main.rooms.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.rooms.model.service.RoomsService;
import main.rooms.model.vo.PageInfo;
import main.rooms.model.vo.Rooms;
import main.sooksoimg.model.vo.sooksoImg;

/**
 * Servlet implementation class FileListServlet
 */
@WebServlet("/list.re")
public class FileListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		RoomsService rService = new RoomsService();
		
		listCount = rService.getListCount(); // 총 게시글 개수 
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) { 
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 4;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + (pageLimit - 1);
		if(maxPage < endPage) { 
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Rooms> rList = rService.selectTList(1); 		// 게시글
		ArrayList<sooksoImg> sList = rService.selectTList(2);   // 사진
		
		String page = null;
		if(rList != null && sList != null) {
			request.setAttribute("rList", rList);
			request.setAttribute("fList", sList);
			request.setAttribute("pi", pi);
			page = "WEB-INF/view/search_result.jsp";
		} else {
			request.setAttribute("msg", "검색 결과 조회 실패");
			page = "WEB-INF/view/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}