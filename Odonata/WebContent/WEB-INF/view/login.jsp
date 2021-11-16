<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link rel="stylesheet" href="../style/login.css" />
    
  </head>

  <body>
    <nav class="main-navi">
        <a class="logoo" href="index.html">
        <img class="logoo" src="../img/logo.png" > </imgORA-02267: column type incompatible with referenced column type>
      </a>
      </div>
    </nav>

  <% if(loginUser == null){ %>
  <form id="loginForm" action="<%= request.getContextPath() %>/login.me" method="post">
    <div class="main-page">
      <div class="login-form">

        <form>
          <input
            type="text"
            name="email"
            class="text-field"
            placeholder="아이디"
          />

          <input
            type="password"
            name="password"
            class="text-field"
            placeholder="비밀번호"
          />

          <input type="submit" value="로그인" class="submit-btn" />

        </form>

        <div class="links">
          <a href="#">아이디 찾기 / 비밀번호 찾기</a>
        </div>

        <div class="links">
          <a href="register.html">회원가입</a>
        </div>
  </form>
  <%-- 로그인 할때 입력 끝--%>
  <% } else { %>
      <div id="userInfo" align="right">
			<label> <%= loginUser.getUserName() %> 님의 방문을 환영합니다. </label>
			<br clear="all">
			<div class="loginBtns">
				<%-- <input type="button" value="내 정보 보기" onclick="location.href='<%= request.getContextPath() %>/myPage.me'">
				<input type="button" value="로그 아웃" onclick="location.href =  '<%= request.getContextPath() %>/Logout.me'"> --%>
			</div>
		</div>
	<% } %>


      </div>
    </div>

    <script>
		function logout(){
			location.href='<%= request.getContextPath() %>/logout.me';
		}
		
		function memberJoin(){
			location.href='<%= request.getContextPath() %>/signUpForm.me';
		}
		
		function myPage(){
			location.href='<%= request.getContextPath() %>/myPage.me';
		}

		function goHome(){
			location.href='<%= request.getContextPath() %>';
		}
		function goNotice(){
			location.href='<%= request.getContextPath() %>/list.no';
		}	
		function goBoard(){
			location.href='<%= request.getContextPath() %>/list.bo';
		}	
		function goThumbnail(){
			location.href='<%= request.getContextPath() %>/list.th';
		}	
		
	</script>
  </body>
</html>
