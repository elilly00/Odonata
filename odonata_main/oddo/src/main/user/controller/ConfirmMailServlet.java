package main.user.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ConfirmMailServlet
 */
@WebServlet("/confirmMail.us")
public class ConfirmMailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmMailServlet() {
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String receiver = request.getParameter("email") + request.getParameter("domain");
        String title = "[잠자리] 유효 메일 확인";
        String content = "잠자리 회원님의 메일이 <b>유효한지 확인</b>하기 위한 메일입니다.";
        String host = "smtp.google.com";
        String sender = "";         // 확인 메일 전송용 이메일 주소
        String senderPwd = "";      // 확인 메일 전송용 이메일 계정 비밀번호
        
        Properties prop = new Properties();
        prop.setProperty("mail.smtp.host", host);
        prop.setProperty("mail.smtp.auth", "true");
        
        Session session = Session.getDefaultInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, senderPwd);
            }
        });
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
            message.setSubject(title);
            message.setText(content, "UTF-8", "html");
            
            Transport.send(message);
            
            response.getWriter().println("success");
        } catch (AddressException e) {
            e.printStackTrace();
            response.getWriter().println("fail");
        } catch (MessagingException e) {
            e.printStackTrace();
            response.getWriter().println("fail");
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
