package msg.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import msg.model.service.MessageService;
import msg.model.vo.Message;

/**
 * Servlet implementation class InsertMsgServlet
 */
@WebServlet("/insertMSG.ms")
public class InsertMsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMsgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Message_Title = request.getParameter("title");
		String Message_Text = request.getParameter("text");
		
		Message msg = new Message();
		msg.setMessage_Title(Message_Title);
		msg.setMessage_Text(Message_Text);
		
		int result = new MessageService().insertMessage(msg);
		
		if(result > 0) {
			response.sendRedirect("msgDetail.ms");
		} else {
			request.setAttribute("msg", "쪽지 보내기 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
