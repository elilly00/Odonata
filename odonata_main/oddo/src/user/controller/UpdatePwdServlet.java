package user.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UpdatePwdServlet
 */
@WebServlet(name = "UpdatePwdServlet", urlPatterns = "/updatePwd.us")
public class UpdatePwdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
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
        String userPwd = request.getParameter("uPwd");
        String newPwd = request.getParameter("newPwd1");
        
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("userId", userId);
        map.put("userPwd", userPwd);
        map.put("newPwd", newPwd);
        
        int result = new UserService().updatePwd(map);
        
        if (result > 0) {
            loginUser.setUser_pwd(newPwd);
            session.setAttribute("loginUser", loginUser);
            response.sendRedirect("myPageForm.us");
        } else {
            request.setAttribute("msg", "비밀번호 변경 실패");
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
