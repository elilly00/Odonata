<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- <%@ page import="user.model.vo.User"%>

<% 
  
  User loginUser = (User)session.getAttribute("loginUser"); 
%> --%>

<!DOCTYPE html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>login</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link rel="stylesheet" href="<%= request.getContextPath() %>/style/login.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/login.css" />
    
  </head>

  <body>
    <nav class="main-navi">
        <a class="logoo" href="<%= request.getContextPath() %>/index.jsp">
        <img class="logoo" src="<%= request.getContextPath() %>/img/logo.png" > 
      </a>
      </div>
    </nav>

    <div class="main-page">
      <div class="login-form">

  
  <form id="loginForm" action="<%=request.getContextPath()%>/login.us" method="post">
        
          <input
            type="text"
            name="userId"
            class="text-field"
            id="userId"
            placeholder="아이디"
          />

          <input
            type="password"
            name="userPwd"
            class="text-field"
            id="userPwd"
            placeholder="비밀번호"
          />

          <input type="submit" value="로그인" class="submit-btn" />

        
  </form>
  

        <div class="links">
          <a href="<%= request.getContextPath() %>view/user/user_id_find.jsp">아이디 찾기</a>
        </div>
<br>
        <div class="links">
          <a href="<%= request.getContextPath() %>view/user/user_pwd_find.jsp">비밀번호 찾기</a>
        </div>
<br>
        <div class="links">
          <a href="<%= request.getContextPath() %>/signUpForm.us">회원가입</a>
        </div>


      </div>
    </div>

    <script>
		
		
	</script>
  </body>
</html>
