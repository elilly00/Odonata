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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="<%= request.getContextPath() %>/style/login.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/login.css" />

</head>

<body>
  <nav class="main-navi" style="background: #f2bba7;">
    <a href="<%= request.getContextPath() %>/WEB-INF/index.html">
      <div class="logo">
        <img src="<%= request.getContextPath() %>/img/public_img/logo.png" width="80px" height="80px" alt="잠자리"
          class="mx-2" />
      </div>
    </a>

    <div class="menu">
      <button type="button" onclick="location.href='login.html'" class="item menusolo hostdg">
        로그인/회원가입
      </button>
      <div class="item menusolo">
      </div>
      <div class="menu">
        <% if(loginUser == null) { %>
        <button type="button" onclick="location.href='<%= request.getContextPath() %>/loginForm.us'"
          class="item menusolo hostdg">
          로그인/회원가입
        </button>
        <% } else { %>
        <div id="userInfo" align="right">
          <%-- <label> <%= loginUser.getUser_name() %> 님의 방문을 환영합니다. </label>
          <br clear="all"> --%>
          <div class="menu">
            <%-- <input type="button" class="item menusolo hostdg" value="내 정보 보기" onclick="location.href='<%= request.getContextPath() %>/myPage.me'">
            --%>
            <input type="button" class="item menusolo hostdg" value="로그 아웃"
              onclick="location.href='<%= request.getContextPath() %>/logout.me'">
          </div>
        </div>
        <div class="item menusolo">
        </div>
        <div class="button" type="button" onclick="location.href='<%= request.getContextPath() %>/myPageForm.us'">
          <img class="profile" src="<%= request.getContextPath() %>/img/public_img/profile.png" alt="마이페이지"
            id="profile" />
        </div>
        <% } %>
      </div>
    </div>

  </nav>

  <div class="main-page">
    <div class="login-form">


      <form id="loginForm" action="<%=request.getContextPath()%>/login.us" method="post">

        <input type="text" name="userId" class="text-field" id="userId" placeholder="아이디" />

        <input type="password" name="userPwd" class="text-field" id="userPwd" placeholder="비밀번호" />

        <input type="submit" value="로그인" class="submit-btn" />


      </form>


      <div class="links">
        <a href="<%= request.getContextPath() %>/idfindForm.us">아이디 찾기</a>
      </div>
      <br>
      <div class="links">
        <a href="<%= request.getContextPath() %>/pwdfindForm.us">비밀번호 찾기</a>
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